// src/components/inventario/AuditoriaTab.tsx
import { useState } from 'react';
import { useInventarioStore } from '../../stores/useInventarioStore';
import { useSharedStore } from '../../stores/useSharedStore';
import { exportToCSV } from '../../utils/fileExport';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface AuditoriaTabProps {
    onViewKardex: (loteId: number) => void;
    onAdjustStock: (productId: number, productName: string) => void;
}

const AuditoriaTab = ({ onViewKardex, onAdjustStock }: AuditoriaTabProps) => {
    const { auditResults, isLoading, runAudit } = useInventarioStore();
    const { lotes } = useSharedStore(); 
    const [hasRun, setHasRun] = useState(false);
    const { modalProps, showMessage } = useActionModal();

    const handleRunAudit = () => {
        setHasRun(true);
        runAudit();
    };
    
    const discrepancies = auditResults.filter(r => r.diferencia !== 0);

    const handleExport = () => {
        if (discrepancies.length === 0) {
            showMessage('Sin datos', 'No hay discrepancias para exportar.');
            return;
        }
        exportToCSV(
            ["ID Lote", "Producto", "N° Lote", "Stock Teórico", "Stock Actual", "Diferencia"],
            discrepancies.map(d => [d.lote_id, d.producto_nombre, d.numero_lote, d.stock_fisico_teorico, d.stock_fisico_actual, d.diferencia]),
            `auditoria_discrepancias_${new Date().toISOString().split('T')[0]}.csv`
        );
    };

    return (
        <>
        <div className="space-y-6">
            <div className="bg-yellow-50 border-l-4 border-yellow-400 p-4 rounded-md shadow-sm">
                <p className="text-sm text-yellow-700">
                    Esta herramienta recalcula el stock de cada lote, comparándolo con el valor actual. Las discrepancias indican un problema que puede requerir un ajuste manual.
                </p>
            </div>
            <div className="text-center">
                <button onClick={handleRunAudit} className="bg-red-600 text-white font-semibold py-3 px-8 rounded-lg shadow-md hover:bg-red-700 transition-colors disabled:bg-red-400" disabled={isLoading}>
                    {isLoading ? 'Auditando...' : 'Ejecutar Auditoría Completa'}
                </button>
            </div>
            <div className="bg-white p-6 rounded-lg shadow-md">
                {!hasRun ? <p className="text-center text-gray-500 py-8">Haga clic para iniciar la auditoría.</p> :
                 isLoading ? <p className="text-center text-gray-500 py-8">Procesando...</p> :
                 discrepancies.length === 0 ? <p className="text-center text-text-secondary font-semibold py-8">¡Auditoría completada! No se encontraron inconsistencias.</p> :
                 (
                    <>
                        <div className="flex justify-between items-center mb-4">
                            <h3 className="text-xl font-bold text-red-600">Resultados ({discrepancies.length} Lotes con Discrepancias)</h3>
                            <button onClick={handleExport} className="btn btn-secondary hidden md:inline-flex items-center gap-2">
                                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path></svg>
                                Exportar
                            </button>
                        </div>
                        <div className="overflow-x-auto">
                            <table className="w-full text-sm">
                                <thead className="bg-gray-100 uppercase text-xs">
                                    <tr>
                                        <th className="p-2">Lote / Producto</th>
                                        <th className="p-2 text-center">Teórico</th>
                                        <th className="p-2 text-center">Actual</th>
                                        <th className="p-2 text-center bg-red-100">Diferencia</th>
                                        <th className="p-2 text-center">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {discrepancies.map(r => {
                                        const lote = lotes.find(l => l.id === r.lote_id);
                                        const productId = lote?.producto_id;
                                        return (
                                            <tr key={r.lote_id} className="border-t bg-red-50 hover:bg-red-100">
                                                <td className="p-2">
                                                    <p className="font-semibold">{r.numero_lote}</p>
                                                    <p className="text-xs text-gray-600">{r.producto_nombre}</p>
                                                </td>
                                                <td className="p-2 text-center font-bold text-blue-600">{r.stock_fisico_teorico}</td>
                                                <td className="p-2 text-center font-bold">{r.stock_fisico_actual}</td>
                                                <td className={`p-2 text-center font-bold text-xl ${r.diferencia !== 0 ? 'text-red-700 bg-red-200' : 'text-text-secondary'} rounded`}>{r.diferencia}</td>
                                                <td className="p-2 text-center space-x-2">
                                                    <button onClick={() => onViewKardex(r.lote_id)} className="btn-secondary text-xs" title="Ver Historial">Kardex</button>
                                                    <button onClick={() => onAdjustStock(productId || 0, r.producto_nombre)} className="btn-secondary text-xs" disabled={!productId} title="Ajustar Stock">Ajustar</button>
                                                </td>
                                            </tr>
                                        );
                                    })}
                                </tbody>
                            </table>
                        </div>
                    </>
                 )
                }
            </div>
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default AuditoriaTab;
