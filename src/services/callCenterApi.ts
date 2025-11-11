// src/services/callCenterApi.ts
import { supabase } from './supabase';
import { ContactForPrediction } from '../types';

export const getContactsForPrediction = async (vendedorId: number): Promise<ContactForPrediction[]> => {
  // Se llama a una función RPC de Supabase que obtiene los datos relevantes de los contactos.
  const { data, error } = await supabase.rpc('get_contactos_vendedor', {
    p_vendedor_id: vendedorId
  });

  if (error) {
    console.error('Error fetching contacts for prediction:', error);
    throw error;
  }
  
  return (data as any) || [];
};