// src/pages/CuentaCorrientePage.tsx
// Implementación completa del módulo de Cuentas Corrientes de Clientes.

import React, { useState } from 'react';
import CtaCorrienteGlobalView from '../components/cuentaCorriente/CtaCorrienteGlobalView';
import CtaCorrienteDetailView from '../components/cuentaCorriente/CtaCorrienteDetailView';
import { SaldoClienteGlobal } from '../types';

const CuentaCorrientePage = () => {
  const [view, setView] = useState<'global' | 'detail'>('global');
  const [selectedContact, setSelectedContact] = useState<SaldoClienteGlobal | null>(null);

  const handleSelectContact = (contact: SaldoClienteGlobal) => {
    setSelectedContact(contact);
    setView('detail');
  };

  const handleBackToGlobal = () => {
    setSelectedContact(null);
    setView('global');
  };

  return (
    <div>
      <h1 className="text-3xl font-bold text-gray-800 mb-6">Cuentas Corrientes de Clientes</h1>
      
      {view === 'global' ? (
        <CtaCorrienteGlobalView onSelectContact={handleSelectContact} />
      ) : selectedContact ? (
        <CtaCorrienteDetailView contact={selectedContact} onBack={handleBackToGlobal} />
      ) : null}
    </div>
  );
};

export default CuentaCorrientePage;