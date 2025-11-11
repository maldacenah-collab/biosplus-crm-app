// src/services/dashboardGerencialApi.ts

import { supabase } from './supabase';
import { DashboardGerencialData } from '../types';

export const getDashboardGerencialData = async (filters: { from: string; to: string; costMethod: string }): Promise<DashboardGerencialData | null> => {
    const { data, error } = await supabase.rpc('get_dashboard_gerencial', {
        p_fecha_desde: filters.from,
        p_fecha_hasta: filters.to,
        p_metodo_costo: filters.costMethod
    });

    if (error) {
        console.error("Error fetching gerencial dashboard data:", error);
        throw error;
    }
    
    // The RPC returns an array with a single object.
    return data && data.length > 0 ? data[0] : null;
};