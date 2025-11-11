// sw.js - Robust Version v2.2
const CACHE_NAME = 'biosplus-crm-cache-v2.2';
const API_HOSTS = ['jsbgutbsckwintsnhnno.supabase.co', 'maps.googleapis.com'];
const APP_SHELL_URLS = [
  '/',
  '/index.html',
  // Los assets con hash de Vite (como main.tsx, index.css) se cachearán dinámicamente.
];

self.addEventListener('install', event => {
  console.log('[Service Worker] Installing...');
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log('[Service Worker] Caching App Shell');
        return cache.addAll(APP_SHELL_URLS);
      })
      .then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', event => {
  console.log('[Service Worker] Activating...');
  const cacheWhitelist = [CACHE_NAME];
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          if (cacheWhitelist.indexOf(cacheName) === -1) {
            console.log('[Service Worker] Deleting old cache:', cacheName);
            return caches.delete(cacheName);
          }
        })
      );
    }).then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', event => {
  const url = new URL(event.request.url);

  // For non-GET requests (like POST), we can't cache them.
  // We go network-only. No offline fallback for mutations.
  if (event.request.method !== 'GET') {
    event.respondWith(fetch(event.request));
    return;
  }

  // Estrategia 1: Network first para API y navegación principal (ahora solo para GET)
  if (API_HOSTS.includes(url.hostname) || event.request.mode === 'navigate') {
    event.respondWith(
      fetch(event.request)
        .then(networkResponse => {
          // Si la respuesta es válida, la cacheamos y la devolvemos
          if (networkResponse && networkResponse.ok) {
            const responseToCache = networkResponse.clone();
            caches.open(CACHE_NAME).then(cache => {
              cache.put(event.request, responseToCache);
            });
          }
          return networkResponse;
        })
        .catch(() => {
          // Si la red falla, intentamos servir desde el caché
          return caches.match(event.request).then(cachedResponse => {
            if (cachedResponse) {
              return cachedResponse;
            }
            // Si tampoco está en caché, devolvemos una respuesta de error (para APIs)
            if (API_HOSTS.includes(url.hostname)) {
                return new Response(
                    JSON.stringify({ error: 'You are offline and this resource is not cached.' }),
                    { headers: { 'Content-Type': 'application/json' }, status: 503 }
                );
            }
            // Para navegación, podríamos devolver una página offline, pero por ahora dejamos que el navegador maneje el error.
            return new Response("Offline", { status: 503, statusText: "Offline" });
          });
        })
    );
    return;
  }

  // Estrategia 2: Cache first para assets estáticos (JS, CSS, fuentes, imágenes) (ahora solo para GET)
  event.respondWith(
    caches.match(event.request).then(cachedResponse => {
      if (cachedResponse) {
        return cachedResponse;
      }
      return fetch(event.request).then(networkResponse => {
        if (networkResponse && networkResponse.status === 200) {
          const responseToCache = networkResponse.clone();
          caches.open(CACHE_NAME).then(cache => {
            cache.put(event.request, responseToCache);
          });
        }
        return networkResponse;
      });
    })
  );
});