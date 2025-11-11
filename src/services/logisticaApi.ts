// src/services/logisticaApi.ts
import { supabase } from './supabase';
import { PedidoLogistica } from '../types';

/**
 * Obtiene los pedidos relevantes para el tablero de logística.
 * Llama a la RPC v2 que calcula el estado de pago y excluye estados irrelevantes.
 */
export const getPedidosLogistica = async (): Promise<PedidoLogistica[]> => {
    const { data, error } = await supabase.rpc('get_pedidos_para_logistica_v2');

    if (error) {
        console.error("Error fetching logistic pedidos:", error);
        throw error;
    }
    
    // La RPC devuelve todos los campos necesarios.
    return (data as PedidoLogistica[]) || [];
};


/**
 * Actualiza el estado de un pedido llamando a la función de negocio en la DB.
 */
export const actualizarEstadoLogistica = async (pedidoId: number, nuevoEstadoNombre: string) => {
    const { error } = await supabase.rpc('actualizar_estado_logistica_v2', { 
        p_pedido_id: pedidoId, 
        p_nuevo_estado_nombre: nuevoEstadoNombre 
    });
    if (error) throw error;
}


/**
 * Actualiza (o crea) el registro de envío para un pedido con proveedor y/o n° de seguimiento.
 * Implementa una lógica de "select-then-update/insert" para evitar el error de onConflict
 * cuando no hay una restricción UNIQUE en pedido_id.
 */
export const updatePedidoLogistica = async (
    pedidoId: number, 
    updates: { proveedor_logistica_id?: number; numero_seguimiento?: string, costo_envio?: number }
): Promise<void> => {
     // Mapea los nombres de campo del frontend a los de la base de datos
     const dbUpdates: any = {};
     if (updates.numero_seguimiento !== undefined) {
         dbUpdates.tracking_number = updates.numero_seguimiento;
     }
     if (updates.proveedor_logistica_id !== undefined) {
        dbUpdates.transportista_id = updates.proveedor_logistica_id;
     }
     if (updates.costo_envio !== undefined) {
        dbUpdates.costo_envio = updates.costo_envio;
     }


     // 1. Verificar si ya existe un registro para este pedido.
     const { data: existingEntries, error: selectError } = await supabase
        .from('logistica_envios')
        .select('id')
        .eq('pedido_id', pedidoId);

     if (selectError) {
        console.error(`Error checking for existing logistics entry for pedido ${pedidoId}:`, selectError);
        throw selectError;
     }
     
     const existingEntry = existingEntries && existingEntries.length > 0 ? existingEntries[0] : null;

     if (existingEntry) {
        // 2. Si existe, actualiza el registro existente.
        const { error: updateError } = await supabase
            .from('logistica_envios')
            .update(dbUpdates)
            .eq('pedido_id', pedidoId);
        
        if (updateError) {
            console.error(`Error updating logistics for pedido ${pedidoId}:`, updateError);
            throw updateError;
        }
     } else {
        // 3. Si no existe, inserta un nuevo registro.
        const { error: insertError } = await supabase
            .from('logistica_envios')
            .insert({
                pedido_id: pedidoId,
                ...dbUpdates
            });
        
        if (insertError) {
            console.error(`Error inserting logistics for pedido ${pedidoId}:`, insertError);
            throw insertError;
        }
     }
}