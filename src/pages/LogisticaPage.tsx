// src/pages/LogisticaPage.tsx
import { useEffect, useState, useMemo } from 'react';
// Fix: Import React to be in scope for JSX transformation and for React.Fragment.
import React from 'react';
import { DragDropContext, Droppable, Draggable, DropResult } from '@hello-pangea/dnd';
import { useLogisticaStore } from '../stores/useLogisticaStore';
import PedidoCard from '../components/logistica/PedidoCard';
import { PedidoLogistica, Pedido } from '../types';
import PedidoModal from '../components/pedidos/PedidoModal';
import { exportToCSV } from '../utils/fileExport';
import ActionModal from '../components/common/ActionModal';
import { useActionModal } from '../utils/useActionModal';
// Fix: Import 'ZonasEnvioMapTab' from the correct module to resolve the "is not a module" error.
import ZonasEnvioMapTab from '../components/logistica/ZonasEnvioMapTab';
import { can } from '../utils/permissions';

const LogisticaPage = () => {
    const { 
        columns, 
        pedidos, 
        isLoading, 
        fetchPedidos, 
        movePedido,
        updatePedidoProvider,
        updatePedidoTracking 
    } = useLogisticaStore();
    const { modalProps, showMessage } = useActionModal();
    
    const [filters, setFilters] = useState({ searchTerm: '', paymentStatus: '' });
    
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [viewingPedido, setViewingPedido] = useState<Pedido | null>(null);
    const [showDelivered, setShowDelivered] = useState(true);
    const [activeTab, setActiveTab] = useState('tablero');

    useEffect(() => {
        const savedPreference = localStorage.getItem('logisticaShowDelivered');
        setShowDelivered(savedPreference !== 'false');
        fetchPedidos();
    }, [fetchPedidos]);

    const toggleDeliveredVisibility = () => {
        const newValue = !showDelivered;
        setShowDelivered(newValue);
        localStorage.setItem('logisticaShowDelivered', String(newValue));
    };

    const onDragEnd = (result: DropResult) => {
        const { source, destination, draggableId } = result;
        if (!destination) return;
        if (source.droppableId === destination.droppableId && source.index === destination.index) return;
        
        movePedido(
            draggableId, 
            source.droppableId, 
            destination.droppableId,
            source.index,
            destination.index
        );
    };
    
    const handleCardClick = (pedido: Pedido) => {
      setViewingPedido(pedido);
      setIsModalOpen(true);
    };
    
    const filteredPedidos = useMemo(() => {
        return Object.values(pedidos).filter((p: PedidoLogistica) => {
            const searchMatch = filters.searchTerm === '' ||
                p.numero_pedido.toLowerCase().includes(filters.searchTerm.toLowerCase()) ||
                p.contactos.nombre.toLowerCase().includes(filters.searchTerm.toLowerCase());

            const paymentMatch = filters.paymentStatus === '' ||
                (filters.paymentStatus === 'pagado' && p.pagado && p.condicion_pago_dias === 0) ||
                (filters.paymentStatus === 'pendiente' && !p.pagado && p.condicion_pago_dias === 0);

            return searchMatch && paymentMatch;
        }).map((p: PedidoLogistica) => p.id);
    }, [pedidos, filters]);

    const handleExportDelivered = () => {
        const deliveredPedidos = columns.entregado.pedidoIds
            .map(id => pedidos[id])
            .filter(Boolean) as PedidoLogistica[];

        if (deliveredPedidos.length === 0) {
            showMessage('Sin datos', 'No hay pedidos entregados para exportar.');
            return;
        }

        const headers = ["N° Pedido", "Cliente", "Destino", "Fecha Entrega", "Valor", "Costo Envío"];
        const rows = deliveredPedidos.map(p => [
            p.numero_pedido,
            p.contactos?.nombre,
            p.destino,
            p.fecha_entrega_prevista ? new Date(p.fecha_entrega_prevista).toLocaleDateString() : 'N/A',
            p.valor,
            p.costo_envio ?? 0
        ]);
        exportToCSV(headers, rows, `pedidos_entregados_${new Date().toISOString().split('T')[0]}.csv`);
    };

    const columnsToRender = useMemo(() => {
        if (showDelivered) return columns;
        const { entregado, ...visibleCols } = columns;
        return visibleCols;
    }, [columns, showDelivered]);

    const gridClass = useMemo(() => {
        const count = Object.keys(columnsToRender).length;
        if (count === 4) return "lg:grid-cols-4";
        if (count === 3) return "lg:grid-cols-3";
        return `lg:grid-cols-${count}`;
    }, [columnsToRender]);

    const TABS = [
      { id: 'tablero', label: 'Tablero Kanban' },
      { id: 'zonas', label: 'Zonas de Envío', permission: 'configuracion:editar:empresa' }
    ];

    return (
        <>
        <div className="flex flex-col h-full">
            <h1 className="text-3xl font-bold text-text-main mb-4">Centro de Logística</h1>
            
             <div className="mb-6">
                <div className="bg-gray-100 p-1.5 rounded-lg flex flex-wrap gap-2">
                    {TABS.map(tab => {
                        if (tab.permission && !can(tab.permission)) return null;
                        return (
                          <button 
                              key={tab.id}
                              onClick={() => setActiveTab(tab.id)} 
                              className={`flex-1 py-2 px-4 text-sm font-semibold rounded-md transition-colors duration-200 ${
                                  activeTab === tab.id 
                                  ? 'bg-white shadow text-primary' 
                                  : 'text-gray-600 hover:bg-gray-200'
                              }`}
                          >
                              {tab.label}
                          </button>
                        );
                    })}
                </div>
            </div>

            {activeTab === 'tablero' && (
              <>
                <div className="flex justify-between items-center mb-6">
                    <div className="flex items-center gap-2">
                        <button onClick={toggleDeliveredVisibility} className="btn btn-secondary">
                            {showDelivered ? 'Ocultar Entregados' : 'Mostrar Entregados'}
                        </button>
                        <button onClick={handleExportDelivered} className="btn btn-secondary">
                            Exportar Entregados
                        </button>
                    </div>
                </div>

                 <div className="bg-white p-6 rounded-2xl shadow-lg mb-6 flex flex-wrap gap-4 items-end">
                    <div>
                        <label htmlFor="search" className="block text-sm font-medium text-slate-700">Buscar Pedido o Cliente</label>
                        <input 
                            type="text" 
                            id="search" 
                            placeholder="Escriba para buscar..." 
                            className="mt-1 form-input" 
                            value={filters.searchTerm}
                            onChange={(e) => setFilters(f => ({...f, searchTerm: e.target.value}))}
                        />
                    </div>
                     <div>
                        <label htmlFor="paymentStatus" className="block text-sm font-medium text-slate-700">Estado de Pago (Contado)</label>
                        <select 
                            id="paymentStatus" 
                            className="mt-1 form-input"
                            value={filters.paymentStatus}
                            onChange={(e) => setFilters(f => ({...f, paymentStatus: e.target.value}))}
                        >
                            <option value="">Todos</option>
                            <option value="pagado">Pagado</option>
                            <option value="pendiente">Pago Pendiente</option>
                        </select>
                    </div>
                </div>

                {isLoading ? <div className="text-center p-8">Cargando tablero...</div> : (
                    // Fix: Wrap DragDropContext's children in a fragment to resolve the missing 'children' prop error.
                    <DragDropContext onDragEnd={onDragEnd}>
                        <>
                        <div className={`flex-grow grid grid-cols-1 md:grid-cols-2 ${gridClass} gap-5 overflow-x-auto pb-4`}>
                            {Object.entries(columnsToRender).map(([columnId, column]: [string, { title: string; pedidoIds: number[] }]) => (
                                <Droppable key={columnId} droppableId={columnId}>
                                    {(provided, snapshot) => (
                                        <div
                                            ref={provided.innerRef}
                                            {...provided.droppableProps}
                                            className={`bg-slate-100 rounded-xl p-4 flex flex-col ${snapshot.isDraggingOver ? 'bg-primary/10' : ''}`}
                                        >
                                            <h2 className="font-bold text-slate-700 mb-4">{column.title} <span className="text-sm bg-slate-200 text-slate-600 rounded-full px-2 py-0.5">{column.pedidoIds.filter(id => filteredPedidos.includes(id)).length}</span></h2>
                                            <div className="flex-grow min-h-[200px] space-y-3 overflow-y-auto">
                                                {column.pedidoIds
                                                    .filter(id => filteredPedidos.includes(id))
                                                    .map((pedidoId, index) => {
                                                        const pedido = pedidos[pedidoId];
                                                        if (!pedido) return null;
                                                        
                                                        return (
                                                            // Fix: Wrap Draggable in a React.Fragment and move the key to it to resolve the invalid 'key' prop error.
                                                            <React.Fragment key={pedido.id}>
                                                            <Draggable draggableId={String(pedido.id)} index={index}>
                                                                {(provided, snapshot) => (
                                                                    <div
                                                                        ref={provided.innerRef}
                                                                        {...provided.draggableProps}
                                                                        {...provided.dragHandleProps}
                                                                        className={`rounded-lg shadow-sm ${snapshot.isDragging ? 'shadow-lg' : ''} cursor-pointer`}
                                                                        onClick={() => handleCardClick(pedido as Pedido)}
                                                                    >
                                                                        <PedidoCard 
                                                                            pedido={pedido as PedidoLogistica} 
                                                                            onProviderChange={updatePedidoProvider}
                                                                            onTrackingChange={updatePedidoTracking}
                                                                        />
                                                                    </div>
                                                                )}
                                                            </Draggable>
                                                            </React.Fragment>
                                                        )
                                                    })}
                                                {provided.placeholder}
                                            </div>
                                        </div>
                                    )}
                                </Droppable>
                            ))}
                        </div>
                        </>
                    </DragDropContext>
                )}
              </>
            )}

            {activeTab === 'zonas' && <ZonasEnvioMapTab />}

            {isModalOpen && (
                <PedidoModal
                    isOpen={isModalOpen}
                    onClose={() => setIsModalOpen(false)}
                    pedidoId={viewingPedido?.id || null}
                    opportunityData={null}
                    contactData={null}
                    isReadOnly={false}
                />
            )}
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default LogisticaPage;