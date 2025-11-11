// src/pages/AprobacionesPage.tsx
import { useEffect, useMemo } from 'react';
import { useOpportunityStore } from '../stores/useOpportunityStore';
import { useSharedStore } from '../stores/useSharedStore';
import { can } from '../utils/permissions';
import { formatCurrency } from '../utils/formatters';

const AprobacionesPage = () => {
    const { opportunities, isLoading, fetchOpportunities } = useOpportunityStore();
    const { currentUser, salesStages } = useSharedStore();

    useEffect(() => {
        if (opportunities.length === 0) {
            fetchOpportunities();
        }
    }, [opportunities, fetchOpportunities]);

    const puedeResolver = can('solicitudes:resolver');

    const solicitudesPendientes = useMemo(() => {
        const pendingStage = salesStages.find(s => s.nombre === 'Pendiente de Aprobación');
        if (!pendingStage) return [];
        
        let filtered = opportunities.filter(op => op.etapa_id === pendingStage.id);

        if (!puedeResolver && currentUser?.vendedorId) {
            filtered = filtered.filter(op => op.vendedor_id === currentUser.vendedorId);
        }

        return filtered;
    }, [opportunities, puedeResolver, currentUser, salesStages]);

    const renderManagerView = () => {
        return (
            <div>
                <p className="text-sm text-gray-600 mb-4">
                    Las solicitudes de descuento se envían por WhatsApp para su aprobación remota. Esta pantalla muestra un resumen de las que están pendientes.
                </p>
                <div className="bg-white p-6 rounded-lg shadow-md">
                    {solicitudesPendientes.length === 0 ? (
                         <p className="text-center text-gray-500 py-8">No hay solicitudes pendientes de aprobación.</p>
                    ) : (
                        <div className="overflow-x-auto">
                            <table className="w-full text-sm">
                                <thead className="text-left bg-gray-50">
                                    <tr>
                                        <th className="p-2">Presup. N°</th>
                                        <th className="p-2">Vendedor</th>
                                        <th className="p-2">Cliente</th>
                                        <th className="p-2">Justificación</th>
                                        <th className="p-2 text-right">Valor Solicitado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {solicitudesPendientes.map(opp => {
                                        const productoConSolicitud = opp.productos.find(p => p.datos_solicitud);
                                        const justificacion = productoConSolicitud?.datos_solicitud?.justificacion || 'N/A';

                                        return (
                                            <tr key={opp.id} className="border-b">
                                                <td className="p-2 font-semibold">{String(opp.numero_propuesta || '').padStart(4, '0')}</td>
                                                <td className="p-2">{opp.vendedores?.perfiles?.nombre || 'N/A'}</td>
                                                <td className="p-2">{opp.contactos?.nombre || 'N/A'}</td>
                                                <td className="p-2 text-xs italic">"{justificacion}"</td>
                                                <td className="p-2 text-right font-bold text-primary">{formatCurrency(opp.valor)}</td>
                                            </tr>
                                        );
                                    })}
                                </tbody>
                            </table>
                        </div>
                    )}
                </div>
            </div>
        );
    }
    
     const renderSalespersonView = () => (
        <div className="p-8 bg-white rounded-2xl shadow-neumorphic">
            <h2 className="text-xl font-semibold mb-2">Mis Solicitudes Pendientes</h2>
            <p className="text-sm text-gray-600 mb-4">
                Aquí puedes ver un resumen de tus solicitudes de precio que aún no han sido resueltas por un gerente.
            </p>
            {solicitudesPendientes.length === 0 ? (
                <p className="text-center text-gray-500 py-8">No tienes solicitudes pendientes.</p>
            ) : (
                <ul className="space-y-3">
                    {solicitudesPendientes.map(opp => (
                         <li key={opp.id} className="p-3 border rounded-lg bg-yellow-50">
                            <p className="font-semibold">Presupuesto N°{opp.numero_propuesta}: {opp.nombre}</p>
                            <p className="text-sm text-gray-700">Cliente: {opp.contactos?.nombre}</p>
                         </li>
                    ))}
                </ul>
            )}
        </div>
    );


    if (isLoading) {
        return <div>Cargando solicitudes...</div>
    }

    return (
        <div>
            <h1 className="text-3xl font-bold mb-6">Aprobaciones</h1>
            {puedeResolver ? renderManagerView() : renderSalespersonView()}
        </div>
    );
};

export default AprobacionesPage;
