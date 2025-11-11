// src/stores/useAnalisisVentasStore.ts
import { create } from 'zustand';
import * as api from '../services/analisisVentasApi';
import { AnalisisData } from '../types';

interface AnalisisVentasState {
  reportData: AnalisisData | null;
  isLoading: boolean;
  error: string | null;
  fetchReportData: (filters: { from: string; to: string; }, vendedorId: number | null) => Promise<void>;
}

export const useAnalisisVentasStore = create<AnalisisVentasState>((set) => ({
  reportData: null,
  isLoading: false,
  error: null,

  fetchReportData: async (filters, vendedorId) => {
    set({ isLoading: true, error: null });
    try {
      const data = await api.getReportData(filters, vendedorId);
      set({ reportData: data, isLoading: false });
    } catch (error: any) {
      set({ error: error.message, isLoading: false });
    }
  },
}));
