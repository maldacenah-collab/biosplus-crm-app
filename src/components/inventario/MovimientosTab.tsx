// src/components/inventario/MovimientosTab.tsx
// Fix: Import React to resolve "Cannot find namespace 'React'" error.
import React, { useEffect, useState } from 'react';
import { useInventarioStore } from '../../stores/useInventarioStore';
import { exportToCSV } from '../../utils/fileExport';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

const MovimientosTab = () => {
    const { movimientos, isLoading, fetchMovimientos } = useInventarioStore();
    const [filters, setFilters] = useState<{ from: string, to: string }>({ from: '', to: '' });
    const { modalProps, showMessage } = useActionModal();

    useEffect(() => {
        const today = new Date();
        const firstDayOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
        const from = firstDayOfMonth.toISOString().split('T')[0];
        const to = today.toISOString().split('T')[0];
        setFilters({ from, to });
        fetchMovimientos(from, to);
    }, [fetchMovimientos]);

    const handleFilterChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setFilters(prev => ({ ...prev, [e.target.name]: e.target.value }));
    };

    const handleApplyFilters = () => {
        fetchMovimientos(filters.from, filters.to);
    };

    const handleExport = () => {
        if(movimientos.length === 0) {
            showMessage('Sin datos', 'No hay movimientos para exportar.');
            return;
        }
        exportToCSV(
            ["Fecha", "Tipo", "Producto", "Lote", "Cantidad", "Origen", "Destino", "Justificacion"],
            movimientos.map(m => [ new Date(m.fecha).toLocaleString('es-AR'), m.tipo_movimiento, m.producto_nombre, m.numero_lote, m.cantidad, m.origen, m.destino, m.justificacion ]),
            `movimientos_stock_${new Date().toISOString().split('T')[0]}.csv`
        );
    };

    return (
        <>
        <div className="space-y-6">
            <div className="bg-white p-6 rounded-lg shadow-md flex flex-wrap items-center justify-between gap-4">
                <div className="flex items-center gap-2 flex-wrap">
                    <label className="text-sm">Desde:</label>
                    <input type="date" name="from" value={filters.from} onChange={handleFilterChange} className="form-input" />
                    <label className="text-sm">Hasta:</label>
                    <input type="date" name="to" value={filters.to} onChange={handleFilterChange} className="form-input" />
                    <button onClick={handleApplyFilters} className="btn btn-primary">Filtrar</button>
                </div>
                <button onClick={handleExport} className="btn btn-secondary hidden md:inline-flex items-center gap-2">
                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path></svg>
                    Exportar
                </button>
            </div>
            <div className="bg-white p-6 rounded-lg shadow-md">
                <h2 className="text-xl font-semibold mb-4">Historial de Movimientos</h2>
                <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                        <thead className="text-xs uppercase bg-gray-50">
                            <tr>
                                <th className="px-6 py-3">Fecha</th>
                                <th className="px-6 py-3">Tipo</th>
                                <th className="px-6 py-3">Producto</th>
                                <th className="px-6 py-3">Lote</th>
                                <th className="px-6 py-3 text-center">Cantidad</th>
                                <th className="px-6 py-3">Origen/Destino</th>
                                <th className="px-6 py-3">Justificación</th>
                            </tr>
                        </thead>
                        <tbody>
                            {isLoading && <tr><td colSpan={7} className="text-center p-4">Cargando...</td></tr>}
                            {!isLoading && movimientos.length === 0 && <tr><td colSpan={7} className="text-center p-4">No se encontraron movimientos.</td></tr>}
                            {!isLoading && movimientos.map((m, i) => {
                                const isPositive = m.cantidad > 0 || m.tipo_movimiento.toLowerCase().includes('entrada') || m.tipo_movimiento.toLowerCase().includes('devolución');
                                return (
                                <tr key={i} className="border-b">
                                    <td className="px-6 py-4 whitespace-nowrap">{new Date(m.fecha).toLocaleString('es-AR', { dateStyle: 'short', timeStyle: 'short' })}</td>
                                    <td className="px-6 py-4"><span className={`text-xs font-medium px-2 py-1 rounded-full ${isPositive ? 'bg-slate-100 text-slate-800' : 'bg-red-100 text-red-800'}`}>{m.tipo_movimiento}</span></td>
                                    <td className="px-6 py-4">{m.producto_nombre}</td>
                                    <td className="px-6 py-4">{m.numero_lote || 'N/A'}</td>
                                    <td className={`px-6 py-4 text-center font-bold ${isPositive ? 'text-text-secondary' : 'text-red-600'}`}>{m.cantidad}</td>
                                    <td className="px-6 py-4">{m.origen} &rarr; {m.destino}</td>
                                    <td className="px-6 py-4 text-xs">{m.justificacion}</td>
                                </tr>
                            )})}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default MovimientosTab;
