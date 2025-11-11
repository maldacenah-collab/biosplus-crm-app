// src/stores/useZonasEnvioStore.ts
import { create } from 'zustand';
import * as api from '../services/zonasEnvioApi';
import { ZonaEnvio } from '../types';
import { useSharedStore } from './useSharedStore';
import { supabase } from '../services/supabase';

interface ZonasEnvioState {
  zonas: ZonaEnvio[];
  isLoading: boolean;
  error: string | null;
  fetchZonas: () => Promise<void>;
  saveZona: (zona: Partial<ZonaEnvio>) => Promise<void>;
  deleteZona: (id: number) => Promise<void>;
}

export const useZonasEnvioStore = create<ZonasEnvioState>((set, get) => ({
  zonas: [],
  isLoading: false,
  error: null,

  fetchZonas: async () => {
    set({ isLoading: true });
    try {
      const zonas = await api.getZonasEnvio();
      set({ zonas, isLoading: false });
    } catch (error: any) {
      set({ error: error.message, isLoading: false });
    }
  },

  saveZona: async (zona) => {
    const { currentUser } = useSharedStore.getState();
    if (!currentUser) throw new Error("Usuario no autenticado.");

    const dataToSave = { ...zona };

    if (!dataToSave.id) {
        dataToSave.organizacion_id = currentUser.organizacion_id;
    }

    try {
      const savedZonaEnvio = await api.upsertZonaEnvio(dataToSave as any);
      
      // Sync with 'zonas' table for FK consistency in 'contactos'
      if (savedZonaEnvio?.nombre) {
        await supabase.from('zonas').upsert({ nombre: savedZonaEnvio.nombre }, { onConflict: 'nombre' });
      }

      await get().fetchZonas(); // Refresh list
    } catch (error: any) {
      throw new Error(`Failed to save shipping zone: ${error.message}`);
    }
  },

  deleteZona: async (id: number) => {
    try {
      const zonaToDelete = get().zonas.find(z => z.id === id);

      await api.deleteZonaEnvio(id);

      // Sync with 'zonas' table for FK consistency in 'contactos'
      if (zonaToDelete?.nombre) {
         await supabase.from('zonas').delete().eq('nombre', zonaToDelete.nombre);
      }

      set(state => ({
        zonas: state.zonas.filter(z => z.id !== id)
      }));
    } catch (error: any) {
      throw new Error(`Failed to delete shipping zone: ${error.message}`);
    }
  },
}));