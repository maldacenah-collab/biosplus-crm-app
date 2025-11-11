// src/pages/ComprasPage.tsx
import React, { useEffect, useState, useMemo } from 'react';
import { useCompraStore } from '../stores/useCompraStore';
import { useSharedStore } from '../stores/useSharedStore';
import { Compra } from '../types';
import { can } from '../utils/permissions';
import { formatCurrency } from '../utils/formatters';
import CompraModal from '../components/compras/CompraModal';
import RecepcionModal from '../components/compras/RecepcionModal';
import { exportToCSV } from '../utils/fileExport';
import ActionModal from '../components/common/ActionModal';
import { useActionModal } from '../utils/useActionModal';

const ComprasPage = () => {
    const { compras, isLoading, fetchCompras, reverseReception } = useCompraStore();
    const { providers, fetchSharedData } = useSharedStore();
    const { modalProps, showMessage } = useActionModal();
    
    const [isCompraModalOpen, setIsCompraModalOpen] = useState(false);
    const [isRecepcionModalOpen, setIsRecepcionModalOpen] = useState(false);
    const [editingCompra, setEditingCompra] = useState<Compra | null>(null);

    // State for filters
    const [searchTerm, setSearchTerm] = useState('');
    const [providerFilter, setProviderFilter] = useState('');
    const [dateFrom, setDateFrom] = useState('');
    const [dateTo, setDateTo] = useState('');


    useEffect(() => {
        fetchCompras();
        fetchSharedData();
        // Set default date range to this year
        setDateRange('thisYear');
    }, [fetchCompras, fetchSharedData]);

    const canCreate = can('compras:crear');
    const canEdit = can('compras:editar');
    const canReceive = can('compras:recepcionar');
    const canReverse = can('compras:reversar');
    
    const setDateRange = (period: 'thisMonth' | 'lastMonth' | 'thisYear') => {
        const now = new Date();
        let from = new Date();
        let to = new Date();

        if (period === 'thisMonth') {
            from = new Date(now.getFullYear(), now.getMonth(), 1);
            to = new Date(now.getFullYear(), now.getMonth() + 1, 0);
        } else if (period === 'lastMonth') {
            from = new Date(now.getFullYear(), now.getMonth() - 1, 1);
            to = new Date(now.getFullYear(), now.getMonth(), 0);
        } else if (period === 'thisYear') {
            from = new Date(now.getFullYear(), 0, 1);
            to = new Date(now.getFullYear(), 11, 31);
        }

        setDateFrom(from.toISOString().split('T')[0]);
        setDateTo(to.toISOString().split('T')[0]);
    };

    const filteredCompras = useMemo(() => {
        return compras.filter(compra => {
            const lowerSearchTerm = searchTerm.toLowerCase();

            const searchMatch = searchTerm === '' ||
                `oc-${String(compra.id).padStart(5, '0')}`.toLowerCase().includes(lowerSearchTerm) ||
                (compra.proveedores?.nombre || '').toLowerCase().includes(lowerSearchTerm) ||
                (compra.factura_proveedor_nro || '').toLowerCase().includes(lowerSearchTerm);

            const providerMatch = providerFilter === '' || compra.proveedor_id === parseInt(providerFilter);
            
            const fechaEmision = new Date(compra.fecha_emision || compra.created_at);
            const dateFromMatch = dateFrom === '' || fechaEmision >= new Date(dateFrom + 'T00:00:00');
            const dateToMatch = dateTo === '' || fechaEmision <= new Date(dateTo + 'T23:59:59');

            return searchMatch && providerMatch && dateFromMatch && dateToMatch;
        });
    }, [compras, searchTerm, providerFilter, dateFrom, dateTo]);

    const handleCreate = () => {
        setEditingCompra(null);
        setIsCompraModalOpen(true);
    };

    const handleEdit = (compra: Compra) => {
        setEditingCompra(compra);
        setIsCompraModalOpen(true);
    };

    const handleReceive = (compra: Compra) => {
        setEditingCompra(compra);
        setIsRecepcionModalOpen(true);
    };

    const handleReverse = async (compra: Compra) => {
        if (window.confirm(`¿Está seguro de que desea reversar la recepción de la OC-${String(compra.id).padStart(5, '0')}? Esta acción eliminará los lotes creados y devolverá la OC a estado 'Borrador'.`)) {
            try {
                await reverseReception(compra.id);
            } catch (error) {
                console.error("Failed to reverse reception", error);
            }
        }
    };

    const handleExport = () => {
        if (filteredCompras.length === 0) {
          showMessage('Sin datos', 'No hay datos para exportar con los filtros actuales.');
          return;
        }
        const headers = ["N° OC", "Fecha Emisión", "Proveedor", "Estado", "Total", "Factura N°"];
        const rows = filteredCompras.map(compra => [
            `OC-${String(compra.id).padStart(5, '0')}`,
            new Date(compra.fecha_emision || compra.created_at).toLocaleDateString('es-AR'),
            compra.proveedores?.nombre || 'N/A',
            compra.estado,
            compra.total_compra,
            compra.factura_proveedor_nro || ''
        ]);
        
        exportToCSV(headers, rows, `ordenes_de_compra_${new Date().toISOString().split('T')[0]}.csv`);
    };

    if (isLoading && compras.length === 0) {
        return <div className="text-center p-8">Cargando órdenes de compra...</div>;
    }

    return (
        <>
        <div>
            <div className="flex flex-wrap justify-between items-center mb-6 gap-4">
                <h1 className="text-3xl font-bold text-gray-800">Órdenes de Compra</h1>
                <div className="flex items-center gap-2">
                    <button onClick={handleExport} className="btn btn-secondary inline-flex items-center gap-2">
                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path></svg>
                        Exportar
                    </button>
                    {canCreate && (
                        <button onClick={handleCreate} className="btn btn-primary">
                            Crear Orden de Compra
                        </button>
                    )}
                </div>
            </div>

            <div className="bg-white p-4 rounded-lg shadow-md mb-6">
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 items-end">
                    <div className="lg:col-span-1">
                        <label htmlFor="search" className="block text-sm font-medium text-gray-700">Buscar</label>
                        <input type="text" id="search" placeholder="N° OC, Proveedor, Factura..." className="mt-1 form-input w-full" value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} />
                    </div>
                    <div>
                        <label htmlFor="providerFilter" className="block text-sm font-medium text-gray-700">Proveedor</label>
                        <select id="providerFilter" className="mt-1 form-input w-full" value={providerFilter} onChange={(e) => setProviderFilter(e.target.value)}>
                            <option value="">Todos</option>
                            {providers.map(p => <option key={p.id} value={p.id}>{p.nombre}</option>)}
                        </select>
                    </div>
                    <div className="space-y-2">
                        <div className="flex items-center gap-2">
                            <div>
                                <label htmlFor="date-from" className="block text-sm font-medium text-gray-700">Desde</label>
                                <input type="date" id="date-from" value={dateFrom} onChange={e => setDateFrom(e.target.value)} className="mt-1 form-input" />
                            </div>
                            <div>
                                <label htmlFor="date-to" className="block text-sm font-medium text-gray-700">Hasta</label>
                                <input type="date" id="date-to" value={dateTo} onChange={e => setDateTo(e.target.value)} className="mt-1 form-input" />
                            </div>
                        </div>
                         <div className="flex items-center gap-2 flex-wrap justify-end">
                            <button onClick={() => setDateRange('thisMonth')} className="btn btn-secondary text-xs">Mes actual</button>
                            <button onClick={() => setDateRange('lastMonth')} className="btn btn-secondary text-xs">Mes anterior</button>
                            <button onClick={() => setDateRange('thisYear')} className="btn btn-secondary text-xs">Este Año</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <div className="bg-background-card rounded-lg shadow-md overflow-hidden">
                <div className="overflow-x-auto">
                    <table className="w-full text-sm text-left text-gray-500">
                        <thead className="text-xs text-gray-700 uppercase bg-gray-50">
                            <tr>
                                <th scope="col" className="px-6 py-3">N° OC</th>
                                <th scope="col" className="px-6 py-3">Fecha</th>
                                <th scope="col" className="px-6 py-3">Proveedor</th>
                                <th scope="col" className="px-6 py-3">Estado</th>
                                <th scope="col" className="px-6 py-3 text-right">Total</th>
                                <th scope="col" className="px-6 py-3 text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            {filteredCompras.length === 0 && (
                                <tr><td colSpan={6} className="text-center p-8 text-gray-500">No se encontraron órdenes de compra con los filtros actuales.</td></tr>
                            )}
                            {filteredCompras.map(compra => (
                                <tr key={compra.id} className="bg-white border-b hover:bg-gray-50">
                                    <td className="px-6 py-4 font-medium text-primary hover:underline cursor-pointer" onClick={() => handleEdit(compra)}>
                                        OC-{String(compra.id).padStart(5, '0')}
                                    </td>
                                    <td className="px-6 py-4">{new Date(compra.fecha_emision || compra.created_at).toLocaleDateString('es-AR')}</td>
                                    <td className="px-6 py-4">{compra.proveedores?.nombre || 'N/A'}</td>
                                    <td className="px-6 py-4">
                                        <span className={`px-2 py-1 text-xs font-semibold rounded-full ${
                                            compra.estado === 'Borrador' ? 'bg-yellow-100 text-yellow-800' : 'bg-blue-100 text-blue-800'
                                        }`}>
                                            {compra.estado}
                                        </span>
                                    </td>
                                    <td className="px-6 py-4 text-right font-semibold">{formatCurrency(compra.total_compra)}</td>
                                    <td className="px-6 py-4 text-center space-x-2">
                                        {compra.estado === 'Borrador' && canEdit && (
                                            <button onClick={() => handleEdit(compra)} className="font-medium text-primary hover:underline">Editar</button>
                                        )}
                                        {compra.estado === 'Borrador' && canReceive && (
                                            <button onClick={() => handleReceive(compra)} className="btn-secondary text-xs bg-slate-100 text-slate-800 hover:bg-slate-200">Recepcionar</button>
                                        )}
                                         {compra.estado === 'Recibida' && canReverse && (
                                            <button onClick={() => handleReverse(compra)} className="btn-secondary text-xs bg-yellow-100 text-yellow-800 hover:bg-yellow-200">Reversar</button>
                                        )}
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </div>

            {isCompraModalOpen && (
                <CompraModal
                    isOpen={isCompraModalOpen}
                    onClose={() => setIsCompraModalOpen(false)}
                    compra={editingCompra}
                />
            )}

            {isRecepcionModalOpen && (
                 <RecepcionModal
                    isOpen={isRecepcionModalOpen}
                    onClose={() => setIsRecepcionModalOpen(false)}
                    compra={editingCompra}
                />
            )}
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default ComprasPage;
