// src/services/opportunitiesApi.ts
import { supabase } from './supabase';
import { Opportunity } from '../types';

export const getOpportunities = async (): Promise<Opportunity[]> => {
  const { data, error } = await supabase
    .from('oportunidades')
    .select('*, contactos(id, nombre), etapas_venta(id, nombre), vendedores(*, perfiles(nombre))')
    .order('created_at', { ascending: false });
  
  if (error) {
    console.error('Error fetching opportunities:', error);
    throw error;
  }
  return data || [];
};

export const getOpportunityById = async (id: number): Promise<Opportunity> => {
    const { data, error } = await supabase
      .from('oportunidades')
      .select('*, contactos(*), etapas_venta(*), vendedores(*, perfiles(nombre))')
      .eq('id', id)
      .single();
    
    if (error) {
      console.error(`Error fetching opportunity ${id}:`, error);
      throw error;
    }
    return data;
};

export const upsertOpportunity = async (opportunityData: Partial<Opportunity>): Promise<Opportunity> => {
    const { id, ...dataForDb } = opportunityData;
    
    // Se simplifica la query para asegurar la correcta inferencia de tipos por parte de Supabase,
    // resolviendo el problema que causaba que 'contactos' se devolviera como un array.
    const selectQuery = '*, contactos(*), etapas_venta(*), vendedores(*, perfiles(nombre))';

    if (id) {
        // Update
        const { data, error } = await supabase
            .from('oportunidades')
            .update(dataForDb)
            .eq('id', id)
            .select(selectQuery)
            .single();
        if (error) {
            console.error('Error updating opportunity:', error);
            throw error;
        }
        return data;
    } else {
        // Create
        const { data, error } = await supabase
            .from('oportunidades')
            .insert(dataForDb)
            .select(selectQuery)
            .single();
        if (error) {
            console.error('Error creating opportunity:', error);
            throw error;
        }
        return data;
    }
};

export const deleteOpportunity = async (id: number): Promise<void> => {
    const { error } = await supabase
      .from('oportunidades')
      .delete()
      .eq('id', id);

    if (error) {
        console.error('Error deleting opportunity:', error);
        throw error;
    }
};

export const getNextProposalNumber = async (): Promise<number> => {
    const { data, error } = await supabase
      .from("oportunidades")
      .select("numero_propuesta")
      .order("numero_propuesta", { ascending: false })
      .limit(1)
      .single();

    if (error && error.code !== "PGRST116") { // PGRST116 = no rows found
        console.error("Error fetching next proposal number:", error);
        return 1;
    }
    return (data?.numero_propuesta || 0) + 1;
};

export const requestPriceApproval = async (
  opportunityId: number,
  solicitudes: { producto_id: number; precio_solicitado: number }[],
  justificacion: string
): Promise<{ whatsapp_base_link: string, token: string }> => {
  const { data, error } = await supabase.rpc('solicitar_aprobacion_masiva', {
    p_oportunidad_id: opportunityId,
    p_solicitudes: solicitudes,
    p_justificacion: justificacion,
  });

  if (error) {
    console.error('Error requesting price approval:', error);
    throw error;
  }
  return data;
};
