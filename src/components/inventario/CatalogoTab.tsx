// src/components/inventario/CatalogoTab.tsx
import { useEffect, useState, useMemo } from 'react';
import { useInventarioStore } from '../../stores/useInventarioStore';
import { Product } from '../../types';
import { can } from '../../utils/permissions';
import { exportToCSV } from '../../utils/fileExport';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface CatalogoTabProps {
    onEditProduct: (productId: number) => void;
    onCreateProduct: () => void;
}

const SortIcon = ({ direction }: { direction?: 'ascending' | 'descending' }) => {
    if (!direction) return <span className="text-gray-400">↕</span>;
    return <span className="ml-1">{direction === 'ascending' ? '▲' : '▼'}</span>;
};

const CatalogoTab = ({ onEditProduct, onCreateProduct }: CatalogoTabProps) => {
    const { products, isLoading, fetchProducts } = useInventarioStore();
    const { modalProps, showMessage } = useActionModal();
    const [searchTerm, setSearchTerm] = useState('');
    const [lineFilter, setLineFilter] = useState('');
    const [sortConfig, setSortConfig] = useState<{ key: keyof Product, direction: 'ascending' | 'descending' }>({ key: 'nombre', direction: 'ascending' });

    const canCreate = can('productos:crear');
    const canEdit = can('productos:editar');

    useEffect(() => {
        fetchProducts();
    }, [fetchProducts]);

    const lines = useMemo(() => {
        return [...new Set(products.map(p => p.linea_marca).filter(Boolean))].sort();
    }, [products]);

    const filteredAndSortedProducts = useMemo(() => {
        let filtered = [...products];
        if (searchTerm) {
            filtered = filtered.filter(p => 
                p.nombre.toLowerCase().includes(searchTerm.toLowerCase()) ||
                (p.sku && p.sku.toLowerCase().includes(searchTerm.toLowerCase()))
            );
        }
        if (lineFilter) {
            filtered = filtered.filter(p => p.linea_marca === lineFilter);
        }

        filtered.sort((a, b) => {
            const valA = a[sortConfig.key];
            const valB = b[sortConfig.key];
            if (valA === null || valA === undefined) return 1;
            if (valB === null || valB === undefined) return -1;

            const aValue = typeof valA === 'string' ? valA.toLowerCase() : valA;
            const bValue = typeof valB === 'string' ? valB.toLowerCase() : valB;

            if (aValue < bValue) return sortConfig.direction === 'ascending' ? -1 : 1;
            if (aValue > bValue) return sortConfig.direction === 'ascending' ? 1 : -1;
            return 0;
        });

        return filtered;
    }, [products, searchTerm, lineFilter, sortConfig]);
    
    const handleSort = (key: keyof Product) => {
        setSortConfig(prev => ({
            key,
            direction: prev.key === key && prev.direction === 'ascending' ? 'descending' : 'ascending'
        }));
    };

    const handleExport = () => {
        if (filteredAndSortedProducts.length === 0) {
            showMessage('Sin datos', 'No hay productos para exportar con los filtros actuales.');
            return;
        }
        exportToCSV(
            ["ID", "Nombre", "SKU", "Línea/Marca"],
            filteredAndSortedProducts.map(p => [p.id, p.nombre, p.sku, p.linea_marca]),
            `catalogo_productos_${new Date().toISOString().split('T')[0]}.csv`
        );
    };

    return (
        <>
        <div className="space-y-6">
            <div className="bg-white p-6 rounded-lg shadow-md">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label htmlFor="search-product" className="form-label">Buscar por Nombre o SKU</label>
                        <input type="text" id="search-product" value={searchTerm} onChange={e => setSearchTerm(e.target.value)} className="form-input" placeholder="Escriba para buscar..." />
                    </div>
                    <div>
                        <label htmlFor="filter-line" className="form-label">Filtrar por Línea</label>
                        <select id="filter-line" value={lineFilter} onChange={e => setLineFilter(e.target.value)} className="form-input">
                            <option value="">Todas las líneas</option>
                            {/* Fix: Explicitly type 'line' as string to resolve TypeScript inference error. */}
                            {lines.map((line: string) => <option key={line} value={line}>{line}</option>)}
                        </select>
                    </div>
                </div>
            </div>

            <div className="bg-white p-6 rounded-lg shadow-md">
                <div className="flex justify-between items-center mb-4">
                    <h2 className="text-xl font-semibold">Catálogo Completo ({filteredAndSortedProducts.length})</h2>
                    <div className="flex items-center gap-2">
                        <button onClick={handleExport} className="btn btn-secondary hidden md:inline-flex items-center gap-2">
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path></svg>
                            Exportar
                        </button>
                        {canCreate && <button onClick={onCreateProduct} className="btn btn-primary">Crear Producto</button>}
                    </div>
                </div>
                <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                        <thead className="text-xs uppercase bg-gray-50">
                            <tr>
                                <th className="px-6 py-3 cursor-pointer" onClick={() => handleSort('nombre')}>Nombre <SortIcon direction={sortConfig.key === 'nombre' ? sortConfig.direction : undefined} /></th>
                                <th className="px-6 py-3 cursor-pointer" onClick={() => handleSort('linea_marca')}>Línea <SortIcon direction={sortConfig.key === 'linea_marca' ? sortConfig.direction : undefined} /></th>
                                <th className="px-6 py-3 cursor-pointer" onClick={() => handleSort('sku')}>SKU <SortIcon direction={sortConfig.key === 'sku' ? sortConfig.direction : undefined} /></th>
                                <th className="px-6 py-3 cursor-pointer text-center" onClick={() => handleSort('stock_total')}>Stock Total <SortIcon direction={sortConfig.key === 'stock_total' ? sortConfig.direction : undefined} /></th>
                            </tr>
                        </thead>
                        <tbody>
                            {isLoading && <tr><td colSpan={4} className="text-center p-4">Cargando...</td></tr>}
                            {!isLoading && filteredAndSortedProducts.length === 0 && <tr><td colSpan={4} className="text-center p-4">No se encontraron productos.</td></tr>}
                            {!isLoading && filteredAndSortedProducts.map(p => (
                                <tr key={p.id} className="border-b hover:bg-gray-50">
                                    <td className={`px-6 py-4 font-medium ${canEdit ? 'text-primary hover:underline cursor-pointer' : ''}`} onClick={() => canEdit && onEditProduct(p.id)}>{p.nombre}</td>
                                    <td className="px-6 py-4">{p.linea_marca || 'N/A'}</td>
                                    <td className="px-6 py-4">{p.sku || 'N/A'}</td>
                                    <td className="px-6 py-4 text-center font-semibold">{p.stock_total || 0}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default CatalogoTab;
