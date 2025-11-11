// src/services/dashboardApi.ts
import { supabase } from './supabase';
import { DashboardData, ContactoDashboard, Accion, TopItem } from '../types';

export const getDashboardData = async (vendedorId: string): Promise<DashboardData | null> => {
    const [dashboardData, stockData] = await Promise.all([
        supabase.rpc("get_datos_dashboard_vendedor_v2", { p_vendedor_id: vendedorId }).single(),
        supabase.rpc("get_valor_stock_vendedor", { p_vendedor_id: vendedorId }).single()
    ]);

    if (dashboardData.error || stockData.error || typeof dashboardData.data !== 'object' || !dashboardData.data) {
         console.error("Error fetching dashboard data:", { dash: dashboardData.error, stock: stockData.error }); 
         throw new Error('Failed to fetch dashboard data');
    }
    
    return {
        ...(dashboardData.data as Omit<DashboardData, 'valor_stock_asignado'>),
        valor_stock_asignado: (stockData.data as number) || 0,
    };
};

export const getTopClientes = async (vendedorId: string): Promise<TopItem[]> => {
    const { data, error } = await supabase.rpc('get_top_clientes_por_vendedor', { p_vendedor_id: vendedorId });
    if (error) { console.error("Error fetching top clientes:", error); throw error; }
    return data.map((item: any) => ({ nombre: item.nombre_cliente, valor: item.total_comprado }));
};

export const getTopProductos = async (vendedorId: string): Promise<TopItem[]> => {
    const { data, error } = await supabase.rpc('get_top_productos_por_vendedor', { p_vendedor_id: vendedorId });
    if (error) { console.error("Error fetching top productos:", error); throw error; }
    return data.map((item: any) => ({ nombre: item.nombre_producto, valor: item.unidades_vendidas }));
};

export const getVendedorContactos = async (vendedorId: string): Promise<ContactoDashboard[]> => {
    const { data, error } = await supabase.rpc('get_contactos_dashboard', { p_vendedor_id: vendedorId });
    if (error) { console.error("Error fetching contacts:", error); throw error; }
    return data;
};

export const getProximasAcciones = async (vendedorId: string): Promise<Accion[]> => {
    const { data, error } = await supabase.rpc('get_proximas_acciones_dinamicas', { p_vendedor_id: vendedorId });
    if (error) { console.error("Error fetching proximas acciones:", error); throw error; }
    return data;
};

export const globalSearch = async (searchTerm: string) => {
    if (searchTerm.trim().length < 3) return [];
    const { data, error } = await supabase.rpc('global_search', { p_search_term: searchTerm });
    if (error) {
      console.error("Error performing global search:", error);
      throw error;
    }
    return data || [];
};
