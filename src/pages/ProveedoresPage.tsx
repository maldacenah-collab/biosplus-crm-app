// src/pages/ProveedoresPage.tsx
import React, { useEffect, useState, useRef, useCallback } from 'react';
import { useProveedorStore } from '../stores/useProveedorStore';
import { Provider } from '../types';
import { can } from '../utils/permissions';
import ProveedorModal from '../components/proveedores/ProveedorModal';

const ProveedoresPage = () => {
  const { providers, isLoading, hasMore, fetchProviders, resetAndFetch, removeProvider } = useProveedorStore();
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingProvider, setEditingProvider] = useState<Provider | null>(null);
  const [searchTerm, setSearchTerm] = useState('');
  const searchTimeoutRef = useRef<number | null>(null);

  const canCreate = can('compras:crear');
  const canEdit = can('compras:editar');
  const canDelete = can('compras:reversar');

  useEffect(() => {
    // Fix: Provide an empty string argument to satisfy the function signature which expects one argument.
    resetAndFetch('');
  }, [resetAndFetch]);

  useEffect(() => {
    if (searchTimeoutRef.current) {
      clearTimeout(searchTimeoutRef.current);
    }
    searchTimeoutRef.current = window.setTimeout(() => {
      resetAndFetch(searchTerm);
    }, 300);

    return () => {
      if (searchTimeoutRef.current) {
        clearTimeout(searchTimeoutRef.current);
      }
    };
  }, [searchTerm, resetAndFetch]);

  // Fix: Initialize useRef for the IntersectionObserver with null to satisfy its signature, which requires an initial value. This resolves the "Expected 1 arguments, but got 0" error on this line.
  const observer = useRef<IntersectionObserver | null>(null);
  // Fix: Correct the node type to HTMLTableRowElement to match the `ref` usage on a `<tr>` element.
  const lastProviderElementRef = useCallback((node: HTMLTableRowElement | null) => {
    if (isLoading) return;
    if (observer.current) observer.current.disconnect();
    observer.current = new IntersectionObserver(entries => {
      if (entries[0].isIntersecting && hasMore) {
        fetchProviders(searchTerm);
      }
    });
    if (node) observer.current.observe(node);
  }, [isLoading, hasMore, fetchProviders, searchTerm]);

  const handleCreateClick = () => {
    setEditingProvider(null);
    setIsModalOpen(true);
  };

  const handleEditClick = (provider: Provider) => {
    setEditingProvider(provider);
    setIsModalOpen(true);
  };

  const handleDeleteClick = (e: React.MouseEvent, provider: Provider) => {
    e.stopPropagation();
    if (window.confirm(`¿Está seguro de que desea eliminar al proveedor "${provider.nombre}"? Esta acción no se puede deshacer.`)) {
      removeProvider(provider.id);
    }
  };

  return (
    <div>
      <div className="flex flex-wrap justify-between items-center mb-6 gap-4">
        <h1 className="text-3xl font-bold text-gray-800">Proveedores</h1>
        {canCreate && (
            <button onClick={handleCreateClick} className="btn btn-primary">
                Crear Proveedor
            </button>
        )}
      </div>

      <div className="bg-white p-4 rounded-lg shadow-md mb-6">
        <label htmlFor="search" className="form-label">Buscar por Nombre</label>
        <input
            type="text"
            id="search"
            placeholder="Escriba para buscar..."
            className="mt-1 form-input w-full md:w-1/2"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
        />
      </div>

      <div className="bg-background-card rounded-lg shadow-md overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-sm text-left text-gray-500">
            <thead className="text-xs text-gray-700 uppercase bg-gray-50">
              <tr>
                <th scope="col" className="px-6 py-3">Nombre</th>
                <th scope="col" className="px-6 py-3">CUIT</th>
                <th scope="col" className="px-6 py-3 text-center">Acciones</th>
              </tr>
            </thead>
            <tbody>
              {providers.map((provider, index) => {
                const isLastElement = index === providers.length - 1;
                return (
                  <tr
                    key={provider.id}
                    ref={isLastElement ? lastProviderElementRef : null}
                    className="bg-white border-b hover:bg-gray-50 cursor-pointer"
                    onClick={() => canEdit && handleEditClick(provider)}
                  >
                    <td className="px-6 py-4 font-medium text-primary">{provider.nombre}</td>
                    <td className="px-6 py-4">{provider.cuit || 'N/A'}</td>
                    <td className="px-6 py-4 text-center">
                      {canDelete && (
                        <button
                            onClick={(e) => handleDeleteClick(e, provider)}
                            className="font-medium text-red-600 hover:underline"
                        >
                            Eliminar
                        </button>
                      )}
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
          {isLoading && <p className="text-center p-4">Cargando más proveedores...</p>}
          {!hasMore && providers.length > 0 && <p className="text-center p-4 text-gray-500">Fin de la lista.</p>}
          {!isLoading && providers.length === 0 && <p className="text-center p-8 text-gray-500">No se encontraron proveedores.</p>}
        </div>
      </div>

      {isModalOpen && (
        <ProveedorModal
          isOpen={isModalOpen}
          onClose={() => setIsModalOpen(false)}
          provider={editingProvider}
        />
      )}
    </div>
  );
};

export default ProveedoresPage;
