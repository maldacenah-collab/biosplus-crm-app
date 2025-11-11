// src/services/proveedoresApi.ts
import { supabase } from './supabase';
import { Provider } from '../types';

const PROVIDERS_PER_PAGE = 30;

export const getProviders = async (offset: number, searchTerm?: string): Promise<Provider[]> => {
  let query = supabase
    .from('proveedores')
    .select('*')
    .order('nombre', { ascending: true })
    .range(offset, offset + PROVIDERS_PER_PAGE - 1);

  if (searchTerm) {
    query = query.ilike('nombre', `%${searchTerm}%`);
  }

  const { data, error } = await query;
  
  if (error) {
    console.error('Error fetching providers:', error);
    throw error;
  }
  return data || [];
};

/**
 * Utiliza una función RPC 'upsert_provider_with_relations' para crear o actualizar un proveedor
 * y sus relaciones (contactos, cuentas bancarias) en una única transacción atómica.
 * @param providerData - El objeto completo del proveedor, incluyendo `contactos` y `cuentas`.
 * @returns El proveedor guardado.
 */
export const upsertProvider = async (providerData: Partial<Provider>): Promise<Provider> => {
    const { data, error } = await supabase.rpc('upsert_provider_with_relations', {
        p_provider_data: providerData
    });

    if (error) {
        console.error('Error upserting provider details:', error);
        throw error;
    }
    
    // La RPC devuelve un array, tomamos el primer elemento que es el proveedor insertado/actualizado.
    return data[0];
};

export const deleteProvider = async (providerId: string): Promise<void> => {
    const { error } = await supabase
        .from('proveedores')
        .delete()
        .eq('id', providerId);
    if (error) {
        console.error('Error deleting provider:', error)
        throw error;
    }
};