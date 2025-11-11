// src/pages/DashboardGerencialPage.tsx

import React, { useEffect, useState, useMemo, FC } from 'react';
import { Chart as ChartJS, CategoryScale, LinearScale, BarElement, ArcElement, PointElement, LineElement, Title, Tooltip, Legend } from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';
import { Bar } from 'react-chartjs-2';
import { useDashboardGerencialStore } from '../stores/useDashboardGerencialStore';
import { formatCurrency } from '../utils/formatters';

ChartJS.register(
  CategoryScale, LinearScale, BarElement, ArcElement, PointElement, LineElement, Title, Tooltip, Legend, ChartDataLabels
);

const KpiCard = ({ title, value, subtext }: { title: string; value: string; subtext?: string }) => (
    <div className="bg-white p-6 rounded-2xl shadow-neumorphic border border-slate-200">
        <h3 className="text-sm font-bold text-primary uppercase tracking-wider">{title}</h3>
        <p className="text-3xl font-bold text-text-main mt-2 truncate">{value}</p>
        {subtext && <p className="text-xs text-text-secondary mt-1">{subtext}</p>}
    </div>
);

// FIX: Added an interface for ChartCardProps to explicitly include `children`,
// resolving a TypeScript error where the prop was missing from the component's definition.
interface ChartCardProps {
    title: string;
    children: React.ReactNode;
}

const ChartCard: FC<ChartCardProps> = ({ title, children }) => (
    <div className="bg-white p-6 rounded-2xl shadow-neumorphic">
        <h2 className="text-xl font-bold mb-4">{title}</h2>
        <div className="h-96 relative">
            {children}
        </div>
    </div>
);


const DashboardGerencialPage = () => {
    const { data, isLoading, error, fetchData } = useDashboardGerencialStore();

    const getInitialDateRange = () => {
        const to = new Date();
        const from = new Date(to.getFullYear(), to.getMonth(), 1);
        return {
            from: from.toISOString().split('T')[0],
            to: to.toISOString().split('T')[0],
            costMethod: 'ultima_compra',
        };
    };

    const [filters, setFilters] = useState(getInitialDateRange());

    useEffect(() => {
        fetchData(filters);
    }, []);

    const handleFilterChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
        setFilters(prev => ({...prev, [e.target.name]: e.target.value }));
    };

    const handleApplyFilters = () => {
        fetchData(filters);
    };

    const chartOptions = {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                position: 'top' as const,
            },
            datalabels: {
                anchor: 'end' as const,
                align: 'top' as const,
                formatter: (value: number) => formatCurrency(value),
                font: {
                    weight: 'bold' as const
                },
                color: '#4A5568'
            }
        },
    };
    
    const renderContent = () => {
        if (isLoading) return <div className="text-center p-8">Cargando dashboard...</div>;
        if (error) return <div className="text-center p-8 text-danger">Error al cargar los datos: {error}</div>;
        if (!data) return <div className="text-center p-8">No hay datos disponibles para el período seleccionado.</div>;
        
        const d = data;

        const barChartData = {
            labels: (d.ranking_vendedores || []).map(item => item.vendedor_nombre),
            datasets: [{
                label: 'Ventas por Vendedor (ARS)',
                data: (d.ranking_vendedores || []).map(item => item.total_vendido),
                backgroundColor: 'rgba(0, 113, 188, 0.7)',
            }],
        };

        return (
            <div className="space-y-8">
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                    <KpiCard title="Ventas vs Meta (ARS)" value={`${formatCurrency(d.ventas_totales_ars)} / ${formatCurrency(d.meta_global_ars)}`} />
                    <KpiCard title="Rentabilidad Bruta (ARS)" value={formatCurrency(d.rentabilidad_bruta_ars)} subtext={`Margen promedio: ${d.margen_promedio.toFixed(2)}%`} />
                    <KpiCard title="Ticket Promedio (ARS)" value={formatCurrency(d.ticket_promedio_ars)} />
                    <KpiCard title="Dinero por Cobrar (ARS)" value={formatCurrency(d.dinero_por_cobrar_ars)} />
                </div>
                
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    <ChartCard title="Ventas por Vendedor">
                        <Bar options={chartOptions} data={barChartData} />
                    </ChartCard>
                    <div className="bg-white p-6 rounded-2xl shadow-neumorphic">
                        <h2 className="text-xl font-bold mb-4">Top 5 Productos más Rentables</h2>
                        <div className="overflow-x-auto">
                            <table className="w-full text-sm">
                                <thead className="bg-gray-50"><tr><th className="text-left p-2">Producto</th><th className="text-right p-2">Ganancia (ARS)</th><th className="text-right p-2">Margen</th></tr></thead>
                                <tbody>
                                    {(d.top_productos_rentables || []).map((p: any, i: number) => (
                                        <tr key={i} className="border-t"><td className="p-2 font-medium">{p.producto_nombre}</td><td className="text-right p-2">{formatCurrency(p.rentabilidad_producto)}</td><td className="text-right p-2">{p.margen_producto.toFixed(2)}%</td></tr>
                                    ))}
                                    {(!d.top_productos_rentables || d.top_productos_rentables.length === 0) && (<tr><td colSpan={3} className="text-center p-4">No hay datos</td></tr>)}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        );
    };

    return (
        <div>
            <h1 className="text-3xl font-bold text-text-main mb-6">Dashboard Gerencial</h1>

            <div className="bg-white p-4 rounded-2xl shadow-neumorphic mb-8 flex flex-wrap items-end gap-4">
                <div>
                    <label htmlFor="from" className="form-label text-sm">Desde</label>
                    <input type="date" name="from" id="from" value={filters.from} onChange={handleFilterChange} className="form-input" />
                </div>
                <div>
                    <label htmlFor="to" className="form-label text-sm">Hasta</label>
                    <input type="date" name="to" id="to" value={filters.to} onChange={handleFilterChange} className="form-input" />
                </div>
                 <div>
                    <label htmlFor="costMethod" className="form-label text-sm">Método de Costo</label>
                    <select name="costMethod" id="costMethod" value={filters.costMethod} onChange={handleFilterChange} className="form-input">
                        <option value="ultima_compra">Última Compra</option>
                        <option value="reposicion">Reposición</option>
                    </select>
                </div>
                <button onClick={handleApplyFilters} className="btn btn-primary" disabled={isLoading}>
                    {isLoading ? 'Cargando...' : 'Aplicar Filtros'}
                </button>
            </div>

            {renderContent()}
        </div>
    );
};

export default DashboardGerencialPage;
