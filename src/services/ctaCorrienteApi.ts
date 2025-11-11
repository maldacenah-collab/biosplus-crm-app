// src/services/ctaCorrienteApi.ts
// API para obtener y manipular datos de Cuentas Corrientes de Clientes y Proveedores.

import { supabase } from './supabase';
import { SaldoClienteGlobal, MovimientoCtaCorrienteCliente, DocumentoPendienteCliente, DeudaProveedorAgrupada, SaldoProveedorGlobal, MovimientoCtaCorrienteProveedor, DocumentoPendienteProveedor } from '../types';

// --- CLIENTES ---

export const getSaldosClientes = async (): Promise<SaldoClienteGlobal[]> => {
    const { data, error } = await supabase.rpc('get_saldos_clientes_con_detalle_deuda');
    if (error) { console.error("Error fetching saldos clientes:", error); throw error; }
    return data || [];
};

export const getMovimientosCliente = async (contactId: number): Promise<MovimientoCtaCorrienteCliente[]> => {
    const { data, error } = await supabase.rpc('get_movimientos_cliente', { p_contacto_id: contactId });
    if (error) { console.error("Error fetching movimientos cliente:", error); throw error; }
    return data || [];
};

export const getDocumentosPendientesCliente = async (contactId: number): Promise<DocumentoPendienteCliente[]> => {
    const { data, error } = await supabase.rpc('get_documentos_pendientes_cliente', { p_contacto_id: contactId });
    if (error) { console.error("Error fetching documentos pendientes cliente:", error); throw error; }
    return data || [];
};

export const getDeudasProveedores = async (): Promise<DeudaProveedorAgrupada[]> => {
    const { data, error } = await supabase.rpc('get_proveedores_con_deudas_agrupadas');
    if (error) { console.error("Error fetching deudas proveedores:", error); throw error; }
    return data || [];
}

export const registrarPagoCliente = async (pagoData: any): Promise<void> => {
    const { error } = await supabase.rpc('registrar_y_aplicar_pago_cliente', pagoData);
    if (error) { console.error("Error al registrar pago cliente:", error); throw error; }
};

export const anularMovimientoCliente = async (movimientoId: number): Promise<void> => {
    const { error } = await supabase.rpc('anular_movimiento_cliente', { p_movimiento_id: movimientoId });
    if (error) { console.error("Error al anular movimiento cliente:", error); throw error; }
};

// --- PROVEEDORES ---

export const getSaldosProveedores = async (): Promise<SaldoProveedorGlobal[]> => {
    const { data, error } = await supabase.rpc('get_saldos_todos_los_proveedores');
    if (error) { console.error("Error fetching saldos proveedores:", error); throw error; }
    return data || [];
};

export const getMovimientosProveedor = async (providerId: string): Promise<MovimientoCtaCorrienteProveedor[]> => {
    const { data, error } = await supabase.rpc('get_movimientos_proveedor', { p_proveedor_id: providerId });
    if (error) { console.error("Error fetching movimientos proveedor:", error); throw error; }
    return data || [];
};

export const getDocumentosPendientesProveedor = async (providerId: string): Promise<DocumentoPendienteProveedor[]> => {
    const { data, error } = await supabase.rpc('get_documentos_pendientes_proveedor', { p_proveedor_id: providerId });
    if (error) { console.error("Error fetching documentos pendientes proveedor:", error); throw error; }
    return data || [];
};

export const registrarPagoProveedor = async (pagoData: any): Promise<void> => {
    const { error } = await supabase.rpc('registrar_pago_proveedor_directo', pagoData);
    if (error) { console.error("Error registrando pago proveedor:", error); throw error; }
};

export const anularMovimientoProveedor = async (movimientoId: number): Promise<void> => {
    const { error } = await supabase.rpc('anular_movimiento_proveedor', { p_movimiento_id: movimientoId });
    if (error) { console.error("Error anulando movimiento proveedor:", error); throw error; }
};