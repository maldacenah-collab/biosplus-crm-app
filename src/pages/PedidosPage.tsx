// src/pages/PedidosPage.tsx
import { useEffect, useState, useMemo } from 'react';
import { useLocation, useParams, useNavigate } from 'react-router-dom';
import { usePedidoStore } from '../stores/usePedidoStore';
import { useSharedStore } from '../stores/useSharedStore';
import PedidoModal from '../components/pedidos/PedidoModal';
import { Pedido, Opportunity } from '../types';
import { exportToCSV } from '../utils/fileExport';
import ActionModal from '../components/common/ActionModal';
import { useActionModal } from '../utils/useActionModal';

const PedidosPage = () => {
    const { pedidos, isLoading, fetchPedidos } = usePedidoStore();
    const { fetchSharedData, currentUser, modalState, openModal, closeModal } = useSharedStore();
    const params = useParams();
    const navigate = useNavigate();
    const location = useLocation();
    const { modalProps, showMessage } = useActionModal();
    
    const [dateFrom, setDateFrom] = useState('');
    const [dateTo, setDateTo] = useState('');

    useEffect(() => {
        fetchPedidos();
        fetchSharedData();
        setDateRange('thisMonth');
    }, [fetchPedidos, fetchSharedData]);

    // Efecto para controlar el modal basado en la URL
    useEffect(() => {
        const { action, pedidoId } = params;
        const isModalOpenInStore = modalState.pedido.isOpen;

        if (action === 'new' || action === 'edit') {
            const currentIdInStore = modalState.pedido.pedidoId;
            const newId = pedidoId ? Number(pedidoId) : null;
            
            if (!isModalOpenInStore || currentIdInStore !== newId) {
                openModal('pedido', { 
                    pedidoId: newId, 
                    opportunityData: location.state?.opportunityData as Opportunity | null 
                });
            }
        } else {
            if (isModalOpenInStore) {
                closeModal('pedido');
            }
        }
    }, [params, modalState.pedido, openModal, closeModal, location.state]);

    const handleOpenModal = (pedidoId: number, readOnly = false) => {
        navigate(`/pedidos/edit/${pedidoId}`);
    };
    
    const handleCloseModal = () => {
        navigate('/pedidos');
    };
    
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
            to = now;
        }

        setDateFrom(from.toISOString().split('T')[0]);
        setDateTo(to.toISOString().split('T')[0]);
    };

    const filteredPedidos = useMemo(() => {
        let userVisiblePedidos = pedidos;
        const isAdmin = currentUser?.roles?.includes('Superadministrador') || currentUser?.roles?.includes('Administracion');
        
        if (!isAdmin && currentUser?.vendedorId) {
            userVisiblePedidos = pedidos.filter(p => p.vendedor_id === currentUser.vendedorId);
        }

        return userVisiblePedidos.filter(pedido => {
            if (!dateFrom || !dateTo) return true;
            
            const startOfDayFrom = new Date(dateFrom + 'T00:00:00');
            const endOfDayTo = new Date(dateTo + 'T23:59:59');
            const pedidoDate = new Date(pedido.created_at);

            return pedidoDate >= startOfDayFrom && pedidoDate <= endOfDayTo;
        });
    }, [pedidos, dateFrom, dateTo, currentUser]);

    const handleExport = () => {
      if (filteredPedidos.length === 0) {
        alert("No hay pedidos para exportar con los filtros actuales.");
        return;
      }

      const headers = ["N° Pedido", "Cliente", "Estado", "Fecha", "Producto", "Cantidad", "Precio Unitario", "Subtotal"];
      const rows: (string|number)[][] = [];

      for (const pedido of filteredPedidos) {
        if (pedido.productos && pedido.productos.length > 0) {
            for (const producto of pedido.productos) {
                rows.push([
                    pedido.numero_pedido,
                    `"${pedido.contactos?.nombre?.replace(/"/g, '""') || 'N/A'}"`,
                    pedido.estados_pedido?.nombre || 'N/A',
                    new Date(pedido.created_at).toLocaleDateString('es-AR'),
                    `"${producto.nombre.replace(/"/g, '""')}"`,
                    producto.cantidad,
                    producto.precio_unitario,
                    producto.subtotal
                ]);
            }
        } else {
             rows.push([
                pedido.numero_pedido,
                `"${pedido.contactos?.nombre?.replace(/"/g, '""') || 'N/A'}"`,
                pedido.estados_pedido?.nombre || 'N/A',
                new Date(pedido.created_at).toLocaleDateString('es-AR'),
                "SIN PRODUCTOS", 0, 0, 0
            ]);
        }
      }

      const csvContent = [headers.join(';'), ...rows.map(row => row.join(';'))].join('\n');
      const blob = new Blob(["\uFEFF" + csvContent], { type: 'text/csv;charset=utf-8;' });
      const link = document.createElement("a");
      const url = URL.createObjectURL(blob);
      link.setAttribute("href", url);
      link.setAttribute("download", `pedidos_detallado_${new Date().toISOString().split('T')[0]}.csv`);
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    };

    const canViewPrices = true; 

    if (isLoading && pedidos.length === 0) {
        return <div className="text-center p-8">Cargando pedidos...</div>;
    }

    return (
        <>
        <div>
            <div className="flex flex-wrap justify-between items-center mb-6 gap-4">
                <h1 className="text-3xl font-bold text-text-main">Pedidos</h1>
                <div className="flex items-center gap-2">
                    <button onClick={handleExport} className="btn btn-secondary hidden md:inline-flex">Exportar a Excel</button>
                </div>
            </div>

            <div className="bg-white p-6 rounded-2xl shadow-lg mb-6">
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 items-end">
                <div className="flex items-center gap-2 md:col-span-2 lg:col-span-1">
                  <div>
                    <label htmlFor="date-from" className="block text-sm font-medium text-slate-700">Desde</label>
                    <input type="date" id="date-from" value={dateFrom} onChange={e => setDateFrom(e.target.value)} className="mt-1 form-input" />
                  </div>
                  <div>
                    <label htmlFor="date-to" className="block text-sm font-medium text-slate-700">Hasta</label>
                    <input type="date" id="date-to" value={dateTo} onChange={e => setDateTo(e.target.value)} className="mt-1 form-input" />
                  </div>
                </div>
                <div className="flex items-center gap-2 flex-wrap">
                  <button onClick={() => setDateRange('thisMonth')} className="btn btn-secondary text-xs">Mes en curso</button>
                  <button onClick={() => setDateRange('lastMonth')} className="btn btn-secondary text-xs">Mes anterior</button>
                  <button onClick={() => setDateRange('thisYear')} className="btn btn-secondary text-xs">Este Año</button>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-lg overflow-hidden">
                <div className="overflow-x-auto">
                    <table className="w-full text-sm text-left text-text-secondary">
                        <thead className="text-xs text-slate-700 uppercase bg-slate-50">
                            <tr>
                                <th scope="col" className="px-6 py-3">N° Pedido</th>
                                <th scope="col" className="px-6 py-3">Cliente</th>
                                <th scope="col" className="px-6 py-3">Estado</th>
                                <th scope="col" className="px-6 py-3">Fecha</th>
                                {canViewPrices && <th scope="col" className="px-6 py-3 text-right">Valor Total</th>}
                            </tr>
                        </thead>
                        <tbody>
                            {filteredPedidos.map((pedido: Pedido) => (
                                <tr key={pedido.id} className="bg-white border-b hover:bg-slate-50 cursor-pointer" onClick={() => handleOpenModal(pedido.id)}>
                                    <td className="px-6 py-4 font-medium text-primary">
                                        {pedido.numero_pedido}
                                    </td>
                                    <td className="px-6 py-4">{pedido.contactos?.nombre || 'N/A'}</td>
                                    <td className="px-6 py-4">
                                        <span className="px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800">
                                            {pedido.estados_pedido?.nombre || 'N/A'}
                                        </span>
                                    </td>
                                    <td className="px-6 py-4">
                                        {new Date(pedido.created_at).toLocaleDateString('es-AR')}
                                    </td>
                                    {canViewPrices && (
                                        <td className="px-6 py-4 text-right font-semibold">
                                            {new Intl.NumberFormat('es-AR', { style: 'currency', currency: 'ARS' }).format(pedido.valor)}
                                        </td>
                                    )}
                                </tr>
                            ))}
                             {filteredPedidos.length === 0 && (
                                <tr>
                                    <td colSpan={canViewPrices ? 5 : 4} className="text-center p-8 text-text-secondary">
                                        No se encontraron pedidos para los filtros aplicados.
                                    </td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                </div>
            </div>

            {modalState.pedido.isOpen && (
                <PedidoModal
                    isOpen={modalState.pedido.isOpen}
                    onClose={handleCloseModal}
                    pedidoId={modalState.pedido.pedidoId}
                    opportunityData={modalState.pedido.opportunityData}
                    contactData={modalState.pedido.contactData}
                    isReadOnly={modalState.pedido.isReadOnly ?? false}
                />
            )}
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default PedidosPage;
