// src/components/inventario/KardexModal.tsx
import { useEffect, useState } from 'react';
import { MovimientoStock } from '../../types';
import * as api from '../../services/inventarioApi';
import { useSharedStore } from '../../stores/useSharedStore';

interface KardexModalProps {
  isOpen: boolean;
  loteId: number | null;
  onClose: () => void;
}

const KardexModal = ({ isOpen, loteId, onClose }: KardexModalProps) => {
    const [movimientos, setMovimientos] = useState<MovimientoStock[]>([]);
    const [isLoading, setIsLoading] = useState(false);
    const { lotes, products } = useSharedStore();

    useEffect(() => {
        if (isOpen && loteId) {
            setIsLoading(true);
            api.getMovimientosPorLote(loteId)
                .then(setMovimientos)
                .finally(() => setIsLoading(false));
        } else {
            setMovimientos([]);
        }
    }, [isOpen, loteId]);

    const loteInfo = lotes.find(l => l.id === loteId);
    const productoInfo = loteInfo ? products.find(p => p.id === loteInfo.producto_id) : null;

    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 bg-black bg-opacity-50 z-[60] flex justify-center items-center p-4">
            <div className="bg-white rounded-lg shadow-xl w-full max-w-4xl max-h-[90vh] flex flex-col">
                <div className="p-4 border-b flex justify-between items-center">
                    <h3 className="text-xl font-semibold">Historial del Lote: {loteInfo?.numero_lote || ''}</h3>
                    <button onClick={onClose} className="text-3xl font-light">&times;</button>
                </div>
                <div className="flex-grow overflow-y-auto p-6">
                    <div className="mb-4 p-4 bg-gray-50 rounded-lg text-sm space-y-1">
                        <p><strong>Producto:</strong> {productoInfo?.nombre || 'N/A'}</p>
                        <p><strong>Cantidad Inicial:</strong> {loteInfo?.cantidad_inicial || 0} unidades</p>
                    </div>
                    <div className="overflow-x-auto">
                        {isLoading ? <p className="text-center">Cargando historial...</p> :
                        <table className="w-full text-sm">
                            <thead className="bg-gray-100 uppercase text-xs">
                                <tr>
                                    <th className="p-2 text-left">Fecha</th>
                                    <th className="p-2 text-left">Tipo</th>
                                    <th className="p-2 text-left">Referencia</th>
                                    <th className="p-2 text-left">Detalle</th>
                                    <th className="p-2 text-center">Cantidad</th>
                                </tr>
                            </thead>
                            <tbody>
                                {movimientos.length === 0 && <tr><td colSpan={5} className="text-center p-4">No hay movimientos para este lote.</td></tr>}
                                {movimientos.map((m, i) => (
                                    <tr key={i} className="border-t">
                                        <td className="p-2 whitespace-nowrap">{new Date(m.fecha).toLocaleString('es-AR')}</td>
                                        <td className="p-2">{m.tipo_movimiento}</td>
                                        <td className="p-2">{m.referencia}</td>
                                        <td className="p-2 text-xs">{m.detalle}</td>
                                        <td className={`p-2 text-center font-semibold ${m.cantidad > 0 ? 'text-green-600' : 'text-red-600'}`}>{m.cantidad > 0 ? `+${m.cantidad}` : m.cantidad}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                        }
                    </div>
                </div>
                <div className="p-4 border-t flex justify-end">
                    <button onClick={onClose} className="btn btn-secondary">Cerrar</button>
                </div>
            </div>
        </div>
    );
};

export default KardexModal;