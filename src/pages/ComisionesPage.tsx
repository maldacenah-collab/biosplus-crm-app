// src/pages/ComisionesPage.tsx
import { useEffect, useState } from 'react';
import { useComisionesStore } from '../stores/useComisionesStore';
import { useSharedStore } from '../stores/useSharedStore';
import { can } from '../utils/permissions';
import ComisionesGlobalView from '../components/comisiones/ComisionesGlobalView';
import ComisionesDetailView from '../components/comisiones/ComisionesDetailView';

const ComisionesPage = () => {
    const { currentUser } = useSharedStore();
    const [view, setView] = useState<'global' | 'detail'>('global');
    const [selectedVendedorId, setSelectedVendedorId] = useState<number | null>(null);

    const esAdmin = can('comisiones:ver:todas');

    useEffect(() => {
        if (!esAdmin && currentUser?.vendedorId) {
            setSelectedVendedorId(currentUser.vendedorId);
            setView('detail');
        } else {
            setView('global');
        }
    }, [esAdmin, currentUser]);

    const handleSelectVendedor = (vendedorId: number) => {
        setSelectedVendedorId(vendedorId);
        setView('detail');
    };
    
    const handleBack = () => {
        setSelectedVendedorId(null);
        setView('global');
    };

    return (
        <div>
            <h1 className="text-3xl font-bold text-gray-800 mb-6">Liquidación de Comisiones</h1>
            {view === 'global' && esAdmin ? (
                <ComisionesGlobalView onSelectVendedor={handleSelectVendedor} />
            ) : selectedVendedorId ? (
                <ComisionesDetailView vendedorId={selectedVendedorId} onBack={esAdmin ? handleBack : undefined} />
            ) : (
                <div className="text-center p-8">No tienes un perfil de vendedor asignado.</div>
            )}
        </div>
    );
};

export default ComisionesPage;