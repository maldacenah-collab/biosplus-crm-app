// src/components/inventario/ProductModal.tsx
// Fix: Import React to resolve "Cannot find namespace 'React'" error.
import React, { useEffect, useState } from 'react';
import { useInventarioStore } from '../../stores/useInventarioStore';
import { useSharedStore } from '../../stores/useSharedStore';
import { Product, PriceTier, Lote } from '../../types';
import * as api from '../../services/inventarioApi';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface ProductModalProps {
  isOpen: boolean;
  productId: number | null;
  onClose: () => void;
}

const ProductModal = ({ isOpen, productId, onClose }: ProductModalProps) => {
    const [isLoading, setIsLoading] = useState(true);
    const { refreshAll } = useInventarioStore();
    const { depositos } = useSharedStore();
    const [activeTab, setActiveTab] = useState('info');
    const [productData, setProductData] = useState<Partial<Product>>({});
    const [lotes, setLotes] = useState<Lote[]>([]);
    const [priceTiers, setPriceTiers] = useState<PriceTier[]>([]);

    const [newLotes, setNewLotes] = useState<Partial<Lote>[]>([]);
    // State for lot inputs
    const [loteNumber, setLoteNumber] = useState('');
    const [loteQuantity, setLoteQuantity] = useState('');

    const [loteExpiry, setLoteExpiry] = useState('');
    // State for tier inputs
    const [tierQuantity, setTierQuantity] = useState('');

    const [tierPrice, setTierPrice] = useState('');
    const { modalProps, showMessage, hideModal } = useActionModal();

    useEffect(() => {
        if (isOpen) {
            setIsLoading(true);
            if (productId) {
                const loadDetails = async () => {
                    try {
                        const details = await api.getProductDetails(productId);
                        setProductData(details);
                        setLotes(details.lotes || []);
                        setPriceTiers(details.precios_escalonados || []);
                    } finally {
                        setIsLoading(false);
                    }
                };
                loadDetails();
            } else {
                setProductData({});
                setLotes([]);
                setPriceTiers([]);
                setIsLoading(false);
            }
            setActiveTab('info');
            setNewLotes([]);
            setLoteNumber('');
            setLoteQuantity('');
            setLoteExpiry('');
            setTierQuantity('');
            setTierPrice('');
        }
    }, [isOpen, productId]);

    const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
        const { name, value, type } = e.target;
        const checked = (e.target as HTMLInputElement).checked;
        setProductData(prev => ({ ...prev, [name]: type === 'checkbox' ? checked : value }));
    };

    const handleAddLoteToList = () => {
        const quantity = parseInt(loteQuantity);
        if (!loteNumber.trim() || isNaN(quantity) || quantity <= 0) {
            showMessage('Datos inválidos', 'Por favor, ingrese un número de lote y una cantidad inicial válida.', [
                { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
            ]);
            return;
        }

        const newLote: Partial<Lote> = {
            numero_lote: loteNumber.trim(),
            cantidad_inicial: quantity,
            stock_disponible: quantity,
            fecha_vencimiento: loteExpiry || undefined,
        };

        setNewLotes(prev => [...prev, newLote]);
        setLoteNumber('');
        setLoteQuantity('');
        setLoteExpiry('');
    };

    const handleAddPriceTier = () => {
        const quantity = parseInt(tierQuantity);
        const price = parseFloat(tierPrice);
        if (!quantity || !price || quantity < 1 || price < 0) {
            showMessage('Datos inválidos', 'Por favor, introduce una cantidad y un precio válidos.', [
                { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
            ]);
            return;
        }
        const updatedTiers = [...priceTiers, { cantidad: quantity, precio: price }];
        updatedTiers.sort((a, b) => a.cantidad - b.cantidad);
        setPriceTiers(updatedTiers);
        setTierQuantity('');
        setTierPrice('');
    };

    const handleSave = async () => {
        try {
            const dataToSave = {
                ...productData,
                precio_base: parseFloat(String(productData.precio_base)) || 0,
                precios_escalonados: priceTiers,
            };
            const savedProduct = await api.upsertProduct(dataToSave);

            if (newLotes.length > 0) {
                const lotesToInsert = newLotes.map(lote => ({
                    ...lote,
                    producto_id: savedProduct.id,
                }));
                await api.addLotes(lotesToInsert);
            }

            await refreshAll();
            setIsLoading(true);
            onClose();
        } catch (error) {
            console.error("Error saving product:", error);
            showMessage('Error', 'No se pudo guardar el producto.', [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
            ]);
        }
    };
    
    if (!isOpen) return null;

    if (isLoading) return <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center"><div className="text-white">Cargando...</div></div>;

    return (
        <>
        <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center p-4">
            <div className="bg-white rounded-lg shadow-xl w-full max-w-4xl flex flex-col max-h-[95vh]">
                <div className="p-4 border-b flex justify-between items-center">
                    <h3 className="text-xl font-semibold">{productId ? 'Editar Producto' : 'Crear Producto'}</h3>
                    <button onClick={ () => { setIsLoading(true); onClose(); }}>&times;</button>
                </div>
                <div className="flex-grow overflow-y-auto p-6">
                    {isLoading ? (
                        <div className="flex items-center justify-center h-48 text-gray-500 text-lg">Cargando...</div>
                    ) : (
                    <>
                    <div className="border-b mb-4">
                        <nav className="-mb-px flex space-x-8">
                            {['info', 'lotes', 'precios'].map(tab => (
                                <button key={tab} onClick={() => setActiveTab(tab)} className={`capitalize whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm ${activeTab === tab ? 'border-primary text-primary' : 'border-transparent text-gray-500 hover:text-gray-700'}`}>
                                    {tab === 'info' ? 'Info. General' : tab === 'lotes' ? 'Lotes y Stock' : 'Precios'}
                                </button>
                            ))}
                        </nav>
                    </div>
                    {activeTab === 'info' && (
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                             <div><label className="form-label">Nombre del Producto</label><input name="nombre" value={productData.nombre || ''} onChange={handleChange} className="form-input" /></div>
                            <div><label className="form-label">SKU</label><input name="sku" value={productData.sku || ''} onChange={handleChange} className="form-input" /></div>
                            <div><label className="form-label">Línea / Marca</label><input name="linea_marca" value={productData.linea_marca || ''} onChange={handleChange} className="form-input" /></div>
                            <div><label className="form-label">Categoría</label><input name="categoria" value={productData.categoria || ''} onChange={handleChange} className="form-input" /></div>
                            <div><label className="form-label">Origen</label><input name="origen" value={productData.origen || ''} onChange={handleChange} className="form-input" /></div>
                            <div><label className="form-label">Presentación</label><input name="presentacion" value={productData.presentacion || ''} onChange={handleChange} className="form-input" /></div>
                            <div className="md:col-span-2"><label className="form-label">Composición</label><textarea name="composicion" value={productData.composicion || ''} onChange={handleChange} className="form-input" rows={2}></textarea></div>
                            <div><label className="form-label">Depósito por Defecto</label><select name="deposito_default_id" value={productData.deposito_default_id || ''} onChange={handleChange} className="form-input"><option value="">Ninguno</option>{depositos.map(d => <option key={d.id} value={d.id}>{d.nombre}</option>)}</select></div>
                        </div>
                    )}
                    {activeTab === 'lotes' && (
                        <div className="space-y-6">
                            <fieldset className="border p-4 rounded-lg bg-gray-50">
                                <legend className="px-2 font-semibold">Añadir Nuevos Lotes a la Lista</legend>
                                <div className="grid grid-cols-1 md:grid-cols-4 gap-4 items-end pt-2">
                                    <div className="md:col-span-2"><label htmlFor="lote-number" className="form-label">N° de Lote</label><input type="text" id="lote-number" value={loteNumber} onChange={e => setLoteNumber(e.target.value)} className="form-input" /></div>
                                    <div><label htmlFor="lote-quantity" className="form-label">Cantidad</label><input type="number" id="lote-quantity" value={loteQuantity} onChange={e => setLoteQuantity(e.target.value)} className="form-input" /></div>
                                    <div><label htmlFor="lote-expiry" className="form-label">Vencimiento</label><input type="date" id="lote-expiry" value={loteExpiry} onChange={e => setLoteExpiry(e.target.value)} className="form-input" /></div>
                                </div>
                                <div className="text-right mt-4"><button type="button" onClick={handleAddLoteToList} className="btn btn-secondary">Añadir Lote a la Lista</button></div>
                            </fieldset>
                            
                            {newLotes.length > 0 && (
                                <div>
                                    <h4 className="font-semibold">Lotes Nuevos (pendientes de guardar)</h4>
                                    <div className="overflow-x-auto border rounded-lg mt-2"><table className="w-full text-sm"><thead className="bg-gray-100"><tr><th className="p-2 text-left">Lote</th><th className="p-2 text-left">Vencimiento</th><th className="p-2 text-right">Cantidad</th><th className="p-2 text-center">Acción</th></tr></thead><tbody>{newLotes.map((lote, index) => (<tr key={index} className="border-t"><td className="p-2">{lote.numero_lote}</td><td className="p-2">{lote.fecha_vencimiento || 'N/A'}</td><td className="p-2 text-right">{lote.cantidad_inicial}</td><td className="p-2 text-center"><button onClick={() => setNewLotes(current => current.filter((_, i) => i !== index))} className="text-red-500 text-xs">Quitar</button></td></tr>))}</tbody></table></div>
                                </div>
                            )}

                            <div><h4 className="font-semibold">Lotes Existentes</h4>{lotes.length > 0 ? (<div className="overflow-x-auto border rounded-lg mt-2"><table className="w-full text-sm"><thead className="bg-gray-50"><tr><th className="p-2 text-left">Lote</th><th className="p-2 text-left">Vencimiento</th><th className="p-2 text-right">Stock</th></tr></thead><tbody>{lotes.map(l => <tr key={l.id} className="border-t"><td className="p-2">{l.numero_lote}</td><td className="p-2">{l.fecha_vencimiento}</td><td className="p-2 text-right">{l.stock_disponible}</td></tr>)}</tbody></table></div>) : <p className="text-sm text-gray-500 mt-2">No hay lotes registrados.</p>}</div>
                        </div>
                    )}
                    {activeTab === 'precios' && (
                        <div className="space-y-4">
                            <div><label className="form-label">Precio Base de Lista ($)</label><input type="number" name="precio_base" value={productData.precio_base || ''} onChange={handleChange} className="form-input" /></div>
                            <div className="bg-blue-50 p-4 rounded-lg border border-blue-200 space-y-3">
                                <div className="flex items-start">
                                    <input type="checkbox" name="permite_combinacion" id="permite_combinacion" checked={productData.permite_combinacion || false} onChange={handleChange} className="h-4 w-4 mt-1" />
                                    <div className="ml-3">
                                        <label htmlFor="permite_combinacion" className="font-semibold text-gray-800">Habilitar promoción por cantidad (combinable)</label>
                                        <p className="text-xs text-gray-600 mt-1">Al activar, las unidades de este producto se sumarán a las de otros productos combinables para alcanzar los tramos de descuento definidos a continuación.</p>
                                    </div>
                                </div>
                                <fieldset className="border-t border-blue-200 pt-4">
                                    <legend className="px-2 text-sm font-semibold text-gray-700 -ml-2">Tramos de Descuento por Cantidad</legend>
                                    <div className="grid grid-cols-1 md:grid-cols-3 gap-4 items-end pt-2">
                                        <div><label htmlFor="tier-quantity" className="form-label text-xs">Cantidad Mín.</label><input type="number" id="tier-quantity" value={tierQuantity} onChange={e => setTierQuantity(e.target.value)} className="form-input" /></div>
                                        <div><label htmlFor="tier-price" className="form-label text-xs">Precio Unit.</label><input type="number" id="tier-price" value={tierPrice} onChange={e => setTierPrice(e.target.value)} className="form-input" /></div>
                                        <button type="button" onClick={handleAddPriceTier} className="btn-secondary">Añadir Tramo</button>
                                    </div>
                                    <div className="mt-4">{priceTiers.length > 0 ? (<table className="w-full text-sm mt-2"> <thead className="bg-gray-100"><tr><th className="p-2 text-left">Cantidad Mín.</th><th className="p-2 text-right">Precio Unitario</th><th className="p-2 text-center">Acción</th></tr></thead> <tbody>{priceTiers.map((tier, index) => (<tr key={index} className="border-b"><td className="p-2">{tier.cantidad}</td><td className="p-2 text-right">${tier.precio.toLocaleString("es-AR")}</td><td className="p-2 text-center"><button type="button" className="text-red-500 hover:text-red-700" onClick={() => setPriceTiers(current => current.filter((_, i) => i !== index))}>&times;</button></td></tr>))}</tbody></table>) : (<p className="text-sm text-gray-500 mt-2 text-center">(No hay tramos de descuento definidos)</p>)}</div>
                                </fieldset>
                            </div>
                        </div>
                    )}
                    </>
                    )}
                </div>
                <div className="p-4 border-t flex justify-end gap-2">
                    <button onClick={() => { setIsLoading(true); onClose(); }} className="btn btn-secondary">Cancelar</button>
                    <button onClick={handleSave} className="btn btn-primary">Guardar Producto</button>
                </div>
            </div>
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default ProductModal;
