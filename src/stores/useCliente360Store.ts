// src/stores/useCliente360Store.ts
import { create } from 'zustand';
import * as api from '../services/cliente360Api';
import { Contact, Pedido, Opportunity, TimelineEvent, MovimientoCtaCorrienteCliente } from '../types';

interface Cliente360State {
  details: Contact | null;
  kpis: {
    deuda_actual: number;
    total_historico_comprado: number;
    ultima_compra: string | null;
    presupuestos_abiertos_valor: number;
    presupuestos_abiertos_cantidad: number;
  };
  timeline: TimelineEvent[];
  pedidos: Pedido[];
  oportunidades: Opportunity[];
  cuenta_corriente: MovimientoCtaCorrienteCliente[];
  isLoading: boolean;
  error: string | null;
  fetchData: (id: number) => Promise<void>;
  addInteraction: (interactionData: { contacto_id: number; tipo: string; resumen: string; user_id: string; fecha_proximo_seguimiento?: string; }) => Promise<void>;
}

const initialState = {
  details: null,
  kpis: {
    deuda_actual: 0,
    total_historico_comprado: 0,
    ultima_compra: null,
    presupuestos_abiertos_valor: 0,
    presupuestos_abiertos_cantidad: 0,
  },
  timeline: [],
  pedidos: [],
  oportunidades: [],
  cuenta_corriente: [],
  isLoading: false,
  error: null,
};

export const useCliente360Store = create<Cliente360State>((set, get) => ({
  ...initialState,
  fetchData: async (id: number) => {
    set({ isLoading: true, error: null, ...initialState });
    try {
      const [details, kpis, timeline, pedidos, oportunidades, cuenta_corriente] = await Promise.all([
        api.getClientDetails(id),
        api.getClientKpis(id),
        api.getClientTimeline(id),
        api.getClientPedidos(id),
        api.getClientOportunidades(id),
        api.getClientCuentaCorriente(id),
      ]);

      // Ensure that `kpis` is an object before spreading.
      const safeKpis = (typeof kpis === 'object' && kpis !== null) ? kpis : {};

      set({
        details,
        kpis: { ...initialState.kpis, ...safeKpis },
        timeline,
        pedidos,
        oportunidades,
        cuenta_corriente,
        isLoading: false,
      });
    } catch (error: any) {
      console.error("Error fetching 360 data:", error);
      set({ error: error.message, isLoading: false });
    }
  },
  addInteraction: async (interactionData) => {
    try {
        await api.addInteraction(interactionData);
        // After adding, refresh the timeline to show the new interaction
        const updatedTimeline = await api.getClientTimeline(interactionData.contacto_id);
        set({ timeline: updatedTimeline });
    } catch (error: any) {
        console.error("Failed to add interaction:", error);
        // Optionally update the store with an error message to show in the UI
        throw error;
    }
  },
}));