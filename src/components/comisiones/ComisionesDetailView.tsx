// src/components/comisiones/ComisionesDetailView.tsx
// Fix: Import 'React' to resolve "Cannot find namespace 'React'" error, which is necessary for using types like React.ChangeEvent.
import React, { useEffect, useState, useMemo } from 'react';
import { useComisionesStore } from '../../stores/useComisionesStore';
import { useSharedStore } from '../../stores/useSharedStore';
import { ComisionDetalle } from '../../types';
import { can } from '../../utils/permissions';
import { formatCurrency } from '../../utils/formatters';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface Props {
    vendedorId: number;
    onBack?: () => void;
}

const ComisionesDetailView = ({ vendedorId, onBack }: Props) => {
    const { detalle, isDetailLoading, fetchDetalleVendedor, liquidarComisiones } = useComisionesStore();
    const { salespeople } = useSharedStore();
    
    const [selectedComisiones, setSelectedComisiones] = useState<number[]>([]);
    const [concepto, setConcepto] = useState('');
    const [comprobante, setComprobante] = useState<File | null>(null);
    const [isSaving, setIsSaving] = useState(false);
    const { modalProps, showMessage, hideModal } = useActionModal();

    const puedeLiquidar = can('comisiones:liquidar');
    const vendedor = salespeople.find(v => v.id === vendedorId);

    useEffect(() => {
        fetchDetalleVendedor(vendedorId);
    }, [vendedorId, fetchDetalleVendedor]);

    const totalAPagar = useMemo(() => {
        return detalle.pendientes
            .filter(c => selectedComisiones.includes(c.comision_id))
            .reduce((sum, c) => sum + c.monto_comision, 0);
    }, [detalle.pendientes, selectedComisiones]);

    const handleSelectAll = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (e.target.checked) {
            setSelectedComisiones(detalle.pendientes.map(c => c.comision_id));
        } else {
            setSelectedComisiones([]);
        }
    }

    const handleSelect = (id: number) => {
        setSelectedComisiones(prev => 
            prev.includes(id) ? prev.filter(item => item !== id) : [...prev, id]
        );
    }
    
    const handleLiquidar = async () => {
        if (selectedComisiones.length === 0 || !comprobante || !concepto) {
            showMessage('Datos incompletos', 'Seleccione comisiones, un comprobante y un concepto.', [
                { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
            ]);
            return;
        }
        setIsSaving(true);
        try {
            await liquidarComisiones(vendedorId, selectedComisiones, concepto, comprobante);
            showMessage('Liquidación exitosa', 'Liquidación exitosa.', [
                { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
            ]);
            setSelectedComisiones([]);
            setConcepto('');
            setComprobante(null);
        } catch(error: any) {
            showMessage('Error', `Error: ${error.message}`, [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
            ]);
        } finally {
            setIsSaving(false);
        }
    };

    if (isDetailLoading) return <div>Cargando detalle de comisiones...</div>;

    return (
        <>
        <div className="space-y-8">
            <div className="flex items-center justify-between">
                <h2 className="text-xl font-semibold">Detalle para: <span className="text-primary">{vendedor?.perfiles.nombre}</span></h2>
                {onBack && <button onClick={onBack} className="btn btn-secondary text-sm">&larr; Volver al resumen</button>}
            </div>

            <div className="bg-white p-6 rounded-lg shadow-md">
                <h3 className="text-lg font-semibold mb-4">Comisiones Pendientes de Pago</h3>
                {detalle.pendientes.length > 0 ? (
                    <div className="overflow-x-auto">
                        <table className="w-full text-sm">
                            <thead className="bg-gray-50">
                                <tr>
                                    {puedeLiquidar && <th className="p-2"><input type="checkbox" onChange={handleSelectAll} /></th>}
                                    <th className="p-2 text-left">Pedido</th><th className="p-2 text-left">Cliente</th>
                                    <th className="p-2 text-right">Monto</th><th className="p-2 text-center">Fecha Comisión</th>
                                </tr>
                            </thead>
                            <tbody>
                                {detalle.pendientes.map(c => (
                                    <tr key={c.comision_id} className="border-t">
                                        {puedeLiquidar && <td className="p-2"><input type="checkbox" checked={selectedComisiones.includes(c.comision_id)} onChange={() => handleSelect(c.comision_id)}/></td>}
                                        <td className="p-2">{c.pedido_numero}</td>
                                        <td className="p-2">{c.cliente_nombre}</td>
                                        <td className="p-2 text-right font-semibold text-text-secondary">{formatCurrency(c.monto_comision)}</td>
                                        <td className="p-2 text-center">{new Date(c.fecha_generacion).toLocaleDateString('es-AR')}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                ) : <p className="text-center text-gray-500 py-4">No hay comisiones pendientes.</p>}
                
                {puedeLiquidar && detalle.pendientes.length > 0 && (
                    <div className="border-t mt-6 pt-6">
                        <h4 className="font-semibold mb-4">Liquidar Comisiones Seleccionadas</h4>
                         <div className="grid grid-cols-1 md:grid-cols-2 gap-6 items-end">
                            <div>
                                <div className="mb-4"><label className="form-label">Concepto</label><input type="text" value={concepto} onChange={e => setConcepto(e.target.value)} className="form-input" placeholder="Ej: Comisiones Septiembre 2025" /></div>
                                <div><label className="form-label">Comprobante</label><input type="file" onChange={e => setComprobante(e.target.files ? e.target.files[0] : null)} className="form-input" /></div>
                            </div>
                            <div className="text-right">
                                <p>Total a Liquidar:</p>
                                <p className="text-2xl font-bold text-primary">{formatCurrency(totalAPagar)}</p>
                                <button onClick={handleLiquidar} className="btn btn-primary mt-2" disabled={isSaving || selectedComisiones.length === 0}>
                                    {isSaving ? 'Procesando...' : 'Liquidar y Pagar'}
                                </button>
                            </div>
                         </div>
                    </div>
                )}
            </div>

            <div className="bg-white p-6 rounded-lg shadow-md">
                <h3 className="text-lg font-semibold mb-4">Historial de Pagos</h3>
                {detalle.historial.length > 0 ? (
                    <div className="overflow-x-auto">
                        <table className="w-full text-sm">
                            <thead className="bg-gray-50"><tr><th className="p-2 text-left">Fecha</th><th className="p-2 text-left">Concepto</th><th className="p-2 text-right">Monto</th><th className="p-2 text-center">Comprobante</th></tr></thead>
                            <tbody>
                                {detalle.historial.map(p => (
                                    <tr key={p.id} className="border-t">
                                        <td className="p-2">{new Date(p.fecha_pago).toLocaleDateString('es-AR')}</td>
                                        <td className="p-2">{p.concepto}</td>
                                        <td className="p-2 text-right font-semibold">{formatCurrency(p.monto_total)}</td>
                                        <td className="p-2 text-center">{p.comprobante_url ? <a href={p.comprobante_url} target="_blank" rel="noopener noreferrer" className="text-primary hover:underline">Ver</a> : 'N/A'}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                ) : <p className="text-center text-gray-500 py-4">No hay pagos registrados.</p>}
            </div>
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default ComisionesDetailView;
