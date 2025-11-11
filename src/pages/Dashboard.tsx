// src/pages/Dashboard.tsx
import React, { useEffect, useState, useRef, useCallback, FC } from 'react';
import { useSharedStore } from '../stores/useSharedStore';
import * as api from '../services/dashboardApi';
import { DashboardData, ContactoDashboard, Accion, TopItem } from '../types';
import { formatCurrency, buildWhatsAppUrl } from '../utils/formatters';
import { Link, useNavigate } from 'react-router-dom';
import { MagnifyingGlassIcon, UserIcon, ArchiveBoxIcon, LightBulbIcon } from '@heroicons/react/24/outline';


// --- Componente de Búsqueda Global ---
const GlobalSearch: FC = () => {
    const [searchTerm, setSearchTerm] = useState('');
    const [results, setResults] = useState<any[]>([]);
    const [isLoading, setIsLoading] = useState(false);
    const [isActive, setIsActive] = useState(false);
    const navigate = useNavigate();
    const searchRef = useRef<HTMLDivElement>(null);
    const debounceTimeout = useRef<number | null>(null);

    const handleSearch = useCallback(async (term: string) => {
        if (term.length < 3) {
            setResults([]);
            return;
        }
        setIsLoading(true);
        try {
            const searchResults = await api.globalSearch(term);
            setResults(searchResults);
        } catch (error) {
            console.error("Error en la búsqueda global:", error);
            setResults([]);
        } finally {
            setIsLoading(false);
        }
    }, []);

    useEffect(() => {
        if (debounceTimeout.current) {
            clearTimeout(debounceTimeout.current);
        }
        debounceTimeout.current = window.setTimeout(() => {
            handleSearch(searchTerm);
        }, 300); // 300ms debounce

        return () => {
            if (debounceTimeout.current) {
                clearTimeout(debounceTimeout.current);
            }
        };
    }, [searchTerm, handleSearch]);

    useEffect(() => {
        const handleClickOutside = (event: MouseEvent) => {
            if (searchRef.current && !searchRef.current.contains(event.target as Node)) {
                setIsActive(false);
            }
        };
        document.addEventListener('mousedown', handleClickOutside);
        return () => {
            document.removeEventListener('mousedown', handleClickOutside);
        };
    }, []);

    const getIconForType = (type: string) => {
        switch (type) {
            case 'Contacto': return <UserIcon className="w-5 h-5 text-primary" />;
            case 'Pedido': return <ArchiveBoxIcon className="w-5 h-5 text-accent" />;
            case 'Presupuesto': return <LightBulbIcon className="w-5 h-5 text-yellow-500" />;
            default: return null;
        }
    };

    const handleResultClick = (item: any) => {
        setIsActive(false);
        setSearchTerm('');
        setResults([]);
        switch (item.entity_type) {
            case 'Contacto':
                navigate(`/cliente/${item.entity_id}`);
                break;
            case 'Pedido':
                navigate(`/pedidos/edit/${item.entity_id}`);
                break;
            case 'Presupuesto':
                navigate(`/oportunidades/edit/${item.entity_id}`);
                break;
        }
    };

    return (
        <div className="relative w-full max-w-xl mx-auto mb-8" ref={searchRef}>
            <div className="relative">
                <MagnifyingGlassIcon className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400 pointer-events-none" />
                <input
                    type="text"
                    placeholder="Buscador universal (Contactos, Pedidos, Presupuestos...)"
                    className="form-input w-full pl-12 pr-4 py-3 rounded-full bg-white shadow-md border-gray-200 focus:ring-primary focus:border-primary"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    onFocus={() => setIsActive(true)}
                />
            </div>
            {isActive && (searchTerm.length > 2) && (
                <div className="absolute top-full mt-2 w-full bg-white rounded-lg shadow-xl border border-gray-200 overflow-hidden z-20">
                    {isLoading ? (
                        <div className="p-4 text-center text-sm text-gray-500">Buscando...</div>
                    ) : results.length > 0 ? (
                        <ul className="max-h-80 overflow-y-auto">
                            {results.map((item, index) => (
                                <li key={`${item.entity_type}-${item.entity_id}-${index}`} 
                                    className="px-4 py-3 hover:bg-gray-100 cursor-pointer border-b last:border-b-0"
                                    onClick={() => handleResultClick(item)}>
                                    <div className="flex items-center gap-3">
                                        <div className="flex-shrink-0">{getIconForType(item.entity_type)}</div>
                                        <div>
                                            <p className="font-semibold text-sm text-gray-800">{item.name}</p>
                                            <p className="text-xs text-gray-500">{item.details}</p>
                                        </div>
                                    </div>
                                </li>
                            ))}
                        </ul>
                    ) : (
                        <div className="p-4 text-center text-sm text-gray-500">No se encontraron resultados.</div>
                    )}
                </div>
            )}
        </div>
    );
};


