// src/stores/useCompraStore.ts
import { create } from 'zustand';
import { Compra, Lote } from '../types';
import * as api from '../services/comprasApi';
import { useInventarioStore } from './useInventarioStore';
import { useSharedStore } from './useSharedStore';

interface CompraState {
    compras: Compra[];
    isLoading: boolean;
    error: string | null;
    fetchCompras: () => Promise<void>;
    saveCompra: (compra: Partial<Compra>) => Promise<void>;
    receiveCompra: (compraId: number, facturaNro: string | null, lotesData: Partial<Lote>[]) => Promise<void>;
    reverseReception: (id: number) => Promise<void>;
}

export const useCompraStore = create<CompraState>((set, get) => ({
    compras: [],
    isLoading: false,
    error: null,
    fetchCompras: async () => {
        set({ isLoading: true, error: null });
        try {
            const compras = await api.getCompras();
            set({ compras, isLoading: false });
        } catch (error: any) {
            set({ error: error.message, isLoading: false });
        }
    },
    saveCompra: async (compra) => {
        try {
            await api.upsertCompra(compra);
            await get().fetchCompras();
        } catch (error: any) {
            set({ error: error.message });
            throw error;
        }
    },
    receiveCompra: async (compraId, facturaNro, lotesData) => {
        try {
            await api.processReception(compraId, facturaNro, lotesData);
            await get().fetchCompras();
            // Refresca el inventario para reflejar el nuevo stock
            useInventarioStore.getState().refreshAll();
            useSharedStore.getState().fetchSharedData();
        } catch (error: any) {
            set({ error: error.message });
            throw error;
        }
    },
    reverseReception: async (id) => {
        try {
            await api.reverseReception(id);
            await get().fetchCompras();
            useInventarioStore.getState().refreshAll();
            useSharedStore.getState().fetchSharedData();
        } catch (error: any) {
            set({ error: error.message });
            throw error;
        }
    }
}));
