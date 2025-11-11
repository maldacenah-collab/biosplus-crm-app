// src/pages/Cliente360Page.tsx
import { useEffect, useState, useMemo } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useCliente360Store } from '../stores/useCliente360Store';
import { useSharedStore } from '../stores/useSharedStore';
import { formatCurrency } from '../utils/formatters';
import { TimelineEvent, Pedido, Opportunity, MovimientoCtaCorrienteCliente, Contact } from '../types';

import OpportunityModal from '../components/opportunities/OpportunityModal';
import PedidoModal from '../components/pedidos/PedidoModal';
import Avatar from '../components/common/Avatar';
import InteractionModal from '../components/cliente360/InteractionModal';

// Helper component for KPI cards
const KpiCard = ({ title, value, subtext }: { title: string; value: string; subtext?: string }) => (
  <div className="bg-white p-4 rounded-lg shadow-sm border border-gray-200">
    <p className="text-sm text-gray-500">{title}</p>
    <p className="text-2xl font-bold text-gray-800 mt-1">{value}</p>
    {subtext && <p className="text-xs text-gray-500 mt-1">{subtext}</p>}
  </div>
);

// Helper function to get an icon for a timeline event
const getEventTypeIcon = (eventType: string) => {
    switch (eventType) {
        case 'Oportunidad': return '💡';
        case 'Pedido': return '📦';
        case 'Pago': return '💰';
        case 'Deuda': return '🧾';
        case 'Llamada': return '📞';
        case 'WhatsApp': return '💬';
        case 'Reunión': return '👥';
        case 'Anulación': return '❌';
        default: return '🔔';
    }
};

