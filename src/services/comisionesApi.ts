// src/services/comisionesApi.ts
import { supabase } from './supabase';
import { ResumenLiquidacion, ComisionDetalle, HistorialPago } from '../types';

export const getResumenLiquidaciones = async (mes?: number, anio?: number): Promise<ResumenLiquidacion[]> => {
    const { data, error } = await supabase.rpc('get_resumen_liquidaciones', { 
        p_mes: mes || null,
        p_anio: anio || null
    });
    if (error) { console.error("Error fetching resumen liquidaciones:", error); throw error; }
    return data || [];
};

export const getComisionesPendientes = async (vendedorId: number): Promise<ComisionDetalle[]> => {
    const { data, error } = await supabase.rpc('get_comisiones_pendientes_vendedor', { p_vendedor_id: vendedorId });
    if (error) { console.error("Error fetching comisiones pendientes:", error); throw error; }
    return data || [];
};

export const getHistorialPagos = async (vendedorId: number): Promise<HistorialPago[]> => {
    const { data, error } = await supabase.rpc('get_historial_pagos_vendedor', { p_vendedor_id: vendedorId });
    if (error) { console.error("Error fetching historial de pagos:", error); throw error; }
    return data || [];
}

export const pagarComisiones = async (vendedorId: number, comisionIds: number[], concepto: string, comprobanteUrl: string): Promise<number> => {
    const { data, error } = await supabase.rpc('pagar_comisiones_vendedor', {
        p_vendedor_id: vendedorId,
        p_comision_ids: comisionIds,
        p_fecha_pago: new Date().toISOString().split('T')[0],
        p_concepto: concepto,
        p_comprobante_url: comprobanteUrl
    });

    if (error) {
        console.error("Error en RPC pagar_comisiones_vendedor:", error);
        throw error;
    }
    return data;
}