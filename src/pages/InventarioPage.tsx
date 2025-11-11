// src/pages/InventarioPage.tsx
import { useEffect, useState } from 'react';
import { can } from '../utils/permissions';
import { useSharedStore } from '../stores/useSharedStore';

// Importar los nuevos componentes de las pestañas
import CatalogoTab from '../components/inventario/CatalogoTab';
import GestionTab from '../components/inventario/GestionTab';
import MovimientosTab from '../components/inventario/MovimientosTab';
import AuditoriaTab from '../components/inventario/AuditoriaTab';

// Importar los modales funcionales
import ProductModal from '../components/inventario/ProductModal';
import AjusteStockModal from '../components/inventario/AjusteStockModal';
import KardexModal from '../components/inventario/KardexModal';

type ModalState = {
    product: { isOpen: boolean, productId: number | null };
    ajuste: { isOpen: boolean, productId: number | null, productName: string | null };
    kardex: { isOpen: boolean, loteId: number | null };
};

const TABS = [
    { id: 'catalogo', label: 'Catálogo de Productos' },
    { id: 'gestion', label: 'Gestión y Asignación' },
    { id: 'movimientos', label: 'Movimientos de Stock' },
    { id: 'auditoria', label: 'Auditoría de Stock' },
];

const InventarioPage = () => {
    const [activeTab, setActiveTab] = useState('catalogo');
    const { fetchSharedData } = useSharedStore();

    const [modalState, setModalState] = useState<ModalState>({
        product: { isOpen: false, productId: null },
        ajuste: { isOpen: false, productId: null, productName: null },
        kardex: { isOpen: false, loteId: null },
    });

    useEffect(() => {
        fetchSharedData();
    }, [fetchSharedData]);
    
    const renderVendedorView = () => (
        <CatalogoTab onEditProduct={() => {}} onCreateProduct={() => {}} />
    );
    
    const renderAdminView = () => (
        <>
            <div className="mb-6">
                <div className="bg-gray-100 p-1.5 rounded-lg flex flex-wrap gap-2">
                    {TABS.map(tab => (
                        <button 
                            key={tab.id}
                            onClick={() => setActiveTab(tab.id)} 
                            className={`flex-1 py-2 px-4 text-sm font-semibold rounded-md transition-colors duration-200 ${
                                activeTab === tab.id 
                                ? 'bg-white shadow text-primary' 
                                : `text-gray-600 hover:bg-gray-200 ${tab.id === 'auditoria' ? 'hover:text-red-600' : 'hover:text-primary'}`
                            }`}
                        >
                            {tab.label}
                        </button>
                    ))}
                </div>
            </div>
            <div>
                {activeTab === 'catalogo' && <CatalogoTab 
                    onEditProduct={(id) => setModalState(s => ({ ...s, product: { isOpen: true, productId: id }}))}
                    onCreateProduct={() => setModalState(s => ({ ...s, product: { isOpen: true, productId: null }}))}
                />}
                {activeTab === 'gestion' && <GestionTab 
                    onAdjustStock={(productId, productName) => setModalState(s => ({ ...s, ajuste: { isOpen: true, productId, productName }}))}
                />}
                {activeTab === 'movimientos' && <MovimientosTab />}
                {activeTab === 'auditoria' && <AuditoriaTab 
                    onViewKardex={(loteId) => setModalState(s => ({ ...s, kardex: { isOpen: true, loteId }}))}
                    onAdjustStock={(productId, productName) => setModalState(s => ({ ...s, ajuste: { isOpen: true, productId, productName }}))}
                />}
            </div>
        </>
    );

    return (
        <div>
            <h1 className="text-3xl font-bold text-gray-800 mb-4">Centro de Mando de Inventario</h1>
            
            {can('stock:ver:general') ? renderAdminView() : renderVendedorView()}

            <ProductModal 
                isOpen={modalState.product.isOpen}
                productId={modalState.product.productId}
                onClose={() => setModalState(s => ({ ...s, product: { isOpen: false, productId: null }}))}
            />
            <AjusteStockModal 
                isOpen={modalState.ajuste.isOpen}
                productId={modalState.ajuste.productId}
                productName={modalState.ajuste.productName}
                onClose={() => setModalState(s => ({ ...s, ajuste: { isOpen: false, productId: null, productName: null }}))}
            />
            <KardexModal 
                isOpen={modalState.kardex.isOpen}
                loteId={modalState.kardex.loteId}
                onClose={() => setModalState(s => ({ ...s, kardex: { isOpen: false, loteId: null }}))}
            />
        </div>
    );
};

export default InventarioPage;