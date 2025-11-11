// src/stores/useDashboardGerencialStore.ts
import { create } from 'zustand';
import * as api from '../services/dashboardGerencialApi';
import { DashboardGerencialData } from '../types';

interface DashboardGerencialState {
  data: DashboardGerencialData | null;
  isLoading: boolean;
  error: string | null;
  fetchData: (filters: { from: string; to: string; costMethod: string }) => Promise<void>;
}

export const useDashboardGerencialStore = create<DashboardGerencialState>((set) => ({
  data: null,
  isLoading: true,
  error: null,

  fetchData: async (filters: { from: string; to: string; costMethod: string }) => {
    set({ isLoading: true, error: null });
    try {
      const data = await api.getDashboardGerencialData(filters);
      set({ data, isLoading: false });
    } catch (error: any) {
      console.error(error);
      set({ error: error.message, isLoading: false });
    }
  },
}));