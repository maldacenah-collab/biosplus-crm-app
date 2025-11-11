// src/stores/useLogisticaStore.ts
import { create } from 'zustand';
import * as api from '../services/logisticaApi';
import { Pedido, PedidoLogistica } from '../types';
import { supabase } from '../services/supabase';

interface LogisticaState {
  pedidos: Record<string, PedidoLogistica>;
  columns: Record<string, { title: string; pedidoIds: number[] }>;
  isLoading: boolean;
  error: string | null;
  fetchPedidos: () => Promise<void>;
  movePedido: (pedidoId: string, sourceColId: string, destColId: string, sourceIndex: number, destIndex: number) => void;
  updatePedidoProvider: (pedidoId: number, proveedorId: number) => Promise<void>;
  updatePedidoTracking: (pedidoId: number, tracking: string) => Promise<void>;
}

const columnMapping: Record<string, string> = {
  porPreparar: 'En Preparación',
  preparado: 'Preparado',
  despachado: 'Despachado',
  entregado: 'Entregado',
};

const statusToColumnId: Record<number, string> = {
  1: 'porPreparar',     // 'Pendiente'
  2: 'porPreparar',     // 'En Preparación' 
  8: 'porPreparar',     // 'Borrador' 
  6: 'preparado',       // 'Preparado'
  3: 'despachado',      // 'Despachado'
  4: 'entregado',       // 'Entregado'
};

const initialColumns = {
    porPreparar: { title: 'En Preparación', pedidoIds: [] },
    preparado: { title: 'Preparado', pedidoIds: [] },
    despachado: { title: 'Despachado', pedidoIds: [] },
    entregado: { title: 'Entregado', pedidoIds: [] },
};

export const useLogisticaStore = create<LogisticaState>((set, get) => ({
    pedidos: {},
    columns: { ...initialColumns },
    isLoading: false,
    error: null,

    fetchPedidos: async () => {
        set({ isLoading: true, error: null });
        try {
            const pedidosData = await api.getPedidosLogistica();
            
            const newPedidos: Record<string, PedidoLogistica> = {};
            const newColumns = {
                porPreparar: { title: 'En Preparación', pedidoIds: [] as number[] },
                preparado: { title: 'Preparado', pedidoIds: [] as number[] },
                despachado: { title: 'Despachado', pedidoIds: [] as number[] },
                entregado: { title: 'Entregado', pedidoIds: [] as number[] },
            };

            for (const pedido of pedidosData) {
                newPedidos[pedido.id] = pedido;
                const columnId = statusToColumnId[pedido.estado_id];
                if (columnId && newColumns[columnId]) {
                    newColumns[columnId].pedidoIds.push(pedido.id);
                }
            }
            
            Object.values(newColumns).forEach(column => {
                column.pedidoIds.sort((a, b) => {
                    const dateA = new Date(newPedidos[a].created_at).getTime();
                    const dateB = new Date(newPedidos[b].created_at).getTime();
                    return dateB - dateA;
                });
            });

            set({ pedidos: newPedidos, columns: newColumns, isLoading: false });
        } catch (error: any) {
            set({ error: error.message, isLoading: false });
        }
    },

    movePedido: async (pedidoId, sourceColId, destColId, sourceIndex, destIndex) => {
        const pedido = get().pedidos[pedidoId];
        const nuevoEstadoNombre = columnMapping[destColId];
        if (!nuevoEstadoNombre) {
            console.error(`Mapeo de columna no encontrado para: ${destColId}`);
            return;
        }
        
        if (!pedido.pagado && pedido.condicion_pago_dias === 0 && (destColId === 'preparado' || destColId === 'despachado')) {
            alert('Acción Bloqueada: El pedido tiene el pago pendiente.');
            return;
        }

        const originalColumns = get().columns;
        const sourceColumn = originalColumns[sourceColId];
        const destColumn = originalColumns[destColId];
        const sourcePedidoIds = Array.from(sourceColumn.pedidoIds);
        const [removed] = sourcePedidoIds.splice(sourceIndex, 1);
        
        const newColumns = { ...originalColumns, [sourceColId]: { ...sourceColumn, pedidoIds: sourcePedidoIds } };
        
        if (sourceColId === destColId) {
            sourcePedidoIds.splice(destIndex, 0, removed);
        } else {
            const destPedidoIds = Array.from(destColumn.pedidoIds);
            destPedidoIds.splice(destIndex, 0, removed);
            newColumns[destColId] = { ...destColumn, pedidoIds: destPedidoIds };
        }
        set({ columns: newColumns });

        try {
            await api.actualizarEstadoLogistica(parseInt(pedidoId), nuevoEstadoNombre);
            
            const destStateIdEntry = Object.entries(statusToColumnId).find(([, colId]) => colId === destColId);
            if (pedido && destStateIdEntry) {
                const destStateId = parseInt(destStateIdEntry[0]);
                const updatedPedido = { ...pedido, estado_id: destStateId, estado_nombre: nuevoEstadoNombre };
                set(state => ({
                    pedidos: {
                        ...state.pedidos,
                        [pedidoId]: updatedPedido
                    }
                }));
            }
        } catch (error) {
            alert('No se pudo actualizar el estado del pedido.');
            set({ columns: originalColumns });
        }
    },
    
    updatePedidoProvider: async (pedidoId, proveedorId) => {
        try {
            await api.updatePedidoLogistica(pedidoId, { proveedor_logistica_id: proveedorId });
            set(state => ({
                pedidos: {
                    ...state.pedidos,
                    [pedidoId]: { ...state.pedidos[pedidoId], proveedor_logistica_id: proveedorId }
                }
            }));
        } catch (error) {
             alert('No se pudo actualizar el proveedor.');
        }
    },

    updatePedidoTracking: async (pedidoId, tracking) => {
        try {
            await api.updatePedidoLogistica(pedidoId, { numero_seguimiento: tracking });
            set(state => ({
                pedidos: {
                    ...state.pedidos,
                    [pedidoId]: { ...state.pedidos[pedidoId], numero_seguimiento: tracking }
                }
            }));
        } catch (error) {
            alert('No se pudo guardar el número de seguimiento.');
        }
    }
}));
