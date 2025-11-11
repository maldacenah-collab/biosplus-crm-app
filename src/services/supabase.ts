// src/services/supabase.ts
// Este archivo centraliza la creación del cliente de Supabase.
// Se asegura de que solo haya una instancia del cliente en toda la aplicación.

import { createClient } from '@supabase/supabase-js';

// Obtenemos las variables de entorno definidas en el archivo .env
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

// Verificamos que las variables de entorno estén presentes para evitar errores.
if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error("Las variables de entorno de Supabase (VITE_SUPABASE_URL y VITE_SUPABASE_ANON_KEY) no están configuradas.");
}

// Creamos y exportamos la única instancia del cliente de Supabase.
// Esta instancia será importada por todas las capas de servicios (ej. contactsApi.ts).
export const supabase = createClient(supabaseUrl, supabaseAnonKey);
