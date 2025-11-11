// src/services/comprasApi.ts
import { supabase } from './supabase';
import { Compra, Lote } from '../types';

export const getCompras = async (): Promise<Compra[]> => {
    const { data, error } = await supabase
        .from('compras')
        .select('*, proveedores(id, nombre)')
        .order('created_at', { ascending: false });
    if (error) throw error;
    return data || [];
};

export const getCompraById = async (id: number): Promise<Compra> => {
    const { data, error } = await supabase
        .from('compras')
        .select('*, proveedores(*)')
        .eq('id', id)
        .single();
    if (error) throw error;
    return data;
};

export const upsertCompra = async (compraData: Partial<Compra>): Promise<Compra> => {
    const { id, ...dataForDb } = compraData;
    
    if (id) {
        // Update
        const { data, error } = await supabase
            .from('compras')
            .update(dataForDb)
            .eq('id', id)
            .select()
            .single();
        if (error) throw error;
        return data;
    } else {
        // Create
        const { data, error } = await supabase
            .from('compras')
            .insert(dataForDb)
            .select()
            .single();
        if (error) throw error;
        return data;
    }
};

export const processReception = async (compraId: number, facturaNro: string | null, lotesData: Partial<Lote>[]) => {
    if (lotesData.length > 0) {
        const { error: lotesError } = await supabase.from('lotes').insert(lotesData);
        if (lotesError) throw lotesError;
    }
    const { error: compraError } = await supabase
        .from('compras')
        .update({ estado: 'Recibida', factura_proveedor_nro: facturaNro })
        .eq('id', compraId);
    if (compraError) throw compraError;
};

export const reverseReception = async (id: number) => {
    const { error } = await supabase.rpc('reversar_recepcion_compra', { p_compra_id: id });
    if (error) throw error;
};

export const deleteCompra = async (id: number) => {
    const { error } = await supabase.from('compras').delete().eq('id', id);
    if (error) throw error;
};