const AlertCard: FC<{ accion: Accion }> = ({ accion }) => {
    const isCall = accion.tipo_entidad === 'contactos' || accion.tipo_entidad === 'interacciones';
    
    const icon = isCall 
        ? <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" /></svg>
        : <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z" /></svg>

    return (
        <div className="bg-slate-50 p-4 rounded-xl border border-slate-200 flex items-center gap-4">
            <div className="flex-shrink-0 w-12 h-12 rounded-full flex items-center justify-center bg-white shadow-neumorphic-inset">
              {icon}
            </div>
            <div className="flex-grow">
                <p className="font-semibold text-text-main">{accion.regla_nombre}</p>
                <p className="text-sm text-slate-600">{accion.mensaje}</p>
            </div>
            <div className="flex items-center gap-2 flex-shrink-0">
                <Link to={`/cliente/${accion.entidad_id}`} className="btn btn-action-blue text-xs">Ver Ficha</Link>
                {accion.telefono_contacto && (
                    <a href={buildWhatsAppUrl(accion.telefono_contacto, accion.mensaje_whatsapp)} target="_blank" rel="noopener noreferrer" className="btn btn-primary text-xs">
                        Enviar
                    </a>
                )}
            </div>
        </div>
    );
};

const Dashboard: FC = () => {
    const { currentUser, salespeople } = useSharedStore();
    const [dashboardData, setDashboardData] = useState<DashboardData | null>(null);
    const [contactos, setContactos] = useState<ContactoDashboard[]>([]);
    const [acciones, setAcciones] = useState<Accion[]>([]);
    const [topClientes, setTopClientes] = useState<TopItem[]>([]);
    const [topProductos, setTopProductos] = useState<TopItem[]>([]);
    const [selectedVendedorId, setSelectedVendedorId] = useState<string>('');
    const [isLoading, setIsLoading] = useState(true);

    const esAdmin = currentUser?.roles.includes('Superadministrador') || currentUser?.roles.includes('Administracion');

    useEffect(() => {
        const initialVendedorId = currentUser?.vendedorId?.toString() || '';
        
        if (initialVendedorId) {
            setSelectedVendedorId(initialVendedorId);
            loadDashboardForVendedor(initialVendedorId);
        } else if (esAdmin) {
            setIsLoading(false);
        } else {
            setIsLoading(false);
        }
    }, [currentUser, esAdmin]);
    
    const loadDashboardForVendedor = async (vendedorId: string) => {
        if (!vendedorId) {
             setDashboardData(null);
             setContactos([]);
             setAcciones([]);
             setTopClientes([]);
             setTopProductos([]);
             setIsLoading(false);
            return;
        };
        setIsLoading(true);
        try {
            const [data, contactosData, accionesData, topClientesData, topProductosData] = await Promise.all([
                api.getDashboardData(vendedorId),
                api.getVendedorContactos(vendedorId),
                api.getProximasAcciones(vendedorId),
                api.getTopClientes(vendedorId),
                api.getTopProductos(vendedorId),
            ]);
            setDashboardData(data);
            setContactos(contactosData);
            setAcciones(accionesData);
            setTopClientes(topClientesData);
            setTopProductos(topProductosData);
        } catch (error) {
            console.error("Failed to load dashboard data", error);
            setDashboardData(null);
        } finally {
            setIsLoading(false);
        }
    };
    
    const handleVendedorChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
        const newVendedorId = e.target.value;
        setSelectedVendedorId(newVendedorId);
        loadDashboardForVendedor(newVendedorId);
    };

    const renderContent = () => {
        if (isLoading) {
            return <div className="text-center p-8 text-text-secondary">Cargando tablero...</div>;
        }
        if (!dashboardData) {
            if (esAdmin) {
                return <div className="text-center p-8 text-text-secondary">Seleccione un vendedor para supervisar.</div>;
            }
            return <div className="text-center p-8 text-danger">No tienes un perfil de vendedor asignado o no hay datos para mostrar.</div>;
        }

        const d = dashboardData;
        const comisionTeorica = (d.ventas_mes_actual || 0) * ((currentUser?.vendedorData?.porcentaje_comision || 0) / 100);

        return (
            <>
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                    <Link to="/analisis-ventas" className="block bg-white p-6 rounded-2xl shadow-neumorphic border border-slate-200 hover:border-primary hover:shadow-lg transition-all duration-200">
                        <h3 className="text-sm font-bold text-primary uppercase tracking-wider">Ventas del Mes (vs. Meta)</h3>
                        <p className="text-2xl font-bold text-text-main mt-2 truncate">
                            {formatCurrency(d.ventas_mes_actual)} / {formatCurrency(d.meta_ventas)}
                        </p>
                        <div className="w-full bg-slate-200 rounded-full h-2 mt-3">
                            <div className="bg-success h-2 rounded-full" style={{ width: `${d.meta_ventas > 0 ? Math.min(100, (d.ventas_mes_actual / d.meta_ventas) * 100) : 0}%` }}></div>
                        </div>
                        <p className="text-xs text-text-secondary mt-2 text-right">Comisión Teórica: {formatCurrency(comisionTeorica)}</p>
                    </Link>

                    <Link to="/inventario" className="block bg-white p-6 rounded-2xl shadow-neumorphic border border-slate-200 hover:border-primary hover:shadow-lg transition-all duration-200">
                        <h3 className="text-sm font-bold text-primary uppercase tracking-wider">Valor Stock Asignado</h3>
                        <p className="text-3xl font-bold text-primary mt-2 truncate">{formatCurrency(d.valor_stock_asignado)}</p>
                        <p className="text-xs text-primary mt-4 font-semibold">Ver detalle →</p>
                    </Link>
                    
                    <Link to="/comisiones" className="block bg-white p-6 rounded-2xl shadow-neumorphic border border-slate-200 hover:border-primary hover:shadow-lg transition-all duration-200">
                        <h3 className="text-sm font-bold text-primary uppercase tracking-wider">Comisiones por Cobrar</h3>
                        <p className="text-3xl font-bold text-yellow-900 mt-2 truncate">{formatCurrency(d.comisiones_a_pagar_total)}</p>
                        <div className="text-xs text-yellow-800 mt-2 space-y-1">
                            <p>De este mes: <strong>{formatCurrency(d.comisiones_pagar_mes_actual)}</strong></p>
                            <p>Meses ant.: <strong>{formatCurrency(d.comisiones_pagar_meses_anteriores)}</strong></p>
                        </div>
                    </Link>

                    <Link to="/cuenta-corriente" className="block bg-white p-6 rounded-2xl shadow-neumorphic border border-slate-200 hover:border-primary hover:shadow-lg transition-all duration-200">
                        <h3 className="text-sm font-bold text-primary uppercase tracking-wider">Deuda Total en la Calle</h3>
                        <p className="text-3xl font-bold text-danger mt-2 truncate">{formatCurrency(d.total_por_cobrar_clientes)}</p>
                    </Link>
                </div>

                 <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-10">
                    <div className="lg:col-span-2 bg-white p-6 rounded-2xl shadow-neumorphic">
                        <h2 className="text-xl font-bold mb-4">Alertas Inteligentes y Próximas Acciones</h2>
                        <div className="space-y-4 max-h-[60vh] overflow-y-auto pr-2">
                            {acciones.length > 0 ? acciones.map((accion, i) => <AlertCard key={`${accion.entidad_id}-${i}`} accion={accion} />) : <p className="text-center text-text-secondary py-4">¡Todo en orden!</p>}
                        </div>
                    </div>
                    <div className="lg:col-span-1 bg-white p-6 rounded-2xl shadow-neumorphic">
                         <h2 className="text-xl font-bold text-center mb-6">Cartera de Profesionales</h2>
                         <div className="space-y-3 max-h-[60vh] overflow-y-auto pr-2">
                            {contactos.map(c => (
                                <div key={c.id} className="p-3 border border-slate-200 rounded-lg hover:bg-slate-50 transition-colors">
                                    <Link to={`/cliente/${c.id}`} className="font-semibold text-primary hover:underline">{c.nombre}</Link>
                                    <p className="text-sm text-text-secondary">Desde: {formatCurrency(c.deuda_actual || 0)}</p>
                                </div>
                            ))}
                         </div>
                    </div>
                 </div>

                 <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    <div className="bg-white p-6 rounded-2xl shadow-neumorphic">
                        <h2 className="text-xl font-bold mb-4">Top 10 Clientes por Compras</h2>
                        <div className="space-y-2 max-h-[60vh] overflow-y-auto pr-2">
                            {topClientes.map((cliente, index) => (
                                <div key={index} className="flex justify-between items-center p-2 border-b border-slate-100">
                                    <span className="text-text-secondary">{index + 1}. {cliente.nombre}</span>
                                    <span className="font-semibold text-primary">{formatCurrency(cliente.valor)}</span>
                                </div>
                            ))}
                        </div>
                    </div>
                    <div className="bg-white p-6 rounded-2xl shadow-neumorphic">
                        <h2 className="text-xl font-bold mb-4">Top 10 Productos más Vendidos</h2>
                         <div className="space-y-2 max-h-[60vh] overflow-y-auto pr-2">
                            {topProductos.map((producto, index) => (
                                <div key={index} className="flex justify-between items-center p-2 border-b border-slate-100">
                                    <span className="text-text-secondary">{index + 1}. {producto.nombre}</span>
                                    <span className="font-semibold text-primary">{producto.valor} unid.</span>
                                </div>
                            ))}
                        </div>
                    </div>
                 </div>
            </>
        );
    }

    return (
        <div>
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center mb-8">
                <h1 className="text-3xl font-bold">Dashboard</h1>
                {esAdmin && (
                    <div className="mt-4 md:mt-0">
                        <select onChange={handleVendedorChange} value={selectedVendedorId} className="form-input w-full md:w-64">
                            <option value="">-- Supervisar Vendedor --</option>
                            {salespeople.map(v => <option key={v.id} value={v.id}>{v.perfiles.nombre}</option>)}
                        </select>
                    </div>
                )}
            </div>
            <GlobalSearch />
            {renderContent()}
        </div>
    );
};

export default Dashboard;
