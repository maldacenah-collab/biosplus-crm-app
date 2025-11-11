// src/components/pagosProveedores/PagosProveedoresGlobalView.tsx
import React, { useEffect, useMemo } from 'react';
import { usePagosProveedoresStore } from '../../stores/usePagosProveedoresStore';
import { SaldoProveedorGlobal } from '../../types';
import { formatCurrency } from '../../utils/formatters';

interface Props {
  onSelectProvider: (provider: SaldoProveedorGlobal) => void;
}

const PagosProveedoresGlobalView = ({ onSelectProvider }: Props) => {
  const { saldosGlobales, isLoading, fetchSaldosGlobales } = usePagosProveedoresStore();

  useEffect(() => {
    fetchSaldosGlobales();
  }, [fetchSaldosGlobales]);

  const sortedData = useMemo(() => {
    return [...saldosGlobales].sort((a, b) => b.saldo - a.saldo);
  }, [saldosGlobales]);

  const totalPorPagar = useMemo(() => {
    return sortedData.filter(p => p.saldo > 0).reduce((sum, p) => sum + p.saldo, 0);
  }, [sortedData]);

  const saldoAFavor = useMemo(() => {
    return sortedData.filter(p => p.saldo < 0).reduce((sum, p) => sum + p.saldo, 0);
  }, [sortedData]);
  
  if (isLoading) {
    return <div className="text-center p-8">Cargando saldos de proveedores...</div>;
  }
  
  return (
    <div className="bg-white p-6 rounded-lg shadow-md">
      <div className="overflow-x-auto">
        <table className="w-full text-sm">
          <thead className="text-left bg-gray-50">
            <tr>
              <th className="p-3">Proveedor</th>
              <th className="p-3 text-right">Saldo</th>
            </tr>
          </thead>
          <tbody>
            {sortedData.map(provider => (
              <tr key={provider.id} onClick={() => onSelectProvider(provider)} className="border-b hover:bg-gray-50 cursor-pointer">
                <td className="p-3 font-medium text-primary">{provider.nombre}</td>
                <td className={`p-3 text-right font-semibold ${provider.saldo > 0 ? 'text-red-600' : 'text-text-secondary'}`}>
                  {formatCurrency(provider.saldo)}
                </td>
              </tr>
            ))}
          </tbody>
           <tfoot className="bg-gray-100 font-bold">
                <tr>
                    <td className="p-3 text-right">Total por Pagar:</td>
                    <td className="p-3 text-right text-red-700">{formatCurrency(totalPorPagar)}</td>
                </tr>
                <tr>
                    <td className="p-3 text-right">Saldo a Favor Nuestro:</td>
                    <td className="p-3 text-right text-text-secondary">{formatCurrency(Math.abs(saldoAFavor))}</td>
                </tr>
            </tfoot>
        </table>
      </div>
    </div>
  );
};

export default PagosProveedoresGlobalView;