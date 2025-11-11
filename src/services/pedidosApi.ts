// src/services/pedidosApi.ts
import { supabase } from './supabase';
import { Pedido, ZonaEnvio } from '../types';

export const getPedidos = async (): Promise<Pedido[]> => {
  const { data, error } = await supabase
    .from('pedidos')
    .select('*, oportunidad_id, contactos(id, nombre), estados_pedido(id, nombre)')
    .order('created_at', { ascending: false });

  if (error) {
    console.error('Error fetching pedidos:', error);
    throw error;
  }
  return data || [];
};

export const getPedidoById = async (id: number): Promise<Pedido> => {
    const { data, error } = await supabase
        .from('pedidos')
        .select('*, contactos(*), vendedores(*, perfiles(nombre)), estados_pedido(*), logistica_envios(*)')
        .eq('id', id)
        .single();
    if (error) throw error;
    return data;
};

export const upsertPedido = async (pedidoData: Partial<Pedido>): Promise<Pedido> => {
    const { id, logistica_envios, ...dataForDb } = pedidoData;

    // Eliminamos el campo que no existe en la base de datos antes de enviarlo.
    delete (dataForDb as any).costo_envio;

    if (id) {
        // Update
        const { data, error } = await supabase
            .from('pedidos')
            .update(dataForDb)
            .eq('id', id)
            .select('*, contactos(id, nombre), estados_pedido(id, nombre)')
            .single();
        if (error) {
            console.error('Error updating pedido:', error);
            throw error;
        }
        return data;
    } else {
        // Create
        const { data, error } = await supabase
            .from('pedidos')
            .insert(dataForDb)
            .select('*, contactos(id, nombre), estados_pedido(id, nombre)')
            .single();
        if (error) {
            console.error('Error creating pedido:', error);
            throw error;
        }
        return data;
    }
};

export const generarNumeroPedido = async (depositoId: number): Promise<string> => {
    const { data, error } = await supabase.rpc("generar_nuevo_numero_pedido", { id_deposito_param: depositoId });
    if (error) throw error;
    return data;
};

export const confirmarPedido = async (pedidoId: number) => {
    const { data, error } = await supabase.rpc('procesar_confirmacion_pedido_v2', { p_pedido_id: pedidoId });
    if (error) throw error;
    return data;
};

export const anularPedido = async (pedidoId: number) => {
    const { data, error } = await supabase.rpc('anular_pedido_v2', { p_pedido_id: pedidoId });
    if (error) throw error;
    return data;
}

export const getShippingCostForCoordinates = async (lat: number, lng: number): Promise<Partial<ZonaEnvio> | null> => {
    const { data, error } = await supabase.rpc('get_zona_y_costo_por_coordenadas', {
        p_lat: lat,
        p_lng: lng
    });

    if (error) {
        console.error("Error fetching shipping cost by coords:", error);
        return null;
    }
    
    return (data && data.length > 0) ? data[0] : null;
};