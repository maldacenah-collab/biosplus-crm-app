// src/services/zonasEnvioApi.ts
import { supabase } from './supabase';
import { ZonaEnvio } from '../types';

export const getZonasEnvio = async (): Promise<ZonaEnvio[]> => {
  const { data, error } = await supabase.rpc('get_zonas_envio_con_geojson');
  
  if (error) {
    console.error('Error fetching shipping zones:', error);
    throw error;
  }
  return (data as any) || [];
};

export const upsertZonaEnvio = async (zonaData: Partial<ZonaEnvio>): Promise<ZonaEnvio> => {
    // La RPC espera un objeto JSON, no es necesario hacer stringify aquí.
    const { data, error } = await supabase.rpc('upsert_zona_envio', { p_zona_data: zonaData });

    if (error) {
        console.error('Error upserting shipping zone via RPC:', error);
        throw new Error(`Error al guardar la zona de envío: ${error.message}`);
    }
    
    // La RPC devuelve un array, tomamos el primer elemento.
    if (!data || data.length === 0) {
        throw new Error("La operación en la base de datos no devolvió la zona guardada.");
    }
    
    return data[0] as any;
};

export const deleteZonaEnvio = async (id: number): Promise<void> => {
    const { error } = await supabase
        .from('zonas_envio')
        .delete()
        .eq('id', id);
    
    if (error) {
        console.error('Error deleting shipping zone:', error);
        throw error;
    }
};
