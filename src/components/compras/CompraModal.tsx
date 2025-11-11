// src/components/compras/CompraModal.tsx
import React, { useState, useEffect, useMemo } from 'react';
import { useCompraStore } from '../../stores/useCompraStore';
import { useSharedStore } from '../../stores/useSharedStore';
import { Compra } from '../../types';
import { formatCurrency } from '../../utils/formatters';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface CompraProduct {
    producto_id: number;
    nombre: string;
    cantidad: number;
    costo_unitario: number;
}

interface CompraModalProps {
    isOpen: boolean;
    onClose: () => void;
    compra: Compra | null;
}

const CompraModal = ({ isOpen, onClose, compra }: CompraModalProps) => {
    const { saveCompra } = useCompraStore();
    const { providers, products, depositos } = useSharedStore();
    const { modalProps, showMessage, hideModal } = useActionModal();

    const [formData, setFormData] = useState<Partial<Compra>>({});
    const [currentProducts, setCurrentProducts] = useState<CompraProduct[]>([]);
    const [isSaving, setIsSaving] = useState(false);
    
    useEffect(() => {
        if (compra) {
            setFormData({
                id: compra.id,
                proveedor_id: compra.proveedor_id,
                deposito_id: compra.deposito_id,
                fecha_emision: new Date(compra.fecha_emision || Date.now()).toISOString().split('T')[0],
                fecha_recepcion_prevista: compra.fecha_recepcion_prevista ? new Date(compra.fecha_recepcion_prevista).toISOString().split('T')[0] : '',
            });
            setCurrentProducts(compra.productos as CompraProduct[] || []);
        } else {
            setFormData({
                fecha_emision: new Date().toISOString().split('T')[0],
                deposito_id: depositos[0]?.id
            });
            setCurrentProducts([]);
        }
    }, [compra, depositos]);

    const totalValue = useMemo(() => {
        return currentProducts.reduce((sum, p) => sum + (p.cantidad * p.costo_unitario), 0);
    }, [currentProducts]);

    const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const handleAddProduct = () => {
        const productSelect = document.getElementById('po-product-select') as HTMLSelectElement;
        const costInput = document.getElementById('po-product-cost') as HTMLInputElement;
        const quantityInput = document.getElementById('po-product-quantity') as HTMLInputElement;

        const productId = parseInt(productSelect.value, 10);
        const cost = parseFloat(costInput.value);
        const quantity = parseInt(quantityInput.value, 10);

        if (!productId || isNaN(cost) || isNaN(quantity) || quantity <= 0) {
            showMessage('Datos incompletos', 'Por favor, complete todos los campos del producto.');
            return;
        }

        const product = products.find(p => p.id === productId);
        if (!product) return;

        const newProduct: CompraProduct = {
            producto_id: productId,
            nombre: product.nombre,
            cantidad: quantity,
            costo_unitario: cost,
        };

        setCurrentProducts(prev => [...prev, newProduct]);
        productSelect.value = '';
        costInput.value = '';
        quantityInput.value = '1';
    };
    
    const handleRemoveProduct = (index: number) => {
        setCurrentProducts(prev => prev.filter((_, i) => i !== index));
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setIsSaving(true);
        try {
            await saveCompra({
                ...formData,
                estado: 'Borrador',
                productos: currentProducts,
                total_compra: totalValue,
            });
            onClose();
        } catch (error) {
            console.error("Failed to save purchase order:", error);
            showMessage('Error', 'No se pudo guardar la orden de compra.', [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' },
            ]);
        } finally {
            setIsSaving(false);
        }
    };

    if (!isOpen) return null;

    return (
    <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center p-4">
        <div className="bg-white rounded-lg shadow-xl w-full max-w-4xl max-h-[90vh] flex flex-col">
            <div className="p-4 border-b flex justify-between items-center">
                <h2 className="text-xl font-semibold">{compra ? `Editar OC-${String(compra.id).padStart(5, '0')}` : 'Crear Orden de Compra'}</h2>
                <button onClick={onClose} className="text-3xl font-light text-gray-500 hover:text-gray-800">&times;</button>
            </div>
            <form onSubmit={handleSubmit} id="compra-form-modal" className="flex-grow overflow-y-auto p-6 space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div><label htmlFor="proveedor_id" className="form-label">Proveedor</label><select name="proveedor_id" id="proveedor_id" className="form-input" value={formData.proveedor_id || ''} onChange={handleChange} required><option value="">Seleccionar...</option>{providers.map(p => <option key={p.id} value={p.id}>{p.nombre}</option>)}</select></div>
                    <div><label htmlFor="deposito_id" className="form-label">Depósito Destino</label><select name="deposito_id" id="deposito_id" className="form-input" value={formData.deposito_id || ''} onChange={handleChange}><option value="">Seleccionar...</option>{depositos.map(d => <option key={d.id} value={d.id}>{d.nombre}</option>)}</select></div>
                    <div><label htmlFor="fecha_emision" className="form-label">Fecha Emisión</label><input type="date" name="fecha_emision" id="fecha_emision" value={formData.fecha_emision || ''} onChange={handleChange} className="form-input" /></div>
                    <div><label htmlFor="fecha_recepcion_prevista" className="form-label">Fecha Recepción Prevista</label><input type="date" name="fecha_recepcion_prevista" id="fecha_recepcion_prevista" value={formData.fecha_recepcion_prevista || ''} onChange={handleChange} className="form-input" /></div>
                </div>

                <div className="bg-gray-50 p-4 rounded-lg border">
                    <h3 className="font-semibold mb-2 text-gray-700">Añadir Productos</h3>
                    <div className="grid grid-cols-1 md:grid-cols-12 gap-2 items-end">
                        <div className="md:col-span-5"><label htmlFor="po-product-select" className="form-label">Producto</label><select id="po-product-select" className="form-input"><option value="">Seleccionar...</option>{products.map(p => <option key={p.id} value={p.id}>{p.nombre}</option>)}</select></div>
                        <div className="md:col-span-2"><label htmlFor="po-product-cost" className="form-label">Costo</label><input type="number" id="po-product-cost" className="form-input" placeholder="0.00" step="0.01"/></div>
                        <div className="md:col-span-2"><label htmlFor="po-product-quantity" className="form-label">Cantidad</label><input type="number" id="po-product-quantity" className="form-input" defaultValue="1" min="1" /></div>
                        <div className="md:col-span-3"><button type="button" onClick={handleAddProduct} className="btn btn-secondary w-full">Añadir</button></div>
                    </div>
                </div>

                <div>
                    <h3 className="font-semibold mb-2">Productos en la Orden</h3>
                    <div className="overflow-x-auto border rounded-lg">
                    <table className="w-full text-sm">
                        <thead className="bg-gray-50"><tr><th className="p-2 text-left">Producto</th><th className="p-2 text-center">Cantidad</th><th className="p-2 text-right">Costo Unit.</th><th className="p-2 text-right">Subtotal</th><th className="p-2 text-center">Acción</th></tr></thead>
                        <tbody>
                        {currentProducts.length === 0 && (<tr><td colSpan={5} className="text-center p-4 text-gray-500">No hay productos añadidos.</td></tr>)}
                        {currentProducts.map((p, i) => (
                            <tr key={`${p.producto_id}-${i}`} className="border-t">
                            <td className="p-2">{p.nombre}</td>
                            <td className="p-2 text-center">{p.cantidad}</td>
                            <td className="p-2 text-right">{formatCurrency(p.costo_unitario)}</td>
                            <td className="p-2 text-right">{formatCurrency(p.cantidad * p.costo_unitario)}</td>
                            <td className="p-2 text-center"><button type="button" onClick={() => handleRemoveProduct(i)} className="text-red-500 hover:text-red-700 text-xl font-bold">&times;</button></td>
                            </tr>
                        ))}
                        </tbody>
                    </table>
                    </div>
                </div>
            </form>
            <div className="p-4 border-t flex justify-between items-center">
                <div><span className="font-bold">TOTAL:</span><span className="text-xl font-bold ml-2">{formatCurrency(totalValue)}</span></div>
                <div className="flex gap-2">
                    <button type="button" onClick={onClose} className="btn btn-secondary">Cancelar</button>
                    <button type="submit" form="compra-form-modal" className="btn btn-primary" disabled={isSaving}>{isSaving ? 'Guardando...' : 'Guardar Borrador'}</button>
                </div>
            </div>
        </div>
        <ActionModal {...modalProps} />
    </div>
  );
};

export default CompraModal;
