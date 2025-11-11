// src/stores/useInventarioStore.ts
import { create } from 'zustand';
import { Product, StockGeneral, MovimientoStock, AuditResult, Lote } from '../types';
import * as api from '../services/inventarioApi';

interface InventarioState {
  products: Product[];
  stockGeneral: StockGeneral[];
  movimientos: MovimientoStock[];
  auditResults: AuditResult[];
  lotes: Lote[];
  isLoading: boolean;
  error: string | null;

  fetchProducts: () => Promise<void>;
  fetchStockGeneral: () => Promise<void>;
  fetchMovimientos: (from: string | null, to: string | null) => Promise<void>;
  runAudit: () => Promise<void>;
  upsertProduct: (productData: Partial<Product>) => Promise<Product | undefined>;
  refreshAll: () => Promise<void>; // Nueva acción
}

export const useInventarioStore = create<InventarioState>((set, get) => ({
  products: [],
  stockGeneral: [],
  movimientos: [],
  auditResults: [],
  lotes: [],
  isLoading: false,
  error: null,

  fetchProducts: async () => {
    set({ isLoading: true, error: null });
    try {
      const products = await api.getProductsWithStock();
      set({ products, isLoading: false });
    } catch (error: any) {
      set({ error: error.message, isLoading: false });
    }
  },

  fetchStockGeneral: async () => {
    set({ isLoading: true, error: null });
    try {
      const stockGeneral = await api.getStockGeneral();
      set({ stockGeneral, isLoading: false });
    } catch (error: any) {
      set({ error: error.message, isLoading: false });
    }
  },

  fetchMovimientos: async (from, to) => {
    set({ isLoading: true, error: null });
    try {
      const movimientos = await api.getMovimientosStock(from, to);
      set({ movimientos, isLoading: false });
    } catch (error: any) {
      set({ error: error.message, isLoading: false });
    }
  },

  runAudit: async () => {
    set({ isLoading: true, error: null });
    try {
      const auditResults = await api.runStockAudit();
      set({ auditResults, isLoading: false });
    } catch (error: any) {
      set({ error: error.message, isLoading: false });
    }
  },
  
  upsertProduct: async (productData) => {
    try {
      const savedProduct = await api.upsertProduct(productData);
      // Actualizar el estado local
      get().fetchProducts(); // Recargar la lista de productos
      return savedProduct;
    } catch (error: any) {
      set({ error: error.message });
      throw error;
    }
  },

  refreshAll: async () => {
      set({ isLoading: true });
      await Promise.all([
          get().fetchProducts(),
          get().fetchStockGeneral()
      ]);
      set({ isLoading: false });
  }
}));
