// src/services/analisisVentasApi.ts
import { supabase } from './supabase';
import { AnalisisData } from '../types';

export const getReportData = async (filters: { from: string; to: string; }, vendedorId: number | null): Promise<AnalisisData> => {
    const params = {
        p_fecha_desde: filters.from,
        p_fecha_hasta: filters.to,
        p_vendedor_id: vendedorId,
    };
    
    const paramsVendedor = {
        p_fecha_inicio: filters.from,
        p_fecha_fin: filters.to
    };

    const [productos, vendedores, lineas, evolucion] = await Promise.all([
        supabase.rpc("get_analisis_productos", params),
        supabase.rpc("get_analisis_vendedores", paramsVendedor),
        supabase.rpc("get_analisis_lineas", params),
        supabase.rpc("get_analisis_evolucion", {}),
    ]);

    if (productos.error || vendedores.error || lineas.error || evolucion.error) {
        console.error("Error fetching analysis data:", {
            productos: productos.error,
            vendedores: vendedores.error,
            lineas: lineas.error,
            evolucion: evolucion.error,
        });
        throw new Error("Failed to fetch analysis data");
    }

    return {
        productos: productos.data || [],
        vendedores: vendedores.data || [],
        lineas: lineas.data || [],
        evolucion: evolucion.data || [],
    };
};
