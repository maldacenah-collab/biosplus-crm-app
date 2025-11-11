// src/services/cliente360Api.ts
import { supabase } from './supabase';
import { Contact, Pedido, Opportunity, TimelineEvent, MovimientoCtaCorrienteCliente } from '../types';

export const getClientDetails = async (id: number): Promise<Contact | null> => {
  const { data, error } = await supabase
    .from('contactos')
    .select('*, vendedores(*, perfiles(nombre))')
    .eq('id', id)
    .single();
  if (error) throw error;
  return data;
};

export const getClientKpis = async (id: number) => {
  const { data, error } = await supabase.rpc('get_kpis_cliente', { p_contacto_id: id }).single();
  if (error) throw error;
  return data;
};

export const getClientTimeline = async (id: number): Promise<TimelineEvent[]> => {
  const { data, error } = await supabase.rpc('get_contact_timeline', { p_contact_id: id });
  if (error) throw error;
  return data || [];
};

export const getClientPedidos = async (id: number): Promise<Pedido[]> => {
    const { data, error } = await supabase
        .from('pedidos')
        .select('*, estados_pedido(nombre)')
        .eq('contacto_id', id)
        .order('created_at', { ascending: false });
    if (error) throw error;
    return data || [];
};

export const getClientOportunidades = async (id: number): Promise<Opportunity[]> => {
    const { data, error } = await supabase
        .from('oportunidades')
        .select('*, etapas_venta(nombre)')
        .eq('contacto_id', id)
        .order('created_at', { ascending: false });
    if (error) throw error;
    return data || [];
};

export const getClientCuentaCorriente = async (id: number): Promise<MovimientoCtaCorrienteCliente[]> => {
    const { data, error } = await supabase.rpc('get_movimientos_cliente', { p_contacto_id: id });
    if (error) throw error;
    return data || [];
};

export const addInteraction = async (interactionData: { contacto_id: number; tipo: string; resumen: string; user_id: string; fecha_proximo_seguimiento?: string; }) => {
    const { data, error } = await supabase.from('interacciones').insert([interactionData]).select().single();
    if (error) throw error;
    // Also update the last contact date on the contact
    await supabase.from('contactos').update({ fecha_ultimo_contacto: new Date().toISOString() }).eq('id', interactionData.contacto_id);
    return data;
}
