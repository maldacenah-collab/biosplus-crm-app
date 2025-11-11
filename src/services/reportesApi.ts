// src/services/reportesApi.ts
import { supabase } from './supabase';
import { Reporte } from '../types';

export const getReportes = async (): Promise<Reporte[]> => {
    const { data, error } = await supabase
        .from('reportes_usabilidad')
        .select('*')
        .order('created_at', { ascending: false });
    if (error) throw error;
    return data || [];
};

export const addReporte = async (reporteData: Omit<Reporte, 'id' | 'created_at'>): Promise<Reporte> => {
    const { data, error } = await supabase
        .from('reportes_usabilidad')
        .insert([reporteData])
        .select()
        .single();
    if (error) throw error;
    return data;
};

export const updateReporte = async (id: number, updates: Partial<Reporte>): Promise<Reporte> => {
    const { data, error } = await supabase
        .from('reportes_usabilidad')
        .update(updates)
        .eq('id', id)
        .select()
        .single();
    if (error) throw error;
    return data;
};