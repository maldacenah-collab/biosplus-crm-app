// src/pages/OpportunitiesPage.tsx
import React, { useEffect, useState, useMemo } from 'react';
import { useOpportunityStore } from '../stores/useOpportunityStore';
import { useSharedStore } from '../stores/useSharedStore';
import SalespersonAvatar from '../components/contacts/SalespersonAvatar';
import OpportunityModal from '../components/opportunities/OpportunityModal';
import { Opportunity } from '../types';
import { buildWhatsAppUrl } from '../utils/formatters';
import ActionModal from '../components/common/ActionModal';
import { useActionModal } from '../utils/useActionModal';
import { useParams, useNavigate } from 'react-router-dom';

// Componente para el ícono de WhatsApp
const WhatsAppIcon = () => (
    <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
        <path d="M.057 24l1.687-6.163c-1.041-1.804-1.588-3.849-1.587-5.946.003-6.556 5.338-11.891 11.893-11.891 3.181.001 6.167 1.24 8.413 3.488 2.245 2.248 3.487 5.235 3.487 8.413 0 6.557-5.338 11.892-11.894 11.892-1.99 0-3.903-.52-5.58-1.452L.057 24z" />
    </svg>
);

// Componente auxiliar para los iconos de ordenamiento
const SortIcon = ({ direction }: { direction?: 'ascending' | 'descending' }) => {
  if (!direction) return <span className="text-gray-400">↕</span>;
  return <span className="ml-1">{direction === 'ascending' ? '▲' : '▼'}</span>;
};

