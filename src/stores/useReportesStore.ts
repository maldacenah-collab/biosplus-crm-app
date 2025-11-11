// src/stores/useReportesStore.ts
import { create } from 'zustand';
import * as api from '../services/reportesApi';
import { Reporte } from '../types';

interface ReportesState {
  reportes: Reporte[];
  isLoading: boolean;
  fetchReportes: () => Promise<void>;
  saveReporte: (reporte: Omit<Reporte, 'id'|'created_at'>) => Promise<void>;
  updateReporteStatus: (id: number, estado: Reporte['estado']) => Promise<void>;
}

export const useReportesStore = create<ReportesState>((set, get) => ({
  reportes: [],
  isLoading: false,

  fetchReportes: async () => {
    set({ isLoading: true });
    try {
      const reportes = await api.getReportes();
      set({ reportes, isLoading: false });
    } catch (error) {
      console.error(error);
      set({ isLoading: false });
    }
  },

  saveReporte: async (reporte) => {
    const newReporte = await api.addReporte(reporte);
    set(state => ({ reportes: [newReporte, ...state.reportes] }));
  },
  
  updateReporteStatus: async (id, estado) => {
    const updatedReporte = await api.updateReporte(id, { estado });
    set(state => ({
        reportes: state.reportes.map(r => r.id === id ? updatedReporte : r)
    }));
  }
}));