const Cliente360Page = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const { 
    details: contact, kpis, timeline, pedidos, oportunidades, cuenta_corriente,
    isLoading, error, fetchData, addInteraction
  } = useCliente360Store();
  
  const [activeTab, setActiveTab] = useState('resumen');
  const [modalState, setModalState] = useState({
    opportunity: false,
    pedido: false,
    interaction: false,
  });
  const [viewingEntity, setViewingEntity] = useState<{ id: number | null, readOnly: boolean }>({ id: null, readOnly: false });
  const [activeTimelineFilter, setActiveTimelineFilter] = useState<string | null>(null);

  useEffect(() => {
    if (id) {
      fetchData(Number(id));
    }
  }, [id, fetchData]);
  
  const filteredTimeline = useMemo(() => {
    if (!activeTimelineFilter) return timeline;
    return timeline.filter(event => event.event_type === activeTimelineFilter);
  }, [timeline, activeTimelineFilter]);

  const handleTimelineClick = (event: TimelineEvent) => {
    if (!event.entity_id) return;
    if (event.event_type === 'Pedido' || event.event_type === 'Anulación') {
        setViewingEntity({ id: event.entity_id, readOnly: true });
        setModalState(prev => ({ ...prev, pedido: true }));
    }
    if (event.event_type === 'Oportunidad') {
        setViewingEntity({ id: event.entity_id, readOnly: true });
        setModalState(prev => ({ ...prev, opportunity: true }));
    }
  };

  const handleCreateOpportunity = () => {
    setViewingEntity({ id: null, readOnly: false });
    setModalState(prev => ({...prev, opportunity: true}));
  }

  const handleCreatePedido = () => {
    setViewingEntity({ id: null, readOnly: false });
    setModalState(prev => ({...prev, pedido: true}));
  }

  if (isLoading) {
    return <div className="text-center p-8">Cargando vista 360° del cliente...</div>;
  }

  if (error) {
    return <div className="text-center p-8 text-red-500">Error: {error}</div>;
  }
  
  if (!contact) {
    return <div className="text-center p-8">No se encontró el cliente.</div>;
  }

  const tabs = [
    { id: 'resumen', label: 'Resumen y Actividad' },
    { id: 'analisis', label: 'Análisis de Compra' },
    { id: 'cuenta', label: 'Cta. Corriente' },
    { id: 'pedidos', label: 'Pedidos' },
    { id: 'datos', label: 'Datos del Contacto' },
  ];

  const timelineFilterButtons = ['Oportunidad', 'Pedido', 'Pago', 'Deuda', 'Llamada', 'WhatsApp', 'Reunión'];

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="bg-white p-4 rounded-lg shadow-md flex flex-col sm:flex-row justify-between items-center gap-4">
        <div className="flex items-center gap-4">
            <Avatar src={contact.foto_url} name={contact.nombre} size="lg" />
            <div>
                <h1 className="text-2xl font-bold text-gray-800">{contact.nombre}</h1>
                <p className="text-sm text-gray-500">
                    <span className="px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800 mr-2">{contact.clasificacion || 'Sin Clasificar'}</span>
                    CUIT/DNI: {contact.cuit || 'N/A'}
                </p>
            </div>
        </div>
        <div className="flex items-center gap-2 flex-wrap">
            <button onClick={handleCreateOpportunity} className="btn btn-secondary">Nuevo Presupuesto</button>
            <button onClick={handleCreatePedido} className="btn btn-secondary">Nuevo Pedido</button>
            <button onClick={() => setModalState(prev => ({...prev, interaction: true}))} className="btn btn-primary">Registrar Interacción</button>
            <button onClick={() => navigate('/contactos')} className="btn btn-secondary">← Volver</button>
        </div>
      </div>

      {/* KPIs */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <KpiCard title="Deuda Actual" value={formatCurrency(kpis.deuda_actual)} />
        <KpiCard title="Total Histórico Comprado" value={formatCurrency(kpis.total_historico_comprado)} />
        <KpiCard title="Última Compra" value={kpis.ultima_compra ? new Date(kpis.ultima_compra).toLocaleDateString('es-AR') : 'N/A'} />
        <KpiCard title="Presupuestos Abiertos" value={formatCurrency(kpis.presupuestos_abiertos_valor)} subtext={`${kpis.presupuestos_abiertos_cantidad} presupuestos`} />
      </div>

      {/* Tabs */}
       <div className="bg-white rounded-lg shadow-md">
        <div className="border-b border-gray-200">
          <nav className="-mb-px flex space-x-8 px-6 overflow-x-auto" aria-label="Tabs">
            {tabs.map(tab => (
              <button key={tab.id} onClick={() => setActiveTab(tab.id)}
                className={`${activeTab === tab.id ? 'border-primary text-primary' : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'} whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm transition-colors`}>
                {tab.label}
              </button>
            ))}
          </nav>
        </div>
        <div className="p-6">
            {activeTab === 'resumen' && (
                <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    {/* Left Column: Timeline */}
                    <div className="lg:col-span-2 pl-6">
                        <div className="mb-4"><h3 className="text-lg font-semibold text-gray-700 mb-3">Filtrar Eventos</h3><div className="flex flex-wrap gap-2"><button onClick={() => setActiveTimelineFilter(null)} className={`px-3 py-1.5 text-sm font-medium rounded-full transition-colors ${!activeTimelineFilter ? 'bg-primary text-white shadow' : 'bg-gray-100 text-gray-800 hover:bg-gray-200'}`}>Todos</button>{timelineFilterButtons.map(type => (<button key={type} onClick={() => setActiveTimelineFilter(type)} className={`px-3 py-1.5 text-sm font-medium rounded-full transition-colors flex items-center gap-2 ${activeTimelineFilter === type ? 'bg-primary text-white shadow' : 'bg-gray-100 text-gray-800 hover:bg-gray-200'}`}><span>{getEventTypeIcon(type)}</span><span>{type}</span></button>))}</div></div>
                        <ol className="relative border-l border-gray-200 max-h-[70vh] overflow-y-auto pr-4">
                            {filteredTimeline.map((event, index) => (
                                <li key={index} className="mb-4 ml-12 cursor-pointer hover:bg-gray-50 rounded-r-lg p-2" onClick={() => handleTimelineClick(event)}>
                                    <span className="absolute flex items-center justify-center w-8 h-8 bg-blue-100 rounded-full -left-4 ring-8 ring-white"><span title={event.event_type}>{getEventTypeIcon(event.event_type)}</span></span>
                                    <h3 className="flex items-center mb-1 font-semibold text-gray-900">{event.event_title}</h3>
                                    <time className="block mb-2 text-sm font-normal text-gray-400">{new Date(event.event_date).toLocaleString('es-AR')}</time>
                                    {event.descripcion && <p className="text-sm text-gray-600">{event.descripcion}</p>}
                                    {event.event_value != null && <p className="text-sm font-semibold text-primary">{formatCurrency(event.event_value)}</p>}
                                </li>
                            ))}
                             {filteredTimeline.length === 0 && <p className="text-center text-gray-500 py-8">No hay eventos para este filtro.</p>}
                        </ol>
                    </div>
                     {/* Right Column: Interactions Placeholder */}
                     <div className="lg:col-span-1">
                        <div className="bg-gray-50 p-6 rounded-lg border sticky top-6">
                            <h3 className="text-lg font-semibold text-gray-700">Interacciones Rápidas</h3>
                            <p className="text-sm text-gray-600 mt-2">
                                Registra llamadas, reuniones o mensajes de WhatsApp desde el botón "Registrar Interacción" en la cabecera.
                            </p>
                            <button onClick={() => setModalState(prev => ({...prev, interaction: true}))} className="btn btn-primary w-full mt-4">
                                Registrar Nueva Interacción
                            </button>
                        </div>
                    </div>
                </div>
            )}
            {activeTab === 'analisis' && (
                <p className="text-center text-gray-500 py-8">El módulo de Análisis de Compra por cliente estará disponible próximamente.</p>
            )}
            {activeTab === 'cuenta' && (
                 <table className="w-full text-sm">
                    <thead className="text-left bg-gray-50"><tr><th className="p-3">Fecha</th><th>Concepto</th><th className="text-right">Debe</th><th className="text-right">Haber</th><th className="text-right">Saldo</th></tr></thead>
                    <tbody>
                        {cuenta_corriente.map((m) => (
                            <tr key={m.id} className="border-b">
                                <td className="p-3">{new Date(m.fecha).toLocaleDateString('es-AR')}</td><td>{m.concepto}</td>
                                <td className="text-right text-red-500">{formatCurrency(m.debe)}</td><td className="text-right text-green-600">{formatCurrency(m.haber)}</td>
                                <td className="text-right font-semibold">{formatCurrency(m.saldo)}</td>
                            </tr>
                        ))}
                         {cuenta_corriente.length === 0 && (<tr><td colSpan={5} className="text-center p-8 text-gray-500">No hay movimientos en la cuenta.</td></tr>)}
                    </tbody>
                </table>
            )}
            {activeTab === 'pedidos' && (
                 <table className="w-full text-sm">
                    <thead className="text-left bg-gray-50"><tr><th className="p-3">N° Pedido</th><th>Fecha</th><th>Estado</th><th className="text-right">Valor</th></tr></thead>
                    <tbody>
                        {pedidos.map((p) => (
                            <tr key={p.id} className="border-b hover:bg-gray-100 cursor-pointer" onClick={() => { setViewingEntity({ id: p.id, readOnly: true }); setModalState(prev => ({...prev, pedido: true})); }}>
                                <td className="p-3 font-medium text-primary">{p.numero_pedido}</td><td>{new Date(p.created_at).toLocaleDateString('es-AR')}</td>
                                <td><span className="px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800">{p.estados_pedido?.nombre}</span></td>
                                <td className="text-right font-semibold">{formatCurrency(p.valor)}</td>
                            </tr>
                        ))}
                        {pedidos.length === 0 && (<tr><td colSpan={4} className="text-center p-8 text-gray-500">No hay pedidos para este cliente.</td></tr>)}
                    </tbody>
                </table>
            )}
            {activeTab === 'datos' && (
                 <div className="space-y-4 text-sm max-w-2xl">
                     <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div><strong className="text-gray-600 block">Nombre Completo:</strong> {contact.nombre}</div>
                        <div><strong className="text-gray-600 block">Teléfono:</strong> {contact.telefono || 'N/A'}</div>
                        <div><strong className="text-gray-600 block">Email:</strong> {contact.email || 'N/A'}</div>
                     </div>
                     <div className="pt-4 border-t grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div><strong className="text-gray-600 block">Razón Social:</strong> {contact.razon_social || 'N/A'}</div>
                        <div><strong className="text-gray-600 block">CUIT:</strong> {contact.cuit || 'N/A'}</div>
                        <div><strong className="text-gray-600 block">Condición IVA:</strong> {contact.condicion_iva || 'N/A'}</div>
                        <div className="md:col-span-2"><strong className="text-gray-600 block">Domicilio Fiscal:</strong> {contact.domicilio_fiscal?.full_address || 'N/A'}</div>
                     </div>
                     <div className="pt-4 border-t grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div><strong className="text-gray-600 block">Dirección de Entrega Principal:</strong> {contact.direccion_entrega?.full_address || 'N/A'}</div>
                        <div><strong className="text-gray-600 block">Dirección Alternativa:</strong> {contact.direccion_entrega_2?.full_address || 'N/A'}</div>
                     </div>
                 </div>
            )}
        </div>
      </div>
      
       {/* Modals */}
       <OpportunityModal isOpen={modalState.opportunity} onClose={() => setModalState(prev => ({...prev, opportunity: false}))} opportunityId={viewingEntity.id} contactData={!viewingEntity.id ? contact : null} isReadOnly={viewingEntity.readOnly} />
       <PedidoModal isOpen={modalState.pedido} onClose={() => setModalState(prev => ({...prev, pedido: false}))} pedidoId={viewingEntity.id} opportunityData={null} contactData={!viewingEntity.id ? contact : null} isReadOnly={viewingEntity.readOnly} />
       <InteractionModal isOpen={modalState.interaction} onClose={() => setModalState(prev => ({...prev, interaction: false}))} contactId={contact.id} />
    </div>
  );
};

export default Cliente360Page;