// src/components/compras/RecepcionModal.tsx
import React, { useState } from 'react';
import { useCompraStore } from '../../stores/useCompraStore';
import { Compra, Lote } from '../../types';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface RecepcionModalProps {
    isOpen: boolean;
    onClose: () => void;
    compra: Compra | null;
}

const RecepcionModal = ({ isOpen, onClose, compra }: RecepcionModalProps) => {
    const { receiveCompra } = useCompraStore();
    const [isSaving, setIsSaving] = useState(false);
    const { modalProps, showMessage, hideModal } = useActionModal();
    
    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!compra) return;

        setIsSaving(true);
        try {
            const facturaNro = (document.getElementById('rec-factura-nro') as HTMLInputElement).value.trim() || null;
            const lotesData: Partial<Lote>[] = [];
            
            for (let i = 0; i < compra.productos.length; i++) {
                const producto = compra.productos[i];
                const cantidad = parseInt((document.getElementById(`rec-qty-${i}`) as HTMLInputElement).value, 10);
                const numeroLote = (document.getElementById(`rec-lote-${i}`) as HTMLInputElement).value.trim();
                const fechaVencimiento = (document.getElementById(`rec-venc-${i}`) as HTMLInputElement).value || null;

                if (cantidad > 0) {
                    if (!numeroLote || !fechaVencimiento) {
                        throw new Error(`Complete el lote y vencimiento para "${producto.nombre}".`);
                    }
                    lotesData.push({
                        producto_id: producto.producto_id,
                        compra_id: compra.id,
                        numero_lote: numeroLote,
                        fecha_vencimiento: fechaVencimiento,
                        cantidad_inicial: cantidad,
                        stock_disponible: cantidad,
                    });
                }
            }
            
            await receiveCompra(compra.id, facturaNro, lotesData);
            onClose();
        } catch (error: any) {
            showMessage('Error al guardar', `Error al guardar recepción: ${error.message}`, [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
            ]);
        } finally {
            setIsSaving(false);
        }
    };
    
    if (!isOpen || !compra) return null;

    return (
        <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center p-4">
            <div className="bg-white rounded-lg shadow-xl w-full max-w-3xl max-h-[90vh] flex flex-col">
                <div className="p-4 border-b flex justify-between items-center">
                    <h2 className="text-xl font-semibold">Recepcionar OC-{String(compra.id).padStart(5, '0')}</h2>
                    <button onClick={onClose} className="text-3xl font-light text-gray-500 hover:text-gray-800">&times;</button>
                </div>
                <form onSubmit={handleSubmit} className="flex-grow overflow-y-auto p-6 space-y-4">
                    <div className="mb-4">
                        <label htmlFor="rec-factura-nro" className="form-label">N° Factura/Remito Proveedor (Opcional)</label>
                        <input type="text" id="rec-factura-nro" defaultValue={compra.factura_proveedor_nro || ''} className="form-input w-full md:w-1/2" />
                    </div>
                    {compra.productos.map((prod, i) => (
                        <div key={`${prod.producto_id}-${i}`} className="p-4 border rounded-lg bg-gray-50">
                            <h4 className="font-semibold">{prod.nombre}</h4>
                            <p className="text-sm text-gray-600">Cantidad Pedida: {prod.cantidad}</p>
                            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mt-2">
                                <div><label htmlFor={`rec-qty-${i}`} className="form-label">Cant. Recibida</label><input type="number" id={`rec-qty-${i}`} defaultValue={prod.cantidad} className="form-input mt-1" required /></div>
                                <div><label htmlFor={`rec-lote-${i}`} className="form-label">N° de Lote</label><input type="text" id={`rec-lote-${i}`} className="form-input mt-1" /></div>
                                <div><label htmlFor={`rec-venc-${i}`} className="form-label">Vencimiento</label><input type="date" id={`rec-venc-${i}`} className="form-input mt-1" /></div>
                            </div>
                        </div>
                    ))}

                    <div className="p-4 border-t flex justify-end gap-2 mt-4 -mx-6 -mb-6 bg-gray-50 rounded-b-lg">
                        <button type="button" onClick={onClose} className="btn btn-secondary">Cancelar</button>
                        <button type="submit" className="btn btn-primary" disabled={isSaving}>{isSaving ? 'Guardando...' : 'Confirmar Recepción'}</button>
                    </div>
                </form>
            </div>
            <ActionModal {...modalProps} />
        </div>
    );
};

export default RecepcionModal;
