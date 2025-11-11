// src/pages/AnalisisVentasPage.tsx
import React, { useState, useEffect, useMemo, useRef } from 'react';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  LineElement,
  PointElement,
  ArcElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';
import { Bar, Pie, Line } from 'react-chartjs-2';
import { useAnalisisVentasStore } from '../stores/useAnalisisVentasStore';
import { useSharedStore } from '../stores/useSharedStore';
import { formatCurrency } from '../utils/formatters';
import { can } from '../utils/permissions';
import { AnalisisData } from '../types';

// Registrar componentes y plugins de Chart.js
ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  LineElement,
  PointElement,
  ArcElement,
  Title,
  Tooltip,
  Legend,
  ChartDataLabels
);

type View = 'productos' | 'vendedores' | 'lineas' | 'evolucion';
type Currency = 'ars' | 'usd';
type ChartType = 'bar' | 'pie' | 'line';

const AnalisisVentasPage = () => {
    const { reportData, isLoading, fetchReportData } = useAnalisisVentasStore();
    const { currentUser } = useSharedStore();

    const [view, setView] = useState<View>('productos');
    const [chartType, setChartType] = useState<ChartType>('bar');
    const [currency, setCurrency] = useState<Currency>('ars');
    
    const initialDates = () => {
        const to = new Date();
        const from = new Date(to.getFullYear(), to.getMonth(), 1);
        return {
            from: from.toISOString().split('T')[0],
            to: to.toISOString().split('T')[0],
        };
    };
    const [filters, setFilters] = useState(initialDates());

    const esAdmin = can('analisis:ver:todos');
    const vendedorId = esAdmin ? null : currentUser?.vendedorId ?? null;

    const handleFetch = () => {
        fetchReportData(filters, vendedorId);
    };

    useEffect(() => {
        handleFetch();
    }, []);

    const brandColors = {
        primary: '#0071BC',
        primaryTransparent: 'rgba(0, 113, 188, 0.6)',
        gray: '#606060',
        grayTransparent: 'rgba(96, 96, 96, 0.6)',
        accent: ['#0071BC', '#606060', '#f59e0b', '#38bdf8', '#ef4444', '#8b5cf6', '#ec4899'] // Replaced green with light blue
    };


    const chartDataConfig = useMemo(() => {
        if (!reportData || !reportData[view]) return { labels: [], datasets: [] };

        const dataSet = reportData[view] as any[];
        const labels = dataSet.map(d => d.nombre || d.nombre_vendedor || d.linea || d.anio);
        const dataKey = `ventas_${currency}`;

        if (chartType === 'pie' && view !== 'evolucion') {
            return {
                unidades: {
                    labels,
                    datasets: [{ data: dataSet.map(d => d.unidades || 0), backgroundColor: brandColors.accent }],
                },
                valor: {
                    labels,
                    datasets: [{ data: dataSet.map(d => d[dataKey] || 0), backgroundColor: brandColors.accent }],
                },
            };
        }
        
        const datasets: any[] = [{
            label: `Ventas (${currency.toUpperCase()})`,
            data: dataSet.map(d => d[dataKey] || 0),
            backgroundColor: brandColors.primaryTransparent,
            borderColor: brandColors.primary,
            yAxisID: 'yVentas',
            tension: 0.1
        }];

        if (view !== 'vendedores' && view !== 'evolucion' && chartType === 'bar') {
            datasets.push({
                label: 'Unidades',
                data: dataSet.map(d => d.unidades || 0),
                backgroundColor: brandColors.grayTransparent,
                borderColor: brandColors.gray,
                yAxisID: 'yUnidades',
            });
        }
        
        return { labels, datasets };
    }, [reportData, view, currency, chartType]);

    const setDateRange = (period: 'month' | '3months' | 'year') => {
        const to = new Date();
        let from = new Date();
        if (period === 'month') from = new Date(to.getFullYear(), to.getMonth(), 1);
        if (period === '3months') from.setMonth(to.getMonth() - 3);
        if (period === 'year') from.setFullYear(to.getFullYear() - 1);
        
        setFilters({ from: from.toISOString().split('T')[0], to: to.toISOString().split('T')[0]});
    };

    const tableConfig = useMemo(() => {
        if (!reportData || !reportData[view]) return null;
        
        const data = reportData[view] as any[];
        let headers: string[] = [];
        let rows: React.ReactNode[] = [];

        const renderEvoCell = (ars: number, arsAnt: number) => {
            if (arsAnt <= 0) return <td className="p-2 font-semibold text-gray-500">N/A</td>;
            const evo = ((ars - arsAnt) / arsAnt) * 100;
            return <td className={`p-2 font-semibold ${evo >= 0 ? "text-primary" : "text-red-600"}`}>{evo.toFixed(1)}%</td>;
        };

        switch (view) {
            case 'productos':
                headers = ["Producto", "Línea", "Unidades", `Fact. (${currency.toUpperCase()})`, "Fact. Año Ant. (ARS)", "Evol %"];
                rows = data.map((d, i) => (
                    <tr key={i} className="border-t"><td className="p-2 font-medium">{d.nombre}</td><td>{d.linea}</td><td>{d.unidades}</td><td>{formatCurrency(d[`ventas_${currency}`], currency)}</td><td>{formatCurrency(d.ventas_ars_anterior)}</td>{renderEvoCell(d.ventas_ars, d.ventas_ars_anterior)}</tr>
                ));
                break;
            case 'vendedores':
                headers = ["Vendedor", "Pedidos", `Fact. (${currency.toUpperCase()})`, "Fact. Año Ant. (ARS)", "Evol %"];
                rows = data.map((d, i) => (
                    <tr key={i} className="border-t"><td className="p-2 font-medium">{d.nombre_vendedor}</td><td>{d.pedidos}</td><td>{formatCurrency(d[`ventas_${currency}`], currency)}</td><td>{formatCurrency(d.ventas_ars_anterior)}</td>{renderEvoCell(d.ventas_ars, d.ventas_ars_anterior)}</tr>
                ));
                break;
            case 'lineas':
                 headers = ["Línea", "Unidades", `Fact. (${currency.toUpperCase()})`, "Fact. Año Ant. (ARS)", "Evol %"];
                 rows = data.map((d, i) => (
                    <tr key={i} className="border-t"><td className="p-2 font-medium">{d.linea}</td><td>{d.unidades}</td><td>{formatCurrency(d[`ventas_${currency}`], currency)}</td><td>{formatCurrency(d.ventas_ars_anterior)}</td>{renderEvoCell(d.ventas_ars, d.ventas_ars_anterior)}</tr>
                ));
                break;
            case 'evolucion':
                headers = ["Año", `Facturación (${currency.toUpperCase()})`, "N° Pedidos", "Ticket Promedio (ARS)"];
                rows = data.map((d, i) => (
                    <tr key={i} className="border-t"><td className="p-2 font-medium">{d.anio}</td><td>{formatCurrency(d[`ventas_${currency}`], currency)}</td><td>{d.pedidos}</td><td>{formatCurrency(d.ticket_promedio_ars)}</td></tr>
                ));
                break;
        }

        return { headers, rows };
    }, [reportData, view, currency]);
    
    const renderChart = () => {
        if (!reportData) return null;
        
        const finalChartType = view === 'evolucion' ? 'line' : chartType;

        if (finalChartType === 'pie') {
            return (
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    <div className="flex flex-col h-96">
                        <h3 className="text-center font-semibold text-gray-700 mb-2">Unidades</h3>
                        <div className="relative flex-1">
                            <Pie
                                key={`pie-unidades-${view}-${currency}`}
                                data={(chartDataConfig as any).unidades}
                                options={{ responsive: true, maintainAspectRatio: false, plugins: { legend: { display: false }, datalabels: { color: '#fff' }}}}
                            />
                        </div>
                    </div>
                    <div className="flex flex-col h-96">
                        <h3 className="text-center font-semibold text-gray-700 mb-2">Facturación</h3>
                        <div className="relative flex-1">
                            <Pie
                                key={`pie-valor-${view}-${currency}`}
                                data={(chartDataConfig as any).valor}
                                options={{ responsive: true, maintainAspectRatio: false, plugins: { legend: { position: 'bottom' }, datalabels: { color: '#fff', formatter: (v) => formatCurrency(v, currency) }}}}
                            />
                        </div>
                    </div>
                </div>
            );
        }
        
        const options: any = {
            responsive: true, maintainAspectRatio: false,
            plugins: { legend: { display: (chartDataConfig as any).datasets.length > 1 }, datalabels: { anchor: 'end', align: 'top', formatter: (v, ctx) => ctx.dataset.label?.includes('Unidades') ? v : formatCurrency(v, currency) } },
            scales: { yVentas: { display: true, position: 'left', title: { display: true, text: `Ventas (${currency.toUpperCase()})` } }, yUnidades: { display: (view !== 'vendedores' && view !== 'evolucion' && chartType === 'bar'), position: 'right', title: { display: true, text: 'Unidades' }, grid: { drawOnChartArea: false } } }
        };

        const chartKey = `${view}-${chartType}-${currency}`;
        const ChartComponent = finalChartType === 'line' ? Line : Bar;
        return (
            <div className="h-96">
                <ChartComponent key={chartKey} options={options} data={chartDataConfig as any} />
            </div>
        );
    }

    return (
        <div>
            <h1 className="text-3xl font-bold text-text-main mb-6">Análisis de Ventas</h1>

            <div className="bg-white p-4 rounded-xl shadow-md mb-6">
                <div className="flex flex-wrap justify-between items-center gap-4">
                    <div className="flex items-center gap-2 text-sm">
                        <label>Desde:</label><input type="date" value={filters.from} onChange={e => setFilters(f => ({...f, from: e.target.value}))} className="form-input"/>
                        <label>Hasta:</label><input type="date" value={filters.to} onChange={e => setFilters(f => ({...f, to: e.target.value}))} className="form-input"/>
                    </div>
                     <div className="flex items-center gap-2 text-sm">
                        <button onClick={() => setDateRange('month')} className="btn btn-secondary text-xs">Mes Actual</button>
                        <button onClick={() => setDateRange('3months')} className="btn btn-secondary text-xs">3 Meses</button>
                        <button onClick={() => setDateRange('year')} className="btn btn-secondary text-xs">1 Año</button>
                    </div>
                    <div className="flex items-center gap-4">
                        <div className="flex items-center gap-1 bg-gray-200 p-1 rounded-full">
                            <button onClick={() => setCurrency('ars')} className={`px-3 py-1 rounded-full text-sm font-semibold ${currency === 'ars' ? 'bg-white shadow' : ''}`}>ARS</button>
                            <button onClick={() => setCurrency('usd')} className={`px-3 py-1 rounded-full text-sm font-semibold ${currency === 'usd' ? 'bg-white shadow' : ''}`}>USD</button>
                        </div>
                        <button onClick={handleFetch} className="btn btn-primary" disabled={isLoading}>{isLoading ? 'Cargando...' : 'Aplicar Filtros'}</button>
                    </div>
                </div>
            </div>

            <div className="bg-white p-6 rounded-xl shadow-md">
                <div className="bg-gray-100 p-1.5 rounded-lg flex flex-wrap gap-2 mb-6">
                    {(['productos', 'vendedores', 'lineas', 'evolucion'] as View[]).map(v => (
                        <button key={v} onClick={() => setView(v)} className={`flex-1 py-2 text-sm font-semibold rounded-md transition-colors ${view === v ? 'bg-white shadow text-primary' : 'text-gray-600 hover:bg-gray-200'}`}>{v.replace('_', ' ')}</button>
                    ))}
                </div>
                
                {isLoading ? <p className="text-center p-8">Cargando datos...</p> : !reportData ? <p className="text-center p-8 text-red-500">Error al cargar los datos.</p> : (
                    <>
                        <div className="flex justify-between items-center mb-4">
                            <h2 className="text-xl font-bold">{`Ventas por ${view}`}</h2>
                            {view !== 'evolucion' && (
                                <select value={chartType} onChange={e => setChartType(e.target.value as ChartType)} className="form-input">
                                    <option value="bar">Barras</option>
                                    <option value="pie">Torta</option>
                                    <option value="line">Líneas</option>
                                </select>
                            )}
                        </div>
                        {renderChart()}
                        <div className="mt-8">
                            <h2 className="text-xl font-bold mb-4">Tabla de Datos</h2>
                            <div className="overflow-x-auto">
                                <table className="w-full text-sm">
                                    <thead className="text-left bg-gray-50"><tr>{tableConfig?.headers.map(h => <th key={h} className="p-2">{h}</th>)}</tr></thead>
                                    <tbody>{tableConfig?.rows}</tbody>
                                </table>
                            </div>
                        </div>
                    </>
                )}
            </div>
        </div>
    );
};

export default AnalisisVentasPage;
