// src/pages/ContactsPage.tsx
// Página principal para visualizar y gestionar la lista de contactos.

import React, { useEffect, useState, useMemo, useRef, useCallback } from 'react';
import { useContactStore } from '../stores/useContactStore';
import { useSharedStore } from '../stores/useSharedStore';
import { Contact } from '../types';
import SalespersonAvatar from '../components/contacts/SalespersonAvatar';
import ContactModal from '../components/contacts/ContactModal';
import { buildWhatsAppUrl } from '../utils/formatters';
import { useParams, useNavigate } from 'react-router-dom';

// Componente para el ícono de WhatsApp
const WhatsAppIcon = () => (
    <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
        <path d="M.057 24l1.687-6.163c-1.041-1.804-1.588-3.849-1.587-5.946.003-6.556 5.338-11.891 11.893-11.891 3.181.001 6.167 1.24 8.413 3.488 2.245 2.248 3.487 5.235 3.487 8.413 0 6.557-5.338 11.892-11.894 11.892-1.99 0-3.903-.52-5.58-1.452L.057 24z" />
    </svg>
);

// Componente para el ícono de Eliminar
const DeleteIcon = () => (
    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
    </svg>
);

// Componente para el ícono de Mapa
const MapIcon = () => (
    <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
      <path fillRule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 20l-4.95-6.05a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clipRule="evenodd" />
    </svg>
);


// Componente auxiliar para los iconos de ordenamiento
const SortIcon = ({ direction }: { direction?: 'ascending' | 'descending' }) => {
  if (!direction) return <span className="text-gray-400 md:inline hidden">↕</span>;
  return <span className="ml-1">{direction === 'ascending' ? '▲' : '▼'}</span>;
};

const CONTACTS_INITIAL_LOAD = 50;
const CONTACTS_PER_SCROLL = 30;

