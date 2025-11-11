// src/main.tsx
// Punto de entrada de la aplicación React.

import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './styles/index.css'

// --- INICIO DE LA REACTIVACIÓN DEL SERVICE WORKER ---
// Se implementa un registro limpio para la funcionalidad offline.
if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker.register('/sw.js')
      .then(registration => {
        console.log('Service Worker registrado con éxito:', registration);
      })
      .catch(registrationError => {
        console.log('Fallo en el registro del Service Worker:', registrationError);
      });
  });
}
// --- FIN DE LA REACTIVACIÓN ---

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
