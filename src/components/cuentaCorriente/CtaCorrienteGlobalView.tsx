// src/components/cuentaCorriente/CtaCorrienteGlobalView.tsx
import React, { useEffect, useState, useMemo } from 'react';
import { useCtaCorrienteStore } from '../../stores/useCtaCorrienteStore';
import { useSharedStore } from '../../stores/useSharedStore';
import { useContactStore } from '../../stores/useContactStore'; // Importar el store de contactos
import { SaldoClienteGlobal } from '../../types';
import { can } from '../../utils/permissions';
import { formatCurrency } from '../../utils/formatters';
import { exportToCSV } from '../../utils/fileExport';

interface Props {
  onSelectContact: (contact: SaldoClienteGlobal) => void;
}

const CtaCorrienteGlobalView = ({ onSelectContact }: Props) => {
  const { saldosGlobales, isLoading, fetchSaldosGlobales } = useCtaCorrienteStore();
  const { salespeople, currentUser } = useSharedStore();
  const { contacts, fetchContacts } = useContactStore(); // Usar el store de contactos

  const [filters, setFilters] = useState({ vendedorId: '', status: 'todos' });
  const [sortConfig, setSortConfig] = useState<{ key: keyof SaldoClienteGlobal; order: 'asc' | 'desc' }>({ key: 'dias_vencida', order: 'desc' });

  const esAdmin = can('ctacte_clientes:ver:todos');

  useEffect(() => {
    fetchSaldosGlobales();
    if (contacts.length === 0) {
        fetchContacts();
    }
    if (!esAdmin && currentUser?.vendedorId) {
      setFilters(prev => ({ ...prev, vendedorId: String(currentUser.vendedorId) }));
    }
  }, [fetchSaldosGlobales, esAdmin, currentUser, contacts.length, fetchContacts]);

  const filteredAndSortedData = useMemo(() => {
    // Crear un mapa de contactId -> vendedor_id para una búsqueda eficiente
    const contactVendedorMap = new Map<number, number | undefined>();
    contacts.forEach(c => {
        if (c.id && c.vendedor_id) {
            contactVendedorMap.set(c.id, c.vendedor_id);
        }
    });

    let data = [...saldosGlobales];

    if (filters.vendedorId) {
      data = data.filter(saldo => {
        const vendedorId = contactVendedorMap.get(saldo.id);
        return vendedorId === parseInt(filters.vendedorId, 10);
      });
    }
    
    if (filters.status === 'proximos_a_vencer') {
      data = data.filter(c => c.dias_vencida >= -7 && c.dias_vencida <= 0);
    } else if (filters.status === 'vencidos_30') {
      data = data.filter(c => c.dias_vencida > 30);
    }

    data.sort((a, b) => {
      const valA = a[sortConfig.key];
      const valB = b[sortConfig.key];
      if (valA === null || valA === undefined) return 1;
      if (valB === null || valB === undefined) return -1;
      if (valA < valB) return sortConfig.order === 'asc' ? -1 : 1;
      if (valA > valB) return sortConfig.order === 'asc' ? 1 : -1;
      return 0;
    });

    return data;
  }, [saldosGlobales, contacts, filters, sortConfig]);

  const totalPorCobrar = useMemo(() => {
    return filteredAndSortedData.reduce((sum, item) => sum + item.saldo, 0);
  }, [filteredAndSortedData]);

  const handleSort = (key: keyof SaldoClienteGlobal) => {
    setSortConfig(prev => ({
      key,
      order: prev.key === key && prev.order === 'desc' ? 'asc' : 'desc'
    }));
  };

  const handleExport = () => {
    exportToCSV(
        ["Cliente", "Saldo", "Antiguedad Deuda", "Dias Vencida"],
        filteredAndSortedData.map(c => [c.nombre, c.saldo, c.antiguedad_deuda, c.dias_vencida]),
        `saldos_clientes_${new Date().toISOString().split('T')[0]}.csv`
    );
  }

  if (isLoading) {
    return <div className="text-center p-8">Cargando saldos...</div>;
  }

  return (
    <div className="space-y-6">
        <div className="bg-white p-4 rounded-lg shadow-md grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
                <label htmlFor="filter-vendedor" className="form-label">Filtrar por Vendedor</label>
                <select id="filter-vendedor" value={filters.vendedorId} onChange={e => setFilters(f => ({ ...f, vendedorId: e.target.value }))} className="form-input" disabled={!esAdmin}>
                    <option value="">Todos</option>
                    {salespeople.map(v => <option key={v.id} value={v.id}>{v.perfiles.nombre}</option>)}
                </select>
            </div>
            <div>
                <label className="form-label">Estado de Deuda</label>
                <div className="flex items-center gap-2 mt-1 bg-gray-100 p-1 rounded-lg">
                    {['todos', 'proximos_a_vencer', 'vencidos_30'].map(status => (
                        <button key={status} onClick={() => setFilters(f => ({ ...f, status }))}
                                className={`flex-1 py-1.5 text-sm rounded-md ${filters.status === status ? 'bg-white shadow font-semibold text-primary' : 'hover:bg-gray-200'}`}>
                            {status.replace(/_/g, ' ').replace('vencidos 30', 'Vencidos +30d').replace(/\b\w/g, l => l.toUpperCase())}
                        </button>
                    ))}
                </div>
            </div>
        </div>
      <div className="bg-white p-6 rounded-lg shadow-md">
        <div className="flex justify-end mb-4">
            <button onClick={handleExport} className="btn btn-secondary">Exportar a Excel</button>
        </div>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead className="text-left bg-gray-50">
              <tr>
                <th className="p-3 cursor-pointer" onClick={() => handleSort('nombre')}>Cliente</th>
                <th className="p-3 cursor-pointer text-right" onClick={() => handleSort('saldo')}>Saldo Total</th>
                <th className="p-3 cursor-pointer text-center" onClick={() => handleSort('antiguedad_deuda')}>Antigüedad (días)</th>
                <th className="p-3 cursor-pointer text-center" onClick={() => handleSort('dias_vencida')}>Días Vencida</th>
              </tr>
            </thead>
            <tbody>
              {filteredAndSortedData.map(item => (
                <tr key={item.id} onClick={() => onSelectContact(item)} className="border-b hover:bg-gray-50 cursor-pointer">
                  <td className="p-3 font-medium text-primary">{item.nombre}</td>
                  <td className="p-3 text-right font-semibold text-red-600">{formatCurrency(item.saldo)}</td>
                  <td className="p-3 text-center">{item.antiguedad_deuda}</td>
                  <td className="p-3 text-center">
                      <span className={`px-2 py-1 rounded-full text-xs font-semibold ${item.dias_vencida > 30 ? 'bg-red-100 text-red-800' : item.dias_vencida > 0 ? 'bg-yellow-100 text-yellow-800' : 'text-gray-700'}`}>
                          {item.dias_vencida > 0 ? `+${item.dias_vencida}` : item.dias_vencida}
                      </span>
                  </td>
                </tr>
              ))}
            </tbody>
            <tfoot>
                <tr className="bg-gray-100 font-bold">
                    <td className="p-3 text-right">Total por Cobrar (Filtrado):</td>
                    <td className="p-3 text-right text-red-700">{formatCurrency(totalPorCobrar)}</td>
                    <td colSpan={2}></td>
                </tr>
            </tfoot>
          </table>
        </div>
      </div>
    </div>
  );
};

export default CtaCorrienteGlobalView;
