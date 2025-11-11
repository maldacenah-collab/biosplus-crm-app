// src/stores/useComisionesStore.ts
import { create } from 'zustand';
import * as api from '../services/comisionesApi';
import { supabase } from '../services/supabase';
import { ResumenLiquidacion, ComisionDetalle, HistorialPago } from '../types';

interface ComisionesState {
  resumen: ResumenLiquidacion[];
  detalle: {
    pendientes: ComisionDetalle[];
    historial: HistorialPago[];
  };
  isLoading: boolean;
  isDetailLoading: boolean;
  fetchResumen: (mes: number, anio: number) => Promise<void>;
  fetchDetalleVendedor: (vendedorId: number) => Promise<void>;
  liquidarComisiones: (vendedorId: number, comisionIds: number[], concepto: string, comprobanteFile: File) => Promise<void>;
}

export const useComisionesStore = create<ComisionesState>((set, get) => ({
  resumen: [],
  detalle: { pendientes: [], historial: [] },
  isLoading: false,
  isDetailLoading: false,

  fetchResumen: async (mes, anio) => {
    set({ isLoading: true });
    try {
      const resumen = await api.getResumenLiquidaciones(mes, anio);
      set({ resumen, isLoading: false });
    } catch (error) {
      console.error(error);
      set({ isLoading: false });
    }
  },

  fetchDetalleVendedor: async (vendedorId) => {
    set({ isDetailLoading: true });
    try {
      const [pendientes, historial] = await Promise.all([
        api.getComisionesPendientes(vendedorId),
        api.getHistorialPagos(vendedorId)
      ]);
      set({ detalle: { pendientes, historial }, isDetailLoading: false });
    } catch (error) {
      console.error(error);
      set({ isDetailLoading: false });
    }
  },

  liquidarComisiones: async (vendedorId, comisionIds, concepto, comprobanteFile) => {
    const fileExt = comprobanteFile.name.split('.').pop();
    const fileName = `public/${vendedorId}-${Date.now()}.${fileExt}`;
    
    const { error: uploadError } = await supabase.storage
        .from('comprobantes_pago_vendedores')
        .upload(fileName, comprobanteFile);

    if (uploadError) {
        throw new Error(`Error al subir el comprobante: ${uploadError.message}`);
    }

    const { data: { publicUrl } } = supabase.storage
        .from('comprobantes_pago_vendedores')
        .getPublicUrl(fileName);

    await api.pagarComisiones(vendedorId, comisionIds, concepto, publicUrl);
    
    // Refresh data
    get().fetchDetalleVendedor(vendedorId);
  }
}));