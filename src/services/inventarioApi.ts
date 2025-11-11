// src/services/inventarioApi.ts

import { supabase } from './supabase';
import { Product, Lote, StockGeneral, MovimientoStock, AuditResult, StockVendedor, PriceTier } from '../types';

export const getProductsWithStock = async (): Promise<Product[]> => {
    const { data: products, error: pError } = await supabase.from('productos').select('*');
    if (pError) { console.error("Error fetching productos:", pError); throw pError; }

    const { data: lotes, error: lError } = await supabase.from('lotes').select('producto_id, stock_disponible');
    if (lError) { console.error("Error fetching lotes for stock count:", lError); throw lError; }

    const stockMap = (lotes || []).reduce((acc, lote) => {
        acc[lote.producto_id] = (acc[lote.producto_id] || 0) + (lote.stock_disponible || 0);
        return acc;
    }, {} as Record<number, number>);

    return products.map(p => ({
        ...p,
        stock_total: stockMap[p.id] || 0,
    }));
};

export const getProductDetails = async (productId: number): Promise<Product & { lotes: Lote[] }> => {
    const { data: product, error: pError } = await supabase.from('productos').select('*').eq('id', productId).single();
    if (pError) throw pError;
    const { data: lotes, error: lError } = await supabase.from('lotes').select('*').eq('producto_id', productId).order('fecha_vencimiento');
    if (lError) throw lError;
    return { ...product, lotes: lotes || [] };
};

export const upsertProduct = async (productData: Partial<Product>): Promise<Product> => {
    const { id, ...dataForDb } = productData;
    
    if (id) {
        // Update
        const { data, error } = await supabase
            .from('productos')
            .update(dataForDb)
            .eq('id', id)
            .select()
            .single();
        if (error) throw error;
        return data;
    } else {
        // Create
        const { data, error } = await supabase
            .from('productos')
            .insert(dataForDb)
            .select()
            .single();
        if (error) throw error;
        return data;
    }
};

export const addLotes = async (lotesData: Partial<Lote>[]): Promise<Lote[]> => {
    const { data, error } = await supabase.from('lotes').insert(lotesData).select();
    if (error) throw error;
    return data;
};

export const getStockGeneral = async (): Promise<StockGeneral[]> => {
    const { data, error } = await supabase.rpc('get_stock_general_completo_v2');
    if (error) { console.error("Error getting general stock:", error); throw error; }
    return data || [];
};

export const getPedidosConReserva = async (productoId: number): Promise<{ numero_pedido: string, cliente_nombre: string }[]> => {
    const { data, error } = await supabase.rpc('get_pedidos_con_reserva', { p_producto_id: productoId });
    if (error) {
        console.error("Error getting reserved stock details:", error);
        throw error;
    }
    return data || [];
};

export const getMovimientosStock = async (from: string | null, to: string | null): Promise<MovimientoStock[]> => {
    const [comprasRes, ventasRes, ajustesRes] = await Promise.all([
        supabase.rpc('get_movimientos_compras', { p_fecha_desde: from, p_fecha_hasta: to }),
        supabase.rpc('get_movimientos_ventas', { p_fecha_desde: from, p_fecha_hasta: to }),
        supabase.rpc('get_movimientos_ajustes', { p_fecha_desde: from, p_fecha_hasta: to })
    ]);

    if (comprasRes.error || ventasRes.error || ajustesRes.error) {
        console.error({ comprasError: comprasRes.error, ventasError: ventasRes.error, ajustesError: ajustesRes.error });
        throw new Error("Failed to fetch stock movements.");
    }

    const allMovements = [
        ...(comprasRes.data || []),
        ...(ventasRes.data || []),
        ...(ajustesRes.data || [])
    ];
    allMovements.sort((a, b) => new Date(b.fecha).getTime() - new Date(a.fecha).getTime());
    return allMovements;
};

export const runStockAudit = async (): Promise<AuditResult[]> => {
    const { data, error } = await supabase.rpc('auditar_stock_completo');
    if (error) { console.error("Error running stock audit:", error); throw error; }
    return data || [];
};

export const getLotesByProducto = async (productId: number): Promise<Lote[]> => {
    const { data, error } = await supabase.from('lotes').select('*').eq('producto_id', productId).order('fecha_vencimiento');
    if (error) { console.error("Error getting lotes by product:", error); throw error; }
    return data || [];
};

export const getStockAsignadoByProducto = async (productId: number, vendedorId: number): Promise<(StockVendedor & {lotes: Partial<Lote>})[]> => {
    const { data, error } = await supabase
        .from('stock_vendedores')
        .select('*, lotes!inner(*)')
        .eq('lotes.producto_id', productId) 
        .eq('vendedor_id', vendedorId)
        .gt('cantidad_asignada', 0);
        
    if (error) {
        console.error("Error getting assigned stock by product:", error);
        throw error;
    }
    return data || [];
};

export const ajustarStock = async (loteId: number, cantidad: number, justificacion: string, operador: string): Promise<void> => {
    const { error } = await supabase.rpc('ajustar_stock_lote', {
        p_lote_id: loteId,
        p_cantidad_ajuste: cantidad,
        p_justificacion: justificacion,
        p_operador: operador
    });
    if (error) throw error;
};

export const ajustarStockVendedor = async (loteId: number, vendedorId: number, cantidad: number, justificacion: string, operador: string): Promise<void> => {
    const { error } = await supabase.rpc('ajustar_stock_vendedor', {
        p_lote_id: loteId,
        p_vendedor_id: vendedorId,
        p_cantidad_ajuste: cantidad,
        p_justificacion: justificacion,
        p_operador: operador
    });
    if (error) throw error;
};


export const devolverStockADeposito = async (loteId: number, vendedorId: number, cantidad: number, justificacion: string, operador: string): Promise<void> => {
    const { error } = await supabase.rpc('devolver_stock_vendedor_a_deposito', {
        p_lote_id: loteId,
        p_vendedor_id: vendedorId,
        p_cantidad: Math.abs(cantidad),
        p_justificacion: justificacion,
        p_operador: operador
    });
    if (error) throw error;
};

export const getMovimientosPorLote = async (loteId: number): Promise<MovimientoStock[]> => {
    const { data, error } = await supabase.rpc('get_movimientos_por_lote', { p_lote_id: loteId });
    if (error) {
        console.error("Error getting movements by lote:", error);
        throw error;
    }
    return data || [];
};

export const asignarStockMasivo = async (vendedorId: number, asignaciones: { producto_id: number, cantidad: number }[]): Promise<void> => {
    const { error } = await supabase.rpc('asignar_stock_masivo', { p_vendedor_id: vendedorId, p_asignaciones: asignaciones });
    if (error) throw error;
};

export const getStockPrincipalParaAsignar = async (): Promise<Lote[]> => {
    const { data, error } = await supabase.from('lotes').select('*, productos(*)').gt('stock_disponible', 0).order('fecha_vencimiento', { ascending: true });
    if (error) { console.error("Error fetching main stock for assignment:", error); throw error; }
    return data || [];
};

export const getStockAsignadoDetallado = async (): Promise<{vendedor_nombre: string, producto_nombre: string, numero_lote: string, fecha_vencimiento: string, cantidad_asignada: number}[]> => {
    const { data, error } = await supabase.rpc('get_stock_asignado_detallado');
    if (error) {
        console.error("Error getting detailed assigned stock:", error);
        throw error;
    }
    return data || [];
};