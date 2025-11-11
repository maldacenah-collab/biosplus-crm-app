// src/components/comisiones/ComisionesGlobalView.tsx
import { useEffect, useState, useMemo } from 'react';
import { useComisionesStore } from '../../stores/useComisionesStore';
import { formatCurrency } from '../../utils/formatters';

interface Props {
  onSelectVendedor: (vendedorId: number) => void;
}

const ComisionesGlobalView = ({ onSelectVendedor }: Props) => {
    const { resumen, isLoading, fetchResumen } = useComisionesStore();
    const [period, setPeriod] = useState({ 
        mes: new Date().getMonth() + 1, 
        anio: new Date().getFullYear() 
    });

    useEffect(() => {
        fetchResumen(period.mes, period.anio);
    }, [fetchResumen, period]);

    const kpis = useMemo(() => {
        const aPagar = resumen.reduce((sum, v) => sum + v.comisiones_a_pagar, 0);
        const potenciales = resumen.reduce((sum, v) => sum + v.comisiones_potenciales, 0);
        return { aPagar, potenciales };
    }, [resumen]);

    if (isLoading) return <div>Cargando resumen de comisiones...</div>;

    return (
        <div className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="bg-white p-5 rounded-lg shadow-md"><p className="text-gray-500 text-sm">Total a Pagar (Filtro)</p><p className="text-2xl font-bold text-text-secondary">{formatCurrency(kpis.aPagar)}</p></div>
                <div className="bg-white p-5 rounded-lg shadow-md"><p className="text-gray-500 text-sm">Comisiones Potenciales (Total)</p><p className="text-2xl font-bold text-yellow-600">{formatCurrency(kpis.potenciales)}</p></div>
            </div>
             <div className="bg-white p-4 rounded-lg shadow-md flex items-center gap-4">
                <label className="text-sm font-medium">Período:</label>
                <select value={period.mes} onChange={e => setPeriod(p => ({...p, mes: parseInt(e.target.value)}))} className="form-input">
                    {[...Array(12).keys()].map(i => <option key={i+1} value={i+1}>{new Date(0,i).toLocaleString('es', {month: 'long'})}</option>)}
                </select>
                <select value={period.anio} onChange={e => setPeriod(p => ({...p, anio: parseInt(e.target.value)}))} className="form-input">
                    {[...Array(5).keys()].map(i => <option key={i} value={new Date().getFullYear() - i}>{new Date().getFullYear() - i}</option>)}
                </select>
            </div>
            <div className="bg-white p-6 rounded-lg shadow-md">
                <table className="w-full text-sm">
                    <thead className="text-left bg-gray-50">
                        <tr>
                            <th className="p-3">Vendedor</th><th className="p-3 text-right">A Pagar</th>
                            <th className="p-3 text-right">Potencial</th><th className="p-3 text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        {resumen.map(v => (
                            <tr key={v.vendedor_id} className="border-b">
                                <td className="p-3 font-medium">{v.nombre_vendedor}</td>
                                <td className="p-3 text-right font-bold text-text-secondary">{formatCurrency(v.comisiones_a_pagar)}</td>
                                <td className="p-3 text-right text-yellow-600">{formatCurrency(v.comisiones_potenciales)}</td>
                                <td className="p-3 text-center"><button onClick={() => onSelectVendedor(v.vendedor_id)} className="font-medium text-primary hover:underline">Ver Detalle</button></td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default ComisionesGlobalView;