const ContactsPage = () => {
  const { contacts, isLoading, error, fetchContacts, removeContact } = useContactStore();
  const { salespeople, statuses, fetchSharedData, modalState, openModal, closeModal } = useSharedStore();
  const params = useParams();
  const navigate = useNavigate();

  const [searchTerm, setSearchTerm] = useState('');
  const [filters, setFilters] = useState({ salespersonId: '', zone: '', statusId: '' });
  const [sortConfig, setSortConfig] = useState<{ key: keyof Contact; direction: 'ascending' | 'descending' }>({ key: 'nombre', direction: 'ascending' });
  const [visibleCount, setVisibleCount] = useState(CONTACTS_INITIAL_LOAD);

  useEffect(() => {
    fetchContacts();
    fetchSharedData();
  }, [fetchContacts, fetchSharedData]);
  
  useEffect(() => {
    const { action, contactId } = params;
    const isModalOpenInStore = modalState.contact.isOpen;
    
    if (action === 'new' || action === 'edit') {
      const currentIdInStore = modalState.contact.contactId;
      const newId = contactId ? Number(contactId) : null;
      
      if (!isModalOpenInStore || currentIdInStore !== newId) {
        openModal('contact', { contactId: newId });
      }
    } else {
      if (isModalOpenInStore) {
        closeModal('contact');
      }
    }
  }, [params, modalState.contact, openModal, closeModal]);


  useEffect(() => {
    setVisibleCount(CONTACTS_INITIAL_LOAD);
  }, [searchTerm, filters, sortConfig]);

  const handleFilterChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFilters(prev => ({ ...prev, [name]: value }));
  };
  
  const handleSort = (key: keyof Contact) => {
    setSortConfig(prev => ({
      key,
      direction: prev.key === key && prev.direction === 'ascending' ? 'descending' : 'ascending'
    }));
  };
  
  const handleEditClick = (contactId: number) => {
    navigate(`/contactos/edit/${contactId}`);
  };
  
  const handleCreateClick = () => {
    navigate('/contactos/new');
  };
  
  const handleCloseModal = () => {
    navigate('/contactos');
  };

  const handleDeleteClick = (e: React.MouseEvent, contactId: number, contactName: string) => {
    e.stopPropagation(); 
    if (window.confirm(`¿Estás seguro de que quieres eliminar a ${contactName}?`)) {
      removeContact(contactId);
    }
  };

  const sortedAndFilteredContacts = useMemo(() => {
    const lowerSearchTerm = searchTerm.toLowerCase();

    const filtered = contacts.filter(contact => {
        const searchMatch = !searchTerm ||
            contact.nombre.toLowerCase().includes(lowerSearchTerm) ||
            contact.telefono?.includes(searchTerm);

        const salespersonMatch = !filters.salespersonId ||
            contact.vendedor_id === parseInt(filters.salespersonId, 10);

        const zoneMatch = !filters.zone ||
            (contact.zona && contact.zona.toLowerCase().includes(filters.zone.toLowerCase()));

        const statusMatch = !filters.statusId ||
            contact.estado_id === parseInt(filters.statusId, 10);

        return searchMatch && salespersonMatch && zoneMatch && statusMatch;
    });

    filtered.sort((a, b) => {
        const valA = a[sortConfig.key];
        const valB = b[sortConfig.key];
        if (valA === null || valA === undefined) return 1;
        if (valB === null || valB === undefined) return -1;
        
        const aValue = typeof valA === 'string' ? valA.toLowerCase() : valA;
        const bValue = typeof valB === 'string' ? valB.toLowerCase() : valB;

        if (aValue < bValue) return sortConfig.direction === 'ascending' ? -1 : 1;
        if (aValue > bValue) return sortConfig.direction === 'ascending' ? 1 : -1;
        return 0;
    });

    return filtered;
  }, [contacts, searchTerm, filters, sortConfig]);

  const observer = useRef<IntersectionObserver | null>(null);
  const lastContactElementRef = useCallback((node: any) => {
    if (isLoading) return;
    if (observer.current) observer.current.disconnect();
    observer.current = new IntersectionObserver(entries => {
        if (entries[0].isIntersecting && visibleCount < sortedAndFilteredContacts.length) {
            setVisibleCount(prev => prev + CONTACTS_PER_SCROLL);
        }
    });
    if (node) observer.current.observe(node);
  }, [isLoading, visibleCount, sortedAndFilteredContacts.length]);


  const handleExport = () => {
    const headers = ["Nombre", "Teléfono", "Email", "Vendedor", "Estado", "Zona", "Clasificación"];
    const rows = sortedAndFilteredContacts.map(contact => [
        `"${contact.nombre.replace(/"/g, '""')}"`,
        contact.telefono || '',
        contact.email || '',
        `"${contact.vendedores?.perfiles?.nombre.replace(/"/g, '""') || 'Sin Asignar'}"`,
        contact.estados?.nombre || 'N/A',
        contact.zona || '',
        contact.clasificacion || '',
    ]);

    const csvContent = [headers.join(';'), ...rows.map(row => row.join(';'))].join('\n');
    const blob = new Blob(["\uFEFF" + csvContent], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement("a");
    const url = URL.createObjectURL(blob);
    link.setAttribute("href", url);
    link.setAttribute("download", `contactos_${new Date().toISOString().split('T')[0]}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };
  
  const editingContact = useMemo(() => {
    if (!modalState.contact.isOpen || modalState.contact.contactId === null) return null;
    return contacts.find(c => c.id === modalState.contact.contactId) || null;
  }, [modalState.contact.isOpen, modalState.contact.contactId, contacts]);


  if (isLoading && contacts.length === 0) {
    return <div className="text-center p-8">Cargando contactos...</div>;
  }
  if (error) {
    return <div className="text-center p-8 text-red-500">Error: {error}</div>;
  }

  return (
    <div>
      <h1 className="text-3xl font-bold mb-6">Contactos</h1>
      
      <div className="bg-white p-6 rounded-2xl shadow-neumorphic mb-6 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-4 items-end">
          <div className="lg:col-span-2">
              <label htmlFor="search" className="block text-sm font-medium text-slate-700">Buscar por Nombre o Teléfono</label>
              <input type="text" id="search" placeholder="Escriba para buscar..." className="mt-1 form-input w-full" value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} />
          </div>
          <div>
              <label htmlFor="salespersonId" className="block text-sm font-medium text-slate-700">Vendedor</label>
              <select name="salespersonId" id="salespersonId" className="mt-1 form-input w-full" value={filters.salespersonId} onChange={handleFilterChange}>
                  <option value="">Todos</option>
                  {salespeople.map(s => <option key={s.id} value={s.id}>{s.perfiles.nombre}</option>)}
              </select>
          </div>
          <div>
              <label htmlFor="statusId" className="block text-sm font-medium text-slate-700">Estado</label>
              <select name="statusId" id="statusId" className="mt-1 form-input w-full" value={filters.statusId} onChange={handleFilterChange}>
                  <option value="">Todos</option>
                  {statuses.map(s => <option key={s.id} value={s.id}>{s.nombre}</option>)}
              </select>
          </div>
          <div>
              <label htmlFor="zone" className="block text-sm font-medium text-slate-700">Zona</label>
              <input type="text" name="zone" id="zone" className="mt-1 form-input w-full" placeholder="Ej: CABA" value={filters.zone} onChange={handleFilterChange} />
          </div>
      </div>
      
      <div className="flex justify-end items-center mb-6 gap-4">
          <button onClick={handleExport} className="btn btn-secondary hidden md:inline-flex">Exportar a Excel</button>
          <button onClick={handleCreateClick} className="btn btn-primary">Crear Contacto</button>
      </div>

      <div className="bg-white rounded-2xl shadow-neumorphic overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-sm text-left text-text-secondary">
            <thead className="text-xs text-slate-700 uppercase bg-slate-50">
              <tr>
                <th scope="col" className="px-6 py-3 cursor-pointer" onClick={() => handleSort('nombre')}>
                  Nombre <SortIcon direction={sortConfig.key === 'nombre' ? sortConfig.direction : undefined} />
                </th>
                <th scope="col" className="px-6 py-3 hidden md:table-cell">Teléfono</th>
                <th scope="col" className="px-6 py-3 hidden md:table-cell">Vendedor</th>
                <th scope="col" className="px-6 py-3 cursor-pointer hidden md:table-cell" onClick={() => handleSort('zona')}>
                  Zona <SortIcon direction={sortConfig.key === 'zona' ? sortConfig.direction : undefined} />
                </th>
                <th scope="col" className="px-6 py-3">Estado</th>
                <th scope="col" className="px-6 py-3 text-right">Acciones</th>
              </tr>
            </thead>
            <tbody>
              {sortedAndFilteredContacts.slice(0, visibleCount).map((contact, index) => {
                const isLastElement = index === visibleCount - 1;
                return (
                    <tr 
                        ref={isLastElement ? lastContactElementRef : null} 
                        key={contact.id} 
                        className="border-b border-slate-200 hover:bg-slate-50 cursor-pointer"
                        onClick={() => handleEditClick(contact.id)}
                    >
                        <td className="px-6 py-4 font-medium text-primary whitespace-nowrap">
                            <div className="flex items-center gap-2">
                                <span>{contact.nombre}</span>
                                {contact.direccion_entrega?.full_address && (
                                    <a
                                        href={`https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(contact.direccion_entrega.full_address)}`}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        onClick={(e) => e.stopPropagation()}
                                        className="text-slate-400 hover:text-primary transition-colors"
                                        title="Ver en mapa"
                                    >
                                        <MapIcon />
                                    </a>
                                )}
                            </div>
                        </td>
                        <td className="px-6 py-4 hidden md:table-cell">{contact.telefono || 'N/A'}</td>
                        <td className="px-6 py-4 hidden md:table-cell"><div className="flex justify-center"><SalespersonAvatar salesperson={contact.vendedores} /></div></td>
                        <td className="px-6 py-4 hidden md:table-cell">{contact.zona || 'N/A'}</td>
                        <td className="px-6 py-4">
                            <span className={`px-2 py-1 text-xs font-semibold rounded-full ${
                                contact.estados?.nombre.toLowerCase() === 'inactivo' ? 'bg-red-100 text-red-800' : 'bg-primary/10 text-primary'
                            }`}>
                                {contact.estados?.nombre || 'N/A'}
                            </span>
                        </td>
                        <td className="px-6 py-4">
                            <div className="flex items-center justify-end space-x-1">
                                {contact.telefono && (
                                    <a 
                                        href={buildWhatsAppUrl(contact.telefono)}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        className="inline-flex items-center justify-center p-2 rounded-full text-slate-400 hover:text-accent hover:bg-accent/10 transition-colors"
                                        aria-label="Enviar WhatsApp"
                                        onClick={(e) => e.stopPropagation()}
                                    >
                                        <WhatsAppIcon />
                                    </a>
                                )}
                                <button
                                    onClick={(e) => handleDeleteClick(e, contact.id, contact.nombre)}
                                    className="inline-flex items-center justify-center p-2 rounded-full text-slate-400 hover:text-red-500 hover:bg-red-100 transition-colors"
                                    aria-label="Eliminar Contacto"
                                >
                                    <DeleteIcon />
                                </button>
                                <button className="font-medium text-primary hover:underline hidden md:inline" onClick={(e) => { e.stopPropagation(); handleEditClick(contact.id); }}>
                                    Editar
                                </button>
                            </div>
                        </td>
                    </tr>
                );
              })}
            </tbody>
          </table>
          {isLoading && contacts.length > 0 && (
            <div className="text-center p-4">Cargando más contactos...</div>
          )}
          {sortedAndFilteredContacts.length === 0 && !isLoading && (
            <p className="text-center p-8 text-text-secondary">No se encontraron contactos con los filtros actuales.</p>
          )}
        </div>
      </div>
      
      {modalState.contact.isOpen && (
          <ContactModal 
            isOpen={modalState.contact.isOpen}
            onClose={handleCloseModal}
            contact={editingContact}
          />
      )}
    </div>
  );
};

export default ContactsPage;