const OpportunitiesPage = () => {
  const { opportunities, isLoading, error, fetchOpportunities } = useOpportunityStore();
  const { salespeople, salesStages, fetchSharedData, modalState, openModal, closeModal } = useSharedStore();
  const params = useParams();
  const navigate = useNavigate();
  const { modalProps, showMessage } = useActionModal();

  const [searchTerm, setSearchTerm] = useState('');
  const [filters, setFilters] = useState({ salespersonId: '', stageId: '' });
  const [sortConfig, setSortConfig] = useState<{ key: keyof Opportunity; direction: 'ascending' | 'descending' }>({ key: 'created_at', direction: 'descending' });
  
  useEffect(() => {
    fetchOpportunities();
    fetchSharedData();
  }, [fetchOpportunities, fetchSharedData]);

  // Efecto para controlar el modal basado en la URL
  useEffect(() => {
    const { action, opportunityId } = params;
    const isModalOpenInStore = modalState.opportunity.isOpen;

    if (action === 'new' || action === 'edit') {
      const currentIdInStore = modalState.opportunity.opportunityId;
      const newId = opportunityId ? Number(opportunityId) : null;
      
      if (!isModalOpenInStore || currentIdInStore !== newId) {
        openModal('opportunity', { opportunityId: newId });
      }
    } else {
      if (isModalOpenInStore) {
        closeModal('opportunity');
      }
    }
  }, [params, modalState.opportunity.isOpen, modalState.opportunity.opportunityId, openModal, closeModal]);


  const handleFilterChange = (e: React.ChangeEvent<HTMLSelectElement | HTMLInputElement>) => {
    const { name, value } = e.target;
    setFilters(prev => ({ ...prev, [name]: value }));
  };
  
  const handleSort = (key: keyof Opportunity) => {
    setSortConfig(prev => ({
      key,
      direction: prev.key === key && prev.direction === 'ascending' ? 'descending' : 'ascending'
    }));
  };

  const handleCreateClick = () => {
    navigate('/oportunidades/new');
  };
  
  const handleEditClick = (id: number) => {
    navigate(`/oportunidades/edit/${id}`);
  };
  
  const handleCloseModal = () => {
    navigate('/oportunidades');
  };

  const simplifiedStages = useMemo(() => {
    const desiredStages = ['Presupuesto', 'Ganada', 'Perdida', 'Propuesta Enviada'];
    return salesStages.filter(s => desiredStages.includes(s.nombre));
  }, [salesStages]);

  const filteredAndSortedOpportunities = useMemo(() => {
    let filtered = opportunities.filter(op => {
      const salespersonMatch = !filters.salespersonId || op.vendedor_id === parseInt(filters.salespersonId, 10);
      const stageMatch = !filters.stageId || op.etapa_id === parseInt(filters.stageId, 10);
      
      const searchMatch = !searchTerm ||
        op.nombre.toLowerCase().includes(searchTerm.toLowerCase()) ||
        (op.contactos?.nombre || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
        String(op.numero_propuesta).includes(searchTerm);

      return salespersonMatch && stageMatch && searchMatch;
    });

    filtered.sort((a, b) => {
        const valA = a[sortConfig.key];
        const valB = b[sortConfig.key];
        if (valA === null || valA === undefined) return 1;
        if (valB === null || valB === undefined) return -1;
        
        let aValue = valA;
        let bValue = valB;

        if (sortConfig.key === 'created_at') {
            aValue = new Date(valA as string).getTime();
            bValue = new Date(valB as string).getTime();
        } else if (typeof valA === 'string') {
            aValue = valA.toLowerCase();
            bValue = (valB as string).toLowerCase();
        }

        if (aValue < bValue) return sortConfig.direction === 'ascending' ? -1 : 1;
        if (aValue > bValue) return sortConfig.direction === 'ascending' ? 1 : -1;
        return 0;
    });

    return filtered;
  }, [opportunities, filters, searchTerm, sortConfig]);

  const getAntiguedad = (dateString: string) => {
    const today = new Date();
    const createdDate = new Date(dateString);
    const diffTime = Math.abs(today.getTime() - createdDate.getTime());
    const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24));

    if (diffDays === 0) return 'Hoy';
    if (diffDays === 1) return 'Hace 1 día';
    return `Hace ${diffDays} días`;
  };

  const handleExport = () => {
    if (filteredAndSortedOpportunities.length === 0) {
      showMessage('Sin datos', 'No hay datos para exportar con los filtros actuales.');
      return;
    }

    const headers = ["N°", "Nombre", "Contacto", "Vendedor", "Valor", "Etapa", "Antigüedad"];
    const rows = filteredAndSortedOpportunities.map(op => [
      String(op.numero_propuesta || "").padStart(4, "0"),
      `"${op.nombre.replace(/"/g, '""')}"`,
      `"${op.contactos?.nombre?.replace(/"/g, '""') || 'N/A'}"`,
      `"${op.vendedores?.perfiles?.nombre?.replace(/"/g, '""') || 'N/A'}"`,
      op.valor,
      salesStages.find(s => s.id === op.etapa_id)?.nombre || 'N/A',
      getAntiguedad(op.created_at)
    ]);

    const csvContent = [headers.join(';'), ...rows.map(row => row.join(';'))].join('\n');
    const blob = new Blob(["\uFEFF" + csvContent], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement("a");
    const url = URL.createObjectURL(blob);
    link.setAttribute("href", url);
    link.setAttribute("download", `presupuestos_${new Date().toISOString().split('T')[0]}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  if (isLoading && opportunities.length === 0) {
    return <div className="text-center p-8">Cargando presupuestos...</div>;
  }

  if (error) {
    return <div className="text-center p-8 text-red-500">Error: {error}</div>;
  }

  return (
    <>
    <div>
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold">Presupuestos</h1>
        <div className="flex items-center gap-2">
            <button onClick={handleExport} className="btn btn-secondary hidden md:inline-flex">Exportar</button>
            <button onClick={handleCreateClick} className="btn btn-primary">Crear Presupuesto</button>
        </div>
      </div>
      
      <div className="bg-white p-6 rounded-2xl shadow-neumorphic mb-6 grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-4 items-end">
        <div className="lg:col-span-2">
            <label htmlFor="search" className="block text-sm font-medium text-slate-700">Buscar...</label>
            <input type="text" id="search" placeholder="Nombre, Contacto, N° Propuesta..." className="mt-1 form-input w-full" value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} />
        </div>
        <div>
            <label htmlFor="salespersonId" className="block text-sm font-medium text-slate-700">Vendedor</label>
            <select name="salespersonId" id="salespersonId" className="mt-1 form-input w-full" value={filters.salespersonId} onChange={handleFilterChange}>
                <option value="">Todos</option>
                {salespeople.map(s => <option key={s.id} value={s.id}>{s.perfiles.nombre}</option>)}
            </select>
        </div>
        <div>
            <label htmlFor="stageId" className="block text-sm font-medium text-slate-700">Etapa</label>
            <select name="stageId" id="stageId" className="mt-1 form-input w-full" value={filters.stageId} onChange={handleFilterChange}>
                <option value="">Todas</option>
                {simplifiedStages.map(s => <option key={s.id} value={s.id}>{s.nombre}</option>)}
            </select>
        </div>
      </div>
      
      <div className="bg-white rounded-2xl shadow-neumorphic overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-sm text-left text-text-secondary">
            <thead className="text-xs text-slate-700 uppercase bg-slate-50">
              <tr>
                <th scope="col" className="px-6 py-3 hidden md:table-cell">N°</th>
                <th scope="col" className="px-6 py-3">Nombre</th>
                <th scope="col" className="px-6 py-3">Contacto</th>
                <th scope="col" className="px-6 py-3 text-center hidden md:table-cell">Vendedor</th>
                <th scope="col" className="px-6 py-3 text-right">Valor</th>
                <th scope="col" className="px-6 py-3 cursor-pointer hidden md:table-cell" onClick={() => handleSort('created_at')}>
                  Antigüedad <SortIcon direction={sortConfig.key === 'created_at' ? sortConfig.direction : undefined} />
                </th>
                <th scope="col" className="px-6 py-3">Etapa</th>
                <th scope="col" className="px-6 py-3 text-center">Acciones</th>
              </tr>
            </thead>
            <tbody>
              {filteredAndSortedOpportunities.map(op => {
                const message = `Hola ${op.contactos?.nombre}, ¿cómo estás? Te escribo para saber si pudiste revisar la propuesta que te enviamos por el presupuesto "${op.nombre}". Quedamos a tu disposición por cualquier consulta.`;
                const whatsappUrl = op.contactos?.telefono 
                    ? buildWhatsAppUrl(op.contactos.telefono, message)
                    : '#';
                
                const stageName = salesStages.find(s => s.id === op.etapa_id)?.nombre || 'N/A';

                return (
                    <tr key={op.id} className="bg-white border-b hover:bg-slate-100 cursor-pointer" onClick={() => handleEditClick(op.id)}>
                    <td className="px-6 py-4 font-semibold text-slate-600 hidden md:table-cell">{String(op.numero_propuesta || "").padStart(4, "0")}</td>
                    <td className="px-6 py-4 font-medium text-primary">{op.nombre}</td>
                    <td className="px-6 py-4">{op.contactos?.nombre || 'N/A'}</td>
                    <td className="px-6 py-4 hidden md:table-cell"><div className="flex justify-center"><SalespersonAvatar salesperson={op.vendedores} /></div></td>
                    <td className="px-6 py-4 text-right font-semibold">{new Intl.NumberFormat('es-AR', { style: 'currency', currency: 'ARS' }).format(op.valor)}</td>
                    <td className="px-6 py-4 hidden md:table-cell">{getAntiguedad(op.created_at)}</td>
                    <td className="px-6 py-4">
                        <span 
                            className={`px-2 py-1 text-xs font-semibold rounded-full ${
                                stageName === 'Ganada' ? 'bg-primary/10 text-primary' :
                                stageName === 'Perdida' ? 'bg-red-100 text-red-800' :
                                'bg-blue-100 text-blue-800'
                            }`}
                        >
                        {stageName}
                        </span>
                    </td>
                    <td className="px-6 py-4 text-center">
                        {op.contactos?.telefono && (
                            <a 
                                href={whatsappUrl}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="inline-flex items-center justify-center p-2 rounded-full text-slate-400 hover:text-accent hover:bg-accent/10 transition-colors"
                                aria-label="Seguimiento por WhatsApp"
                                title="Seguimiento por WhatsApp"
                                onClick={(e) => e.stopPropagation()}
                            >
                                <WhatsAppIcon />
                            </a>
                        )}
                    </td>
                    </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </div>

      {modalState.opportunity.isOpen && (
        <OpportunityModal
          isOpen={modalState.opportunity.isOpen}
          onClose={handleCloseModal}
          opportunityId={modalState.opportunity.opportunityId}
          contactData={modalState.opportunity.contactData}
          isReadOnly={modalState.opportunity.isReadOnly}
        />
      )}
    </div>
    <ActionModal {...modalProps} />
    </>
  );
};

export default OpportunitiesPage;
