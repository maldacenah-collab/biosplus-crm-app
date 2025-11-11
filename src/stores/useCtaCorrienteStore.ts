// src/stores/useCtaCorrienteStore.ts
import { create } from 'zustand';
import * as api from '../services/ctaCorrienteApi';
import { SaldoClienteGlobal, MovimientoCtaCorrienteCliente, DocumentoPendienteCliente, DeudaProveedorAgrupada } from '../types';

interface CtaCorrienteState {
  saldosGlobales: SaldoClienteGlobal[];
  movimientos: MovimientoCtaCorrienteCliente[];
  documentosPendientes: DocumentoPendienteCliente[];
  deudasProveedores: DeudaProveedorAgrupada[];
  isLoading: boolean;
  isDetailLoading: boolean;
  fetchSaldosGlobales: () => Promise<void>;
  fetchDetalleContacto: (contactId: number) => Promise<void>;
  registrarPago: (pagoData: any) => Promise<void>;
  anularMovimiento: (movimientoId: number, contactId: number) => Promise<void>;
}

export const useCtaCorrienteStore = create<CtaCorrienteState>((set, get) => ({
  saldosGlobales: [],
  movimientos: [],
  documentosPendientes: [],
  deudasProveedores: [],
  isLoading: false,
  isDetailLoading: false,

  fetchSaldosGlobales: async () => {
    set({ isLoading: true });
    try {
      const data = await api.getSaldosClientes();
      set({ saldosGlobales: data, isLoading: false });
    } catch (error) {
      console.error(error);
      set({ isLoading: false });
    }
  },

  fetchDetalleContacto: async (contactId: number) => {
    set({ isDetailLoading: true });
    try {
      const [movimientos, documentosPendientes, deudasProveedores] = await Promise.all([
        api.getMovimientosCliente(contactId),
        api.getDocumentosPendientesCliente(contactId),
        api.getDeudasProveedores(),
      ]);
      set({ movimientos, documentosPendientes, deudasProveedores, isDetailLoading: false });
    } catch (error) {
      console.error(error);
      set({ isDetailLoading: false });
    }
  },
  
  registrarPago: async (pagoData: any) => {
      await api.registrarPagoCliente(pagoData);
      // Refrescar tanto el detalle como la lista global
      await get().fetchDetalleContacto(pagoData.p_contacto_id);
      await get().fetchSaldosGlobales();
  },
  
  anularMovimiento: async (movimientoId: number, contactId: number) => {
      await api.anularMovimientoCliente(movimientoId);
      // Refrescar tanto el detalle como la lista global
      await get().fetchDetalleContacto(contactId);
      await get().fetchSaldosGlobales();
  }
}));