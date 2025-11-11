// src/stores/useOpportunityStore.ts
import { create } from 'zustand';
import { getOpportunities, upsertOpportunity, deleteOpportunity, requestPriceApproval } from '../services/opportunitiesApi';
import { Opportunity } from '../types';
import { saveData, loadData } from '../utils/db';
import { useSharedStore } from './useSharedStore';

interface OpportunityState {
  opportunities: Opportunity[];
  isLoading: boolean;
  error: string | null;
  fetchOpportunities: () => Promise<void>;
  saveOpportunity: (opportunity: Partial<Opportunity>) => Promise<Opportunity | undefined>;
  removeOpportunity: (id: number) => Promise<void>;
  requestApproval: (opportunityId: number, solicitudes: { producto_id: number; precio_solicitado: number }[], justificacion: string) => Promise<{ whatsapp_base_link: string, token: string }>;
}

export const useOpportunityStore = create<OpportunityState>((set, get) => ({
  opportunities: [],
  isLoading: false,
  error: null,

  fetchOpportunities: async () => {
    set({ isLoading: true, error: null });
    try {
      const opportunities = await getOpportunities();
      set({ opportunities, isLoading: false });
      useSharedStore.getState().isOffline && set(state => ({ ...state, isOffline: false }));
      await saveData('opportunities', opportunities);
    } catch (error: any) {
      console.warn('Failed to fetch opportunities from network, trying offline.', error);
      try {
        const opportunities = await loadData<Opportunity>('opportunities');
        set({ opportunities, isLoading: false, error: null });
        useSharedStore.setState({ isOffline: true });
      } catch (dbError: any) {
        set({ error: dbError.message, isLoading: false });
      }
    }
  },

  saveOpportunity: async (opportunity) => {
    const { currentUser } = useSharedStore.getState();
    if (!currentUser) {
      throw new Error("Usuario no autenticado.");
    }
    
    const dataToSave = { ...opportunity };
    if (!dataToSave.id) {
        dataToSave.organizacion_id = currentUser.organizacion_id;
    }

    try {
      const savedOpportunity = await upsertOpportunity(dataToSave);
      
      const existing = get().opportunities;
      const index = existing.findIndex(o => o.id === savedOpportunity.id);
      
      if (index !== -1) {
        const updated = [...existing];
        updated[index] = savedOpportunity;
        set({ opportunities: updated });
      } else {
        // Al crear, lo ponemos al principio para que se vea inmediatamente
        set({ opportunities: [savedOpportunity, ...existing] });
      }
      return savedOpportunity;
    } catch (error: any) {
      set({ error: error.message });
      throw error;
    }
  },

  removeOpportunity: async (id) => {
    try {
        await deleteOpportunity(id);
        set(state => ({
            opportunities: state.opportunities.filter(o => o.id !== id)
        }));
    } catch (error: any) {
        set({ error: error.message });
        throw error;
    }
  },
  
  requestApproval: async (opportunityId, solicitudes, justificacion) => {
    try {
      const result = await requestPriceApproval(opportunityId, solicitudes, justificacion);
      get().fetchOpportunities();
      return result;
    } catch (error: any) {
      set({ error: error.message });
      throw error;
    }
  },
}));
