// src/stores/usePedidoStore.ts
import { create } from 'zustand';
import { getPedidos, upsertPedido, confirmarPedido, anularPedido } from '../services/pedidosApi';
import { Pedido } from '../types';
import { saveData, loadData } from '../utils/db';
import { useSharedStore } from './useSharedStore';
import { useLogisticaStore } from './useLogisticaStore'; // Importar el store de logística

interface PedidoState {
  pedidos: Pedido[];
  isLoading: boolean;
  error: string | null;
  fetchPedidos: () => Promise<void>;
  savePedido: (pedido: Partial<Pedido>) => Promise<Pedido | undefined>;
  confirmarPedido: (pedidoId: number) => Promise<void>;
  anularPedido: (pedidoId: number) => Promise<void>;
}

export const usePedidoStore = create<PedidoState>((set, get) => ({
  pedidos: [],
  isLoading: false,
  error: null,

  fetchPedidos: async () => {
    set({ isLoading: true, error: null });
    try {
      const pedidos = await getPedidos();
      set({ pedidos, isLoading: false });
      useSharedStore.getState().isOffline && set(state => ({ ...state, isOffline: false }));
      await saveData('pedidos', pedidos);
    } catch (error: any) {
      console.warn('Failed to fetch pedidos from network, trying offline.', error);
      try {
        const pedidos = await loadData<Pedido>('pedidos');
        set({ pedidos, isLoading: false, error: null });
        useSharedStore.setState({ isOffline: true });
      } catch (dbError: any) {
        set({ error: dbError.message, isLoading: false });
      }
    }
  },

  savePedido: async (pedido) => {
    const { currentUser } = useSharedStore.getState();
    if (!currentUser) {
      throw new Error("Usuario no autenticado.");
    }
    
    const dataToSave = { ...pedido };
    if (!dataToSave.id) {
        dataToSave.organizacion_id = currentUser.organizacion_id;
    }

    try {
        const savedPedido = await upsertPedido(dataToSave);
        const existing = get().pedidos;
        const index = existing.findIndex(p => p.id === savedPedido.id);

        if (index !== -1) {
            const updated = [...existing];
            updated[index] = { ...existing[index], ...savedPedido };
            set({ pedidos: updated });
        } else {
            set({ pedidos: [savedPedido, ...existing] });
        }
        return savedPedido;
    } catch (error: any) {
        set({ error: error.message });
        throw error;
    }
  },

  confirmarPedido: async (pedidoId: number) => {
    try {
      await confirmarPedido(pedidoId);
      await get().fetchPedidos(); // Refresh list after confirmation
    } catch (error: any) {
      set({ error: error.message });
      throw error;
    }
  },

  anularPedido: async (pedidoId: number) => {
    try {
      await anularPedido(pedidoId);
      await get().fetchPedidos(); // Refresh list after cancellation
      await useLogisticaStore.getState().fetchPedidos(); // Refresh logistics board as well
    } catch (error: any) {
      set({ error: error.message });
      throw error;
    }
  }
}));