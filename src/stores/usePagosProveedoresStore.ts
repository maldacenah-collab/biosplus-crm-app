// src/stores/usePagosProveedoresStore.ts
import { create } from 'zustand';
import * as api from '../services/ctaCorrienteApi';
import { SaldoProveedorGlobal, MovimientoCtaCorrienteProveedor, DocumentoPendienteProveedor } from '../types';

interface PagosProveedoresState {
  saldosGlobales: SaldoProveedorGlobal[];
  movimientos: MovimientoCtaCorrienteProveedor[];
  documentosPendientes: DocumentoPendienteProveedor[];
  isLoading: boolean;
  isDetailLoading: boolean;
  fetchSaldosGlobales: () => Promise<void>;
  fetchDetalleProveedor: (providerId: string) => Promise<void>;
  registrarPago: (pagoData: any) => Promise<void>;
  anularMovimiento: (movimientoId: number, providerId: string) => Promise<void>;
}

export const usePagosProveedoresStore = create<PagosProveedoresState>((set, get) => ({
  saldosGlobales: [],
  movimientos: [],
  documentosPendientes: [],
  isLoading: false,
  isDetailLoading: false,

  fetchSaldosGlobales: async () => {
    set({ isLoading: true });
    try {
      const data = await api.getSaldosProveedores();
      set({ saldosGlobales: data, isLoading: false });
    } catch (error) {
      console.error(error);
      set({ isLoading: false });
    }
  },

  fetchDetalleProveedor: async (providerId: string) => {
    set({ isDetailLoading: true });
    try {
      const [movimientos, documentosPendientes] = await Promise.all([
        api.getMovimientosProveedor(providerId),
        api.getDocumentosPendientesProveedor(providerId),
      ]);
      set({ movimientos, documentosPendientes, isDetailLoading: false });
    } catch (error) {
      console.error(error);
      set({ isDetailLoading: false });
    }
  },
  
  registrarPago: async (pagoData: any) => {
      await api.registrarPagoProveedor(pagoData);
      await get().fetchDetalleProveedor(pagoData.p_proveedor_id);
      await get().fetchSaldosGlobales();
  },

  anularMovimiento: async (movimientoId: number, providerId: string) => {
      await api.anularMovimientoProveedor(movimientoId);
      await get().fetchDetalleProveedor(providerId);
      await get().fetchSaldosGlobales();
  }
}));