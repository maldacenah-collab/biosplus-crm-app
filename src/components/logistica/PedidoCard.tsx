// src/components/logistica/PedidoCard.tsx
// Fix: Import React to resolve "Cannot find namespace 'React'" error.
import React, { useState, useMemo } from 'react';
import { PedidoLogistica } from '../../types';
import * as api from '../../services/logisticaApi';
import { useLogisticaStore } from '../../stores/useLogisticaStore';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface PedidoCardProps {
    pedido: PedidoLogistica;
    onProviderChange: (pedidoId: number, providerId: number) => void;
    onTrackingChange: (pedidoId: number, tracking: string) => void;
}

const logisticProviders = [
    { id: 1, name: 'OCA' },
    { id: 2, name: 'Andreani' },
    { id: 3, name: 'Correo Argentino' },
    { id: 4, name: 'Reparto Propio' },
];

const PedidoCard = ({ pedido, onProviderChange, onTrackingChange }: PedidoCardProps) => {
    const [trackingNumber, setTrackingNumber] = useState(pedido.numero_seguimiento || '');
    const { fetchPedidos } = useLogisticaStore();
    const { modalProps, showMessage, hideModal } = useActionModal();
    
    const handleTrackingBlur = () => {
        if (trackingNumber !== pedido.numero_seguimiento) {
            onTrackingChange(pedido.id, trackingNumber);
        }
    };
    
    const handleTrackingKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
        if (e.key === 'Enter') {
            (e.target as HTMLInputElement).blur();
        }
    };

    const handleReverseStatus = async (e: React.MouseEvent) => {
        e.stopPropagation();
        if (window.confirm("¿Seguro que desea reversar el estado de este pedido a 'Despachado'?")) {
            try {
                await api.actualizarEstadoLogistica(pedido.id, 'Despachado');
                await fetchPedidos(); // Refresh the whole board
            } catch (error) {
                showMessage('Error', 'No se pudo reversar el estado.', [
                    { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
                ]);
            }
        }
    };

    const isContado = pedido.condicion_pago_dias === 0;
    const paymentStatus = isContado ? (pedido.pagado ? 'pagado' : 'pendiente') : null;

    const isUrgent = useMemo(() => {
        if (!pedido.fecha_entrega_prevista) return false;
        const today = new Date();
        const deliveryDate = new Date(pedido.fecha_entrega_prevista);
        const diffTime = deliveryDate.getTime() - today.getTime();
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
        return diffDays >= 0 && diffDays <= 3;
    }, [pedido.fecha_entrega_prevista]);
    
    const isDelivered = pedido.estado_nombre === 'Entregado';

    return (
        <>
        <div className={`bg-white rounded-lg p-3 border-l-4 ${isUrgent ? 'border-amber-400' : 'border-transparent'}`}>
            <div className="flex justify-between items-start">
                <p className="text-xs text-gray-500 font-medium">#{pedido.numero_pedido}</p>
                 {paymentStatus && (
                    <span className={`px-2 py-0.5 text-xs font-semibold rounded-full ${
                        paymentStatus === 'pagado' ? 'bg-primary/10 text-primary' : 'bg-red-100 text-red-800'
                    }`}>
                        {paymentStatus === 'pagado' ? 'PAGADO' : 'PAGO PENDIENTE'}
                    </span>
                )}
            </div>
            <p className="font-bold text-gray-800 mt-1">{pedido.contactos.nombre}</p>
            <p className="text-sm text-gray-600">{pedido.destino}</p>
            
            <div className="mt-3 pt-3 border-t space-y-2">
                <div>
                    <select
                        className="text-xs form-input p-1 w-full"
                        value={pedido.proveedor_logistica_id || ''}
                        onChange={(e) => onProviderChange(pedido.id, parseInt(e.target.value))}
                        onClick={(e) => e.stopPropagation()}
                        disabled={isDelivered}
                    >
                        <option value="">-- Proveedor --</option>
                        {logisticProviders.map(p => <option key={p.id} value={p.id}>{p.name}</option>)}
                    </select>
                </div>
                <div>
                    <input 
                        type="text" 
                        placeholder="N° de Seguimiento" 
                        className="text-xs form-input p-1 w-full"
                        value={trackingNumber}
                        onChange={(e) => setTrackingNumber(e.target.value)}
                        onBlur={handleTrackingBlur}
                        onKeyDown={handleTrackingKeyDown}
                        onClick={(e) => e.stopPropagation()}
                        disabled={isDelivered}
                    />
                </div>
                 <div className="text-right">
                    {isDelivered ? (
                        <button onClick={handleReverseStatus} className="text-xs text-yellow-600 hover:text-yellow-800 font-semibold">
                           ⟲ Reversar Estado
                        </button>
                    ) : (
                        <button className="text-xs text-gray-500 hover:text-primary disabled:opacity-50" disabled>
                            Cotizar con OCA
                        </button>
                    )}
                </div>
            </div>
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default PedidoCard;
