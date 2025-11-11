// src/utils/db.ts

const DB_NAME = 'crm-db';
const DB_VERSION = 3;
const STORES = ['contacts', 'opportunities', 'pedidos', 'products', 'salespeople', 'statuses', 'paymentConditions', 'salesStages', 'lotes', 'bankAccounts', 'sharedConfig', 'estadosPedido', 'depositos', 'stock_vendedores', 'providers', 'roles', 'organizaciones'];

let db: IDBDatabase;

export function openDB(): Promise<IDBDatabase> {
  return new Promise((resolve, reject) => {
    if (db) {
      return resolve(db);
    }

    const request = indexedDB.open(DB_NAME, DB_VERSION);

    request.onerror = (event) => {
      console.error("IndexedDB error:", event);
      reject("Error opening DB");
    };

    request.onsuccess = (event) => {
      db = (event.target as IDBOpenDBRequest).result;
      resolve(db);
    };

    request.onupgradeneeded = (event) => {
      const dbInstance = (event.target as IDBOpenDBRequest).result;
      STORES.forEach(storeName => {
        if (!dbInstance.objectStoreNames.contains(storeName)) {
          dbInstance.createObjectStore(storeName, { keyPath: 'id', autoIncrement: true });
        }
      });
    };
  });
}

export async function saveData<T>(storeName: string, data: T[]): Promise<void> {
  const db = await openDB();
  return new Promise((resolve, reject) => {
    const transaction = db.transaction(storeName, 'readwrite');
    const store = transaction.objectStore(storeName);
    
    // Limpiamos el store antes de guardar los nuevos datos
    store.clear();

    data.forEach(item => {
      store.put(item);
    });

    transaction.oncomplete = () => {
      resolve();
    };

    transaction.onerror = (event) => {
      console.error(`Error saving data to ${storeName}:`, event);
      reject(`Error saving data to ${storeName}`);
    };
  });
}

export async function loadData<T>(storeName: string): Promise<T[]> {
  const db = await openDB();
  return new Promise((resolve, reject) => {
    const transaction = db.transaction(storeName, 'readonly');
    const store = transaction.objectStore(storeName);
    const request = store.getAll();

    request.onsuccess = () => {
      resolve(request.result || []);
    };

    request.onerror = (event) => {
      console.error(`Error loading data from ${storeName}:`, event);
      reject(`Error loading data from ${storeName}`);
    };
  });
}