// src/components/opportunities/OpportunityModal.tsx
import React, { useEffect, useState, useMemo, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import { useOpportunityStore } from '../../stores/useOpportunityStore';
import { useSharedStore } from '../../stores/useSharedStore';
import { usePedidoStore } from '../../stores/usePedidoStore';
import { Opportunity, OpportunityProduct, Contact, Product } from '../../types';
import { getNextProposalNumber, getOpportunityById, requestPriceApproval } from '../../services/opportunitiesApi';
import { applyPromotions } from '../../utils/promotions';
import { supabase } from '../../services/supabase';
import { formatCurrency, generateWhatsAppMessage, buildWhatsAppUrl } from '../../utils/formatters';
import { can } from '../../utils/permissions';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';
import { TrashIcon, XMarkIcon } from '@heroicons/react/24/outline';

interface OpportunityModalProps {
  isOpen: boolean;
  onClose: () => void;
  opportunityId: number | null;
  contactData?: Partial<Contact> | null;
  isReadOnly?: boolean;
}

// FIX: Define a type for the grouped product object to use in type assertions.
type GroupedProduct = { id: number; name: string; totalStock: number };

const OpportunityModal = ({ isOpen, onClose, opportunityId, contactData, isReadOnly: initialReadOnly }: OpportunityModalProps) => {
  const { saveOpportunity, requestApproval } = useOpportunityStore();
  const { salespeople, salesStages, products, paymentConditions, sharedConfig, bankAccounts } = useSharedStore();
  const { pedidos, fetchPedidos } = usePedidoStore();
  const navigate = useNavigate();
  const { modalProps, showMessage, hideModal } = useActionModal();
  
  const [formData, setFormData] = useState<Partial<Opportunity>>({});
  const [currentProducts, setCurrentProducts] = useState<OpportunityProduct[]>([]);
  const [contactSearch, setContactSearch] = useState('');
  const [contactResults, setContactResults] = useState<Contact[]>([]);
  const [isSearchingContacts, setIsSearchingContacts] = useState(false);
  const [contact, setContact] = useState<Contact | null>(null);
  const [isGenerating, setIsGenerating] = useState(false);
  const [isApprovalModalOpen, setApprovalModalOpen] = useState(false);
  const [justificacion, setJustificacion] = useState('');

  const [isSaving, setIsSaving] = useState(false);

  const isReadOnly = initialReadOnly;
  const canEditPrice = can('oportunidades:editar:precio');

  const existingPedido = useMemo(() => {
    if (!formData.id) return null;
    return pedidos.find(p => p.oportunidad_id === formData.id);
  }, [pedidos, formData.id]);

  useEffect(() => {
      if (pedidos.length === 0) {
          fetchPedidos();
      }
  }, [pedidos, fetchPedidos]);

  const simplifiedStages = useMemo(() => {
    const desiredStages = ['Propuesta Enviada', 'Ganada', 'Perdida'];
    const currentStage = salesStages.find(s => s.id === formData.etapa_id);
    const allStages = [...salesStages.filter(s => desiredStages.includes(s.nombre))];
    if (currentStage && !allStages.find(s => s.id === currentStage.id)) {
        allStages.push(currentStage);
    }
    return allStages.sort((a, b) => a.orden - b.orden);
  }, [salesStages, formData.etapa_id]);

    const productOptions = useMemo(() => {
    const grouped = products.reduce((acc, product) => {
      const trimmedName = product.nombre.trim();
      if (product.stock_total && product.stock_total > 0) {
        if (!acc[trimmedName]) {
          acc[trimmedName] = {
            id: product.id, 
            name: trimmedName,
            totalStock: 0,
          };
        }
        acc[trimmedName].totalStock += product.stock_total;
      }
      return acc;
    }, {} as Record<string, GroupedProduct>);

    // FIX: Explicitly type the array from Object.values to ensure TypeScript correctly infers
    // the type for the subsequent .map() operation, resolving the 'unknown' type error.
    const values: GroupedProduct[] = Object.values(grouped);
    return values.sort((a, b) => a.name.localeCompare(b.name));
  }, [products]);

  useEffect(() => {
    if (isOpen) {
      const loadData = async () => {
        if (opportunityId) {
          const oppData = await getOpportunityById(opportunityId);
          setFormData(oppData);
          setCurrentProducts(applyPromotions(oppData.productos || [], products));
          setContactSearch(oppData.contactos?.nombre || '');
          if (oppData.contacto_id) {
            const { data: contactFullData } = await supabase.from('contactos').select('*').eq('id', oppData.contacto_id).single();
            setContact(contactFullData);
          }
        } else {
          const nextNumber = await getNextProposalNumber();
          const presupuestoStage = salesStages.find(s => s.nombre === 'Propuesta Enviada');
          setFormData({ etapa_id: presupuestoStage?.id, numero_propuesta: nextNumber });
          setCurrentProducts([]);
          setContact(null);

          if (contactData) {
            setFormData(prev => ({ ...prev, contacto_id: contactData.id, vendedor_id: contactData.vendedor_id, condicion_pago_id: contactData.condicion_pago_id }));
            setContactSearch(contactData.nombre || '');
            setContactResults([]);
            const { data: contactFullData } = await supabase.from('contactos').select('*').eq('id', contactData.id).single();
            setContact(contactFullData);
          } else {
            setContactSearch('');
          }
        }
      };
      loadData();
    }
  }, [opportunityId, isOpen, products, salesStages, contactData]);

  useEffect(() => {
    if (!opportunityId && (contact || currentProducts.length > 0)) {
        const date = new Date();
        const dateString = `${date.getDate().toString().padStart(2, '0')}-${(date.getMonth() + 1).toString().padStart(2, '0')}`;
        let contactName = 'Cliente';
        if (contact) {
            const nameParts = contact.nombre.split(' ');
            contactName = nameParts.length > 1 ? `${nameParts[0]} ${nameParts[1]}` : nameParts[0];
            if (!/dr|dra/i.test(contactName)) {
                contactName = `Dra. ${contactName}`;
            }
        }
        const productLines = [...new Set(currentProducts.map(p => products.find(master => master.id === p.producto_id)?.linea_marca).filter(Boolean))].slice(0, 2).join(' + ');
        const autoName = `${dateString} ${contactName} - ${productLines || 'Varios'}`;
        setFormData(prev => ({...prev, nombre: autoName}));
    }
  }, [contact, currentProducts, opportunityId, products]);
  
  const totalValue = useMemo(() => currentProducts.reduce((sum, p) => sum + (p.subtotal || 0), 0), [currentProducts]);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    if (name === 'etapa_id') {
      const newStageId = parseInt(value, 10);
      const perdidaStage = salesStages.find(s => s.nombre === 'Perdida');
      if (newStageId === perdidaStage?.id) {
        const justificacion = prompt('Por favor, ingrese el motivo de la pérdida:');
        if (justificacion !== null) {
            setFormData(prev => ({ ...prev, etapa_id: newStageId, observaciones: `Motivo Pérdida: ${justificacion || 'No especificado'}\n---\n${prev.observaciones || ''}` }));
        }
        return;
      }
    }
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleContactSearch = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const term = e.target.value;
    setContactSearch(term);
    if (term.length > 1) {
      setIsSearchingContacts(true);
      const { data, error } = await supabase.from('contactos').select('*').ilike('nombre', `%${term}%`).limit(5);
      setContactResults(error ? [] : data || []);
      setIsSearchingContacts(false);
    } else {
      setContactResults([]);
    }
  };

  const selectContact = (selectedContact: Contact) => {
    setFormData(prev => ({ ...prev, contacto_id: selectedContact.id, vendedor_id: selectedContact.vendedor_id, condicion_pago_id: selectedContact.condicion_pago_id }));
    setContact(selectedContact);
    setContactSearch(selectedContact.nombre || '');
    setContactResults([]);
  };

  const handleAddProduct = () => {
    const select = document.getElementById('po-product-select') as HTMLSelectElement;
    const quantityInput = document.getElementById('po-product-quantity') as HTMLInputElement;
    const priceInput = document.getElementById('po-product-price') as HTMLInputElement;

    const productId = parseInt(select.value, 10);
    const quantity = parseInt(quantityInput.value, 10);
    const price = parseFloat(priceInput.value);

    if (!productId || isNaN(quantity) || quantity <= 0) {
      showMessage('Datos inválidos', 'Por favor, seleccione un producto y una cantidad válida.');
      return;
    }

    const productMaster = products.find(p => p.id === productId);
    if (!productMaster) return;

    const newProduct: Omit<OpportunityProduct, 'subtotal'> = {
      producto_id: productId,
      nombre: productMaster.nombre,
      cantidad: quantity,
      precio_unitario: isNaN(price) || price <= 0 ? productMaster.precio_base : price,
      promo_aplicada: isNaN(price) || price <= 0 ? null : 'Precio Manual',
    };

    setCurrentProducts(prev => applyPromotions([...prev, newProduct], products));
    select.value = '';
    quantityInput.value = '1';
    priceInput.value = '';
  };
  
  const handleCartItemChange = (index: number, field: 'cantidad' | 'precio_unitario', value: string) => {
    const numericValue = parseFloat(value);
    if (isNaN(numericValue) && value !== '') return;

    const updatedProducts = [...currentProducts];
    const productToUpdate = { ...updatedProducts[index] };

    if (field === 'cantidad') productToUpdate.cantidad = numericValue || 0;
    else if (field === 'precio_unitario') {
      productToUpdate.precio_unitario = numericValue || 0;
      productToUpdate.promo_aplicada = 'Precio Manual';
    }
    
    updatedProducts[index] = productToUpdate;
    setCurrentProducts(applyPromotions(updatedProducts, products));
  };
  
  const removeProduct = (index: number) => {
    const updatedProducts = currentProducts.filter((_, i) => i !== index);
    setCurrentProducts(applyPromotions(updatedProducts, products));
  };
  
  const handleSubmit = async () => {
    if (isSaving || !formData.contacto_id || !formData.nombre) return;
    setIsSaving(true);
    try {
      const dataToSave = { ...formData, productos: currentProducts, valor: totalValue };
      await saveOpportunity(dataToSave);
      onClose();
    } catch (error: any) {
      showMessage('Error', `No se pudo guardar: ${error.message}`);
    } finally {
      setIsSaving(false);
    }
  };
  
  const handleConvertToPedido = () => {
    if (!formData.id) return;
    const opportunityForPedido: Opportunity = { ...formData, productos: currentProducts, valor: totalValue } as Opportunity;
    navigate('/pedidos/new', { state: { opportunityData: opportunityForPedido } });
    onClose();
  };

  const handleRequestApproval = async () => {
    const productosConDescuento = currentProducts.filter(p => p.promo_aplicada === 'Precio Manual');
    if (productosConDescuento.length === 0 || !justificacion.trim() || !formData.id) {
        showMessage('Datos incompletos', 'Asegúrate de tener productos con "Precio Manual" y una justificación.');
        return;
    }
    setIsGenerating(true);
    try {
        const solicitudes = productosConDescuento.map(p => ({ producto_id: p.producto_id, precio_solicitado: p.precio_unitario }));
        const result = await requestApproval(formData.id, solicitudes, justificacion);
        window.open(result.whatsapp_base_link, '_blank');
        setApprovalModalOpen(false);
    } catch (error: any) {
        showMessage('Error', `Error al solicitar aprobación: ${error.message}`);
    } finally {
        setIsGenerating(false);
    }
  };

  const handleShareWhatsApp = () => {
      if (!contact?.telefono) return;
      const paymentCondition = paymentConditions.find(pc => pc.id === formData.condicion_pago_id);
      const message = generateWhatsAppMessage({
          contactName: contact.nombre, type: 'Propuesta Comercial', number: formData.numero_propuesta || 'S/N',
          products: currentProducts, total: totalValue,
          paymentCondition: paymentCondition ? `${paymentCondition.nombre} (${paymentCondition.dias} días)` : "Contado",
          bankAccounts: bankAccounts
      });
      window.open(buildWhatsAppUrl(contact.telefono, message), "_blank");
  };

  if (!isOpen) return null;

  return (
    <>
    <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center p-4">
      <div className="bg-slate-50 rounded-lg shadow-xl w-full max-w-6xl max-h-[95vh] flex flex-col">
        <div className="p-4 border-b flex justify-between items-center bg-white rounded-t-lg">
          <h2 className="text-xl font-semibold text-primary">{opportunityId ? `Presupuesto N° ${String(formData.numero_propuesta || '').padStart(4, '0')}` : 'Crear Nuevo Presupuesto'}</h2>
          <button onClick={onClose} className="text-3xl text-gray-400 hover:text-gray-600">&times;</button>
        </div>
        
        <div className="flex-grow flex-1 flex flex-col md:flex-row overflow-hidden">
          <div className="flex-1 overflow-y-auto p-6 space-y-6">
            <fieldset className="p-4 rounded-lg bg-white border space-y-4">
              <legend className="font-semibold px-2">Datos Principales</legend>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-4">
                <div className="sm:col-span-2"><label htmlFor="nombre" className="form-label">Nombre del Presupuesto</label><input type="text" name="nombre" value={formData.nombre || ''} onChange={handleChange} className="form-input" required disabled={isReadOnly}/></div>
                <div><label className="form-label">Contacto</label><input type="text" value={contactSearch} onChange={handleContactSearch} className="form-input" placeholder="Buscar..." required disabled={isReadOnly || !!opportunityId}/><div className="relative">{isSearchingContacts ? <p>Buscando...</p> : contactResults.length > 0 && <div className="absolute z-10 w-full bg-white border shadow-lg rounded-md">{contactResults.map(c => <div key={c.id} onClick={() => selectContact(c)} className="p-2 hover:bg-gray-100 cursor-pointer">{c.nombre}</div>)}</div>}</div></div>
                <div><label className="form-label">Vendedor</label><p className="p-2 bg-gray-100 rounded-md text-sm">{salespeople.find(s => s.id === formData.vendedor_id)?.perfiles.nombre || 'No asignado'}</p></div>
                <div><label className="form-label">Etapa</label><select name="etapa_id" value={formData.etapa_id || ''} onChange={handleChange} className="form-input" disabled={isReadOnly}><option value="">Seleccionar...</option>{simplifiedStages.map(s => <option key={s.id} value={s.id}>{s.nombre}</option>)}</select></div>
                <div><label className="form-label">Condición de Pago</label><select name="condicion_pago_id" value={formData.condicion_pago_id || ''} onChange={handleChange} className="form-input" disabled={isReadOnly}><option value="">Seleccionar...</option>{paymentConditions.map(pc => <option key={pc.id} value={pc.id}>{pc.nombre}</option>)}</select></div>
              </div>
            </fieldset>

            {/* --- SECCIÓN DE PRODUCTOS (CORREGIDA) --- */}
            {!isReadOnly && (
            <fieldset className="p-4 rounded-lg bg-white border space-y-4">
                <legend className="font-semibold px-2">Añadir Productos</legend>
                <div className="grid grid-cols-1 md:grid-cols-12 gap-2 items-end">
                    <div className="md:col-span-5"><label htmlFor="po-product-select" className="form-label">Producto</label><select id="po-product-select" className="form-input"><option value="">Seleccionar...</option>{productOptions.map(p => <option key={p.id} value={p.id}>{p.name} ({p.totalStock} disp.)</option>)}</select></div>
                    <div className="md:col-span-2"><label htmlFor="po-product-quantity" className="form-label">Cantidad</label><input type="number" id="po-product-quantity" className="form-input" defaultValue="1" min="1"/></div>
                    <div className="md:col-span-2"><label htmlFor="po-product-price" className="form-label">Precio</label><input type="number" id="po-product-price" className="form-input" placeholder="(Auto)" step="0.01"/></div>
                    <div className="md:col-span-3"><button type="button" onClick={handleAddProduct} className="btn btn-secondary w-full">Añadir</button></div>
                </div>
            </fieldset>
            )}

            <textarea name="observaciones" value={formData.observaciones || ''} onChange={handleChange} className="form-input w-full" rows={2} placeholder="Observaciones internas..." disabled={isReadOnly}></textarea>
          </div>

          <div className="w-full md:w-[450px] p-6 border-l bg-white space-y-4 overflow-y-auto">
            <h3 className="font-bold text-lg text-primary">Detalle del Presupuesto</h3>
            <div className="space-y-2 max-h-[calc(95vh-250px)] overflow-y-auto pr-2">
              {currentProducts.length === 0 && <p className="text-sm text-gray-500 text-center py-4">No hay productos añadidos.</p>}
              {currentProducts.map((p, i) => (
                <div key={`${p.producto_id}-${i}`} className="text-sm border-b pb-2">
                  <div className="flex justify-between items-start">
                    <p className="font-semibold">{p.nombre}</p>
                    <div className="flex items-center gap-2"><p className="font-semibold">{formatCurrency(p.subtotal)}</p>{!isReadOnly && <button onClick={() => removeProduct(i)}><TrashIcon className="w-4 h-4 text-red-500"/></button>}</div>
                  </div>
                  <div className="flex items-center gap-2 mt-2">
                    <label className="text-xs">Cant:</label><input type="number" value={p.cantidad} onChange={e => handleCartItemChange(i, 'cantidad', e.target.value)} className="form-input w-16 text-center p-1 text-sm" disabled={isReadOnly}/>
                    <label className="text-xs ml-2">Precio:</label><input type="number" value={p.precio_unitario.toFixed(2)} onChange={e => handleCartItemChange(i, 'precio_unitario', e.target.value)} className={`form-input w-24 text-right p-1 text-sm ${p.promo_aplicada === 'Precio Manual' ? 'bg-yellow-100' : ''}`} disabled={isReadOnly || !canEditPrice} step="0.01"/>
                  </div>
                  {p.promo_aplicada && <div className="text-xs text-green-600 font-semibold mt-1">{p.promo_aplicada}</div>}
                </div>
              ))}
            </div>
            <div className="border-t pt-4 space-y-2">
              <div className="flex justify-between items-center text-lg"><p className="font-semibold">TOTAL</p><p className="font-bold text-primary">{formatCurrency(totalValue)}</p></div>
            </div>
          </div>
        </div>

        <div className="p-4 border-t flex justify-between items-center bg-white rounded-b-lg sticky bottom-0">
          <div>
            {opportunityId && (
              <div className="flex gap-2">
                <button onClick={handleShareWhatsApp} disabled={!contact?.telefono} className="btn btn-secondary">WhatsApp</button>
                <button onClick={() => setApprovalModalOpen(true)} className="btn btn-secondary">Solicitar Aprob.</button>
              </div>
            )}
          </div>
          <div className="flex gap-3">
            <button type="button" onClick={onClose} className="btn btn-secondary">Cerrar</button>
            {!isReadOnly && <button onClick={handleSubmit} className="btn btn-primary" disabled={isSaving}>{isSaving ? 'Guardando...' : 'Guardar'}</button>}
            {formData.etapa_id === salesStages.find(s => s.nombre === 'Ganada')?.id && !existingPedido && <button onClick={handleConvertToPedido} className="btn btn-success">Convertir a Pedido</button>}
            {existingPedido && <span className="p-2 text-sm bg-green-100 text-green-800 rounded-md">Pedido {existingPedido.numero_pedido} ya creado</span>}
          </div>
        </div>
      </div>
    </div>
    <ActionModal {...modalProps} />
    {isApprovalModalOpen && (
       <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center p-4">
        <div className="bg-white rounded-lg shadow-xl w-full max-w-md">
            <div className="p-4 border-b flex justify-between items-center"><h3 className="text-lg font-semibold">Solicitar Aprobación de Precio</h3><button onClick={() => setApprovalModalOpen(false)}>&times;</button></div>
            <div className="p-6 space-y-4">
                <p className="text-sm">Se enviará una solicitud por WhatsApp al gerente para aprobar los precios marcados como "Precio Manual".</p>
                <div><label htmlFor="justificacion" className="form-label">Justificación para el gerente</label><textarea id="justificacion" value={justificacion} onChange={e => setJustificacion(e.target.value)} rows={3} className="form-input" required></textarea></div>
            </div>
            <div className="p-4 border-t flex justify-end gap-2">
                <button onClick={() => setApprovalModalOpen(false)} className="btn btn-secondary">Cancelar</button>
                <button onClick={handleRequestApproval} className="btn btn-primary" disabled={isGenerating}>{isGenerating ? 'Enviando...' : 'Enviar Solicitud'}</button>
            </div>
        </div>
       </div>
    )}
    </>
  );
};

export default OpportunityModal;