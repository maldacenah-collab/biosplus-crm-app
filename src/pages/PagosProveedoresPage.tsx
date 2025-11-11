// src/pages/PagosProveedoresPage.tsx
// Implementación completa del módulo de Cuentas Corrientes de Proveedores.

import React, { useState } from 'react';
import PagosProveedoresGlobalView from '../components/pagosProveedores/PagosProveedoresGlobalView';
import PagosProveedoresDetailView from '../components/pagosProveedores/PagosProveedoresDetailView';
import { SaldoProveedorGlobal } from '../types';

const PagosProveedoresPage = () => {
  const [view, setView] = useState<'global' | 'detail'>('global');
  const [selectedProvider, setSelectedProvider] = useState<SaldoProveedorGlobal | null>(null);

  const handleSelectProvider = (provider: SaldoProveedorGlobal) => {
    setSelectedProvider(provider);
    setView('detail');
  };

  const handleBackToGlobal = () => {
    setSelectedProvider(null);
    setView('global');
  };
  
  return (
    <div>
      <h1 className="text-3xl font-bold text-gray-800 mb-6">Cuentas Corrientes de Proveedores</h1>
      
      {view === 'global' ? (
        <PagosProveedoresGlobalView onSelectProvider={handleSelectProvider} />
      ) : selectedProvider ? (
        <PagosProveedoresDetailView provider={selectedProvider} onBack={handleBackToGlobal} />
      ) : null}
    </div>
  );
};

export default PagosProveedoresPage;