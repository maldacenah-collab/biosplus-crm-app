// src/components/pedidos/PedidoModal.tsx
import React, { useEffect, useState, useMemo, useCallback } from 'react';
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import { usePedidoStore } from '../../stores/usePedidoStore';
import { useLogisticaStore } from '../../stores/useLogisticaStore';
import { useSharedStore } from '../../stores/useSharedStore';
import { useContactStore } from '../../stores/useContactStore';
import { useZonasEnvioStore } from '../../stores/useZonasEnvioStore';
import { Pedido, PedidoProduct, Opportunity, Contact, Lote, StockVendedor, Product, ZonaEnvio } from '../../types';
import { getPedidoById, generarNumeroPedido } from '../../services/pedidosApi';
import { applyPromotions } from '../../utils/promotions';
import { formatCurrency, generateWhatsAppMessage, buildWhatsAppUrl } from '../../utils/formatters';
import { supabase } from '../../services/supabase';
import { TrashIcon, XMarkIcon, InformationCircleIcon } from '@heroicons/react/24/outline';
import Avatar from '../common/Avatar';
import { can } from '../../utils/permissions';
import { useNavigate } from 'react-router-dom';
import { getPrimaryAddress, AddressObject } from '../../utils/contactUtils';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';


interface PedidoModalProps {
  isOpen: boolean;
  onClose: () => void;
  pedidoId: number | null;
  opportunityData?: Opportunity | null;
  contactData?: Contact | null;
  isReadOnly: boolean;
}

const getLogoDataUri = async (url: string): Promise<string | null> => {
  if (!url) return null;
  try {
    // Usar el proxy de Supabase si la URL es de Supabase para evitar problemas de CORS
    const fetchUrl = url.includes('supabase.co') 
      ? url 
      : `https://jsbgutbsckwintsnhnno.supabase.co/functions/v1/proxy-image?url=${encodeURIComponent(url)}`;

    const response = await fetch(fetchUrl);
    if (!response.ok) throw new Error(`Network response was not ok, status: ${response.status}`);
    
    const blob = await response.blob();
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.onloadend = () => resolve(reader.result as string);
      reader.onerror = reject;
      reader.readAsDataURL(blob);
    });
  } catch (error) {
    console.error("Error loading logo for PDF:", error);
    return null;
  }
};


const PedidoModal = ({ isOpen, onClose, pedidoId, opportunityData, contactData: initialContactData, isReadOnly: initialReadOnly }: PedidoModalProps) => {
    const { fetchPedidos, savePedido, anularPedido } = usePedidoStore();
    const { fetchPedidos: fetchLogistica } = useLogisticaStore();
    const { products, salespeople, depositos, paymentConditions, lotes, stock_vendedores, currentUser, bankAccounts, sharedConfig } = useSharedStore();
    const { contacts, fetchContacts } = useContactStore();
    const { zonas, fetchZonas } = useZonasEnvioStore();
    const navigate = useNavigate();
    const { modalProps, showMessage, hideModal, showModal } = useActionModal();

    const [formData, setFormData] = useState<Partial<Pedido>>({});
    const [currentProducts, setCurrentProducts] = useState<PedidoProduct[]>([]);
    const [isLoading, setIsLoading] = useState(true);
    const [isSaving, setIsSaving] = useState(false);
    const [isGeneratingPDF, setIsGeneratingPDF] = useState(false);
    
    const [stockSource, setStockSource] = useState<'deposito_principal' | 'stock_vendedor'>('deposito_principal');
    const [selectedAddress, setSelectedAddress] = useState<string>('');
    const [shippingInfo, setShippingInfo] = useState<{ cost: number; zoneName: string | null; isLoading: boolean, zoneId: number | null, bonusThreshold: number | null }>({ cost: 0, zoneName: null, isLoading: false, zoneId: null, bonusThreshold: null });

    const [currentContact, setCurrentContact] = useState<Contact | null>(null);
    const [contactSearchTerm, setContactSearchTerm] = useState('');
    const [contactResults, setContactResults] = useState<Contact[]>([]);
    
    const [productSearch, setProductSearch] = useState('');
    const [selectedProductInfo, setSelectedProductInfo] = useState<{
        name: string;
        representativeId: number;
        allIds: number[];
        stock: number;
    } | null>(null);
    const [quantity, setQuantity] = useState(1);
    
    const [initialData, setInitialData] = useState<string>('');
    const [isDirty, setIsDirty] = useState(false);
    
    const canEditPrice = can('oportunidades:editar:precio');
    const isViewOnly = initialReadOnly;

    const calculateStockForProduct = useCallback((productId: number, source: 'deposito_principal' | 'stock_vendedor'): number => {
        if (source === 'deposito_principal') {
            return lotes
                .filter(l => l.producto_id === productId)
                .reduce((sum, lote) => sum + lote.stock_disponible, 0);
        } else { // 'stock_vendedor'
            const vendedorId = formData.vendedor_id;
            if (!vendedorId) return 0;
            
            const stockAsignadoVendedor = stock_vendedores.filter(sv => sv.vendedor_id === vendedorId);
    
            return stockAsignadoVendedor.reduce((sum, sv) => {
                const lote = lotes.find(l => l.id === sv.lote_id);
                if (lote && lote.producto_id === productId) {
                    return sum + sv.cantidad_asignada;
                }
                return sum;
            }, 0);
        }
    }, [lotes, stock_vendedores, formData.vendedor_id]);
    

    const productsValue = useMemo(() => currentProducts.reduce((sum, p) => sum + p.subtotal, 0), [currentProducts]);
    
    const handleAddressSelection = useCallback(async (addressValue: string) => {
        setSelectedAddress(addressValue);

        if (addressValue === 'OFICINA_COMERCIAL' || addressValue === 'SUCURSAL_CORREO') {
            setFormData(prev => ({ ...prev, modalidad_entrega: addressValue as any, direccion_entrega: null }));
            setShippingInfo({ cost: 0, zoneName: 'Retira', isLoading: false, zoneId: null, bonusThreshold: null });
            return;
        }

        if (addressValue === 'manual') {
            setFormData(prev => ({ ...prev, modalidad_entrega: 'DOMICILIO', direccion_entrega: { full_address: '' } }));
            setShippingInfo({ cost: 0, zoneName: 'Manual', isLoading: false, zoneId: null, bonusThreshold: null });
            return;
        }
        
        try {
            const addressObj = JSON.parse(addressValue);
            setFormData(prev => ({ ...prev, modalidad_entrega: 'DOMICILIO', direccion_entrega: addressObj, dia_hora_entrega: [addressObj.days, addressObj.hours].filter(Boolean).join(' ') }));
        } catch (e) {
            // Not a JSON object, initial load or other case handled below.
        }

        setShippingInfo({ cost: 0, zoneName: null, isLoading: true, zoneId: null, bonusThreshold: null });

        if (!currentContact || !currentContact.zona_id) {
            setShippingInfo({ cost: 0, zoneName: 'Sin zona', isLoading: false, zoneId: null, bonusThreshold: null });
            return;
        }

        const foundZone = zonas.find(z => z.id === currentContact.zona_id);

        if (foundZone) {
            let finalCost = foundZone.costo || 0;
            const bonusThreshold = foundZone.monto_minimo_bonificacion;

            if (bonusThreshold && productsValue >= bonusThreshold) {
                finalCost = 0;
            }

            setShippingInfo({
                cost: finalCost,
                zoneName: foundZone.nombre,
                isLoading: false,
                zoneId: foundZone.id,
                bonusThreshold: bonusThreshold || null,
            });
        } else {
            setShippingInfo({
                cost: 0,
                zoneName: 'Zona no encontrada',
                isLoading: false,
                zoneId: null,
                bonusThreshold: null,
            });
        }
    }, [currentContact, zonas, productsValue]);

    
    useEffect(() => {
        if (shippingInfo.zoneId && shippingInfo.bonusThreshold !== null) {
            if (productsValue >= shippingInfo.bonusThreshold) {
                if (shippingInfo.cost !== 0) {
                    setShippingInfo(s => ({ ...s, cost: 0 }));
                }
            } else {
                const originalZone = zonas.find(z => z.id === shippingInfo.zoneId);
                const originalCost = originalZone?.costo || 0;
                if (shippingInfo.cost !== originalCost) {
                    setShippingInfo(s => ({ ...s, cost: originalCost }));
                }
            }
        }
    }, [productsValue, shippingInfo.zoneId, shippingInfo.bonusThreshold, shippingInfo.cost, zonas]);


    useEffect(() => {
        if (!isOpen) return;
        
        const loadData = async () => {
            setIsLoading(true);
            if (contacts.length === 0) await fetchContacts();
            await fetchZonas();

            let initialData: Partial<Pedido> = {
                deposito_principal_id: 1, 
                origen_stock: 'deposito_principal',
                estado_id: 8, // Borrador
                vendedor_id: currentUser?.vendedorId,
            };
            let initialProducts: PedidoProduct[] = [];
            let initialContact: Contact | null = null;
            
            if (pedidoId) {
                const data = await getPedidoById(pedidoId);
                initialData = data;
                initialProducts = data.productos || [];
                if(data.contacto_id) {
                    initialContact = await supabase.from('contactos').select('*').eq('id', data.contacto_id).single().then(res => res.data);
                    if(initialContact) setContactSearchTerm(initialContact.nombre);
                }
            } else if (opportunityData) {
                initialProducts = (opportunityData.productos as PedidoProduct[]) || [];
                if(opportunityData.contacto_id) {
                    initialContact = await supabase.from('contactos').select('*').eq('id', opportunityData.contacto_id).single().then(res => res.data);
                    if(initialContact) setContactSearchTerm(initialContact.nombre);
                }
                if(initialContact){
                    initialData.contacto_id = initialContact.id;
                    initialData.vendedor_id = initialContact.vendedor_id;
                    initialData.condicion_pago_id = initialContact.condicion_pago_id;
                    initialData.oportunidad_id = opportunityData.id;
                    (initialData as any).numero_propuesta_origen = opportunityData.numero_propuesta;
                }
            } else if (initialContactData) {
                 initialContact = initialContactData as Contact;
                 setContactSearchTerm(initialContactData.nombre || '');
                 initialData.contacto_id = initialContactData.id;
                 initialData.vendedor_id = initialContactData.vendedor_id;
                 initialData.condicion_pago_id = initialContactData.condicion_pago_id;
            }

            const processedProducts = applyPromotions(initialProducts, products);
            setCurrentContact(initialContact);
            setCurrentProducts(processedProducts);
            
            const initialStockSource = initialData.origen_stock || 'deposito_principal';
            setStockSource(initialStockSource);
            
            let initialSelectedAddress = '';
            
            if (initialData.modalidad_entrega && initialData.modalidad_entrega !== 'DOMICILIO') {
                initialSelectedAddress = initialData.modalidad_entrega;
            }
            else if (initialData.direccion_entrega?.full_address) {
                initialSelectedAddress = JSON.stringify(initialData.direccion_entrega);
            } else if (initialContact) {
                 const defaultAddr = getPrimaryAddress(initialContact);
                if (defaultAddr) {
                    initialSelectedAddress = JSON.stringify(defaultAddr);
                } else {
                    initialSelectedAddress = 'OFICINA_COMERCIAL';
                }
            } else {
                initialSelectedAddress = 'manual';
            }
            
            setFormData(initialData);

            if (initialSelectedAddress) {
                handleAddressSelection(initialSelectedAddress);
            }
            
            setInitialData('');
            setIsDirty(false);

            setIsLoading(false);
        };

        loadData();
    }, [isOpen, pedidoId, opportunityData, initialContactData, contacts.length, fetchContacts, products, currentUser, fetchZonas]);

    useEffect(() => {
        if (!isOpen || isLoading || shippingInfo.isLoading) return;
        const currentState = { formData: {...formData, costo_envio: shippingInfo.cost}, currentProducts, stockSource, selectedAddress };
        const serializedState = JSON.stringify(currentState);
        if (!initialData) {
            setInitialData(serializedState);
            setIsDirty(false);
            return;
        }
        setIsDirty(serializedState !== initialData);
    }, [formData, currentProducts, stockSource, selectedAddress, shippingInfo.cost, shippingInfo.isLoading, initialData, isOpen, isLoading]);

    const handleClose = () => {
        if (isDirty) {
            showModal((hide) => ({
                title: 'Cambios sin guardar',
                message: 'Tienes cambios sin guardar. ¿Deseas salir sin guardar?',
                buttons: [
                    { label: 'Seguir editando', onClick: hide, variant: 'secondary' },
                    { label: 'Salir sin guardar', onClick: () => { hide(); onClose(); }, variant: 'danger' },
                ],
            }));
            return;
        }
        onClose();
    };

    useEffect(() => {
        const handleBeforeUnload = (e: BeforeUnloadEvent) => {
            if (isDirty) {
                e.preventDefault();
                e.returnValue = ''; 
            }
        };

        if (isOpen) {
            window.addEventListener('beforeunload', handleBeforeUnload);
        }

        return () => {
            window.removeEventListener('beforeunload', handleBeforeUnload);
        };
    }, [isDirty, isOpen]);
    
    const productSuggestions = useMemo(() => {
        if (!productSearch) return [];
        const lowerCaseSearch = productSearch.toLowerCase().trim();
    
        type GroupedProduct = { representative: Product; totalStock: number; all_ids: number[] };
        const groupedByName = products.reduce((acc, product) => {
            const productName = product.nombre.trim();
            if (productName.toLowerCase().includes(lowerCaseSearch)) {
                if (!acc[productName]) {
                    acc[productName] = {
                        representative: product, totalStock: 0, all_ids: [] };
                }
                const stock = calculateStockForProduct(product.id, stockSource);
                acc[productName].totalStock += stock;
                acc[productName].all_ids.push(product.id);
            }
            return acc;
        }, {} as Record<string, GroupedProduct>);
    
        return Object.values(groupedByName).filter((group: GroupedProduct) => group.totalStock > 0);
    
    }, [productSearch, products, stockSource, calculateStockForProduct]);

    const handleContactSearch = (e: React.ChangeEvent<HTMLInputElement>) => {
        const term = e.target.value;
        setContactSearchTerm(term);
        if (term.length > 1) {
            setContactResults(contacts.filter(c => c.nombre.toLowerCase().includes(term.toLowerCase())).slice(0, 5));
        } else {
            setContactResults([]);
        }
    };

    const selectContact = (contact: Contact) => {
        setCurrentContact(contact);
        setContactSearchTerm(contact.nombre);
        setFormData(prev => ({
            ...prev,
            contacto_id: contact.id,
            vendedor_id: contact.vendedor_id || prev.vendedor_id,
            condicion_pago_id: contact.condicion_pago_id
        }));

        const defaultAddress = getPrimaryAddress(contact);
        const defaultAddressString = defaultAddress ? JSON.stringify(defaultAddress) : 'OFICINA_COMERCIAL';
        
        handleAddressSelection(defaultAddressString);
        setContactResults([]);
    };

    const handleProductSelect = (selectedGroup: { representative: Product; totalStock: number; all_ids: number[] }) => {
        setSelectedProductInfo({
            name: selectedGroup.representative.nombre,
            representativeId: selectedGroup.representative.id,
            allIds: selectedGroup.all_ids,
            stock: selectedGroup.totalStock
        });
        setProductSearch('');
    };

    const handleAddProduct = () => {
        if (!selectedProductInfo || quantity <= 0) return;
        if (quantity > selectedProductInfo.stock) {
            showMessage('Stock insuficiente', `Stock insuficiente. Solo hay ${selectedProductInfo.stock} unidades disponibles.`, [
                { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
            ]);
            return;
        }

        const productMaster = products.find(p => p.id === selectedProductInfo.representativeId);
        if (!productMaster) return;

        let lotesDisponibles: (Lote & { stock_real_disponible: number })[] = [];
        const productIds = selectedProductInfo.allIds;

        if (stockSource === 'deposito_principal') {
            lotesDisponibles = lotes
                .filter(l => productIds.includes(l.producto_id) && l.stock_disponible > 0)
                .map(l => ({ ...l, stock_real_disponible: l.stock_disponible }))
                .sort((a, b) => new Date(a.fecha_vencimiento || 0).getTime() - new Date(b.fecha_vencimiento || 0).getTime());
        } else {
            const vendedorId = formData.vendedor_id;
            lotesDisponibles = stock_vendedores
                .filter(sv => {
                    const lote = lotes.find(l => l.id === sv.lote_id);
                    return sv.vendedor_id === vendedorId && lote && productIds.includes(lote.producto_id) && sv.cantidad_asignada > 0;
                })
                .map(sv => {
                    const lote = lotes.find(l => l.id === sv.lote_id)!;
                    return { ...lote, stock_real_disponible: sv.cantidad_asignada };
                })
                .sort((a, b) => new Date(a.fecha_vencimiento || 0).getTime() - new Date(b.fecha_vencimiento || 0).getTime());
        }

        let remainingQuantity = quantity;
        const newProductsToAdd: Omit<PedidoProduct, 'subtotal'>[] = [];

        for (const lote of lotesDisponibles) {
            if (remainingQuantity <= 0) break;
            const quantityFromThisLote = Math.min(remainingQuantity, lote.stock_real_disponible);

            newProductsToAdd.push({
                producto_id: productMaster.id,
                nombre: productMaster.nombre,
                cantidad: quantityFromThisLote,
                precio_unitario: productMaster.precio_base,
                lote_seleccionado_id: lote.id,
                lote_numero: lote.numero_lote,
                fecha_vencimiento: lote.fecha_vencimiento,
            });
            
            remainingQuantity -= quantityFromThisLote;
        }
        
        setCurrentProducts(prev => applyPromotions([...prev, ...newProductsToAdd], products));
        
        setSelectedProductInfo(null);
        setQuantity(1);
        setProductSearch('');
    };
    
    const handleCartItemChange = (index: number, field: 'cantidad' | 'precio_unitario', value: string) => {
        const numericValue = parseFloat(value);
        if (isNaN(numericValue)) return;
    
        const updatedProducts = [...currentProducts];
        const productToUpdate = { ...updatedProducts[index] };
    
        if (field === 'cantidad') {
            productToUpdate.cantidad = numericValue;
        } else if (field === 'precio_unitario') {
            productToUpdate.precio_unitario = numericValue;
            productToUpdate.promo_aplicada = 'Precio Manual';
        }
    
        productToUpdate.subtotal = productToUpdate.cantidad * productToUpdate.precio_unitario;
        updatedProducts[index] = productToUpdate;
    
        if (field === 'cantidad') {
            setCurrentProducts(applyPromotions(updatedProducts, products));
        } else {
            setCurrentProducts(updatedProducts);
        }
    };

    const removeProduct = (index: number) => {
        const updatedProducts = currentProducts.filter((_, i) => i !== index);
        setCurrentProducts(applyPromotions(updatedProducts, products));
    };
    
    const totalValue = useMemo(() => productsValue + shippingInfo.cost, [productsValue, shippingInfo.cost]);

     const handleSubmit = async () => {
        if (isSaving || !currentContact) return;
        setIsSaving(true);
        try {
            const numero_pedido = formData.numero_pedido || await generarNumeroPedido(formData.deposito_principal_id || 1);
            
            const finalData: Partial<Pedido> = { 
                ...formData, 
                numero_pedido, 
                contacto_id: currentContact.id, 
                productos: currentProducts, 
                valor: totalValue,
                origen_stock: stockSource,
                costo_envio: shippingInfo.cost
            } as any;
            
            delete (finalData as any).contactos;
            delete (finalData as any).vendedores;
            delete (finalData as any).estados_pedido;
            delete (finalData as any).numero_propuesta_origen;

            const savedPedido = await savePedido(finalData);
            if (!savedPedido) {
              throw new Error("El guardado del pedido no devolvió un resultado.");
            }

            if (!pedidoId) {
                await supabase.rpc('procesar_confirmacion_pedido_v2', { p_pedido_id: savedPedido.id });
            }

            const fullPedidoData = await getPedidoById(savedPedido.id);
            setFormData(fullPedidoData);
            setCurrentProducts(fullPedidoData.productos || []);
            
            setInitialData('');
            setIsDirty(false);
            
            await fetchPedidos();
            await fetchLogistica();
        } catch (error: any) {
            showMessage('Error al guardar', `Error al guardar el pedido: ${error.message}`, [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
            ]);
            console.error(error);
        } finally {
            setIsSaving(false);
        }
    };

    const handleAnular = async () => {
        if (!pedidoId) return;
        showModal((hide) => ({
            title: 'Anular pedido',
            message: '¿Está seguro de que desea anular este pedido? Esta acción revertirá el stock y los movimientos de cuenta corriente.',
            buttons: [
                { label: 'Cancelar', onClick: hide, variant: 'secondary' },
                {
                    label: 'Anular pedido',
                    variant: 'danger',
                    onClick: async () => {
                        hide();
                        setIsSaving(true);
                        try {
                            await anularPedido(pedidoId);
                            await fetchPedidos();
                            await fetchLogistica();
                            onClose();
                        } catch (error: any) {
                            showMessage('Error al anular', `Error al anular el pedido: ${error.message}`, [
                                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
                            ]);
                        } finally {
                            setIsSaving(false);
                        }
                    }
                }
            ]
        }));
    };

    const addressOptions = useMemo(() => {
        if (!currentContact) return [];
    
        const formatAddressLabel = (label: string, address: Partial<AddressObject>) => {
            let displayAddress = address.full_address || '';
            if (address.piso) displayAddress += `, Piso ${address.piso}`;
            if (address.depto) displayAddress += `, Dpto ${address.depto}`;
            if(address.zip) displayAddress += ` (${address.zip})`
            return `${label}: ${displayAddress}`;
        };
    
        const options: { label: string, value: string }[] = [];
        
        if (currentContact.direccion_entrega?.full_address) {
            options.push({label: formatAddressLabel('Principal', currentContact.direccion_entrega), value: JSON.stringify(currentContact.direccion_entrega)});
        }
        if (currentContact.direccion_entrega_2?.full_address) {
            options.push({label: formatAddressLabel('Alternativa', currentContact.direccion_entrega_2), value: JSON.stringify(currentContact.direccion_entrega_2)});
        }
        if (currentContact.domicilio_fiscal?.full_address) {
            const fiscalAsDelivery = { 
                full_address: currentContact.domicilio_fiscal.full_address, 
                piso: currentContact.domicilio_fiscal.piso, 
                depto: currentContact.domicilio_fiscal.depto, 
                zip: currentContact.domicilio_fiscal.zip, 
                days: '', hours: '' 
            };
            options.push({label: formatAddressLabel('Fiscal', fiscalAsDelivery), value: JSON.stringify(fiscalAsDelivery)});
        }
        
        options.push({label: "Retira en Oficina Comercial", value: "OFICINA_COMERCIAL"});
        options.push({label: "Retira en Sucursal de Correo", value: "SUCURSAL_CORREO"});
        options.push({label: "Ingresar Otra Dirección", value: "manual"});
        
        return options;
    }, [currentContact]);
    
    
    const handleManualAddressChange = (field: 'full_address' | 'piso' | 'depto', value: string) => {
        setFormData(p => ({
            ...p,
            direccion_entrega: {
                ...(p.direccion_entrega || { full_address: '', piso: '', depto: '' }),
                [field]: value
            } as any
        }));
    };

    const handleShareTextWhatsApp = () => {
        if (!currentContact?.telefono) return;
    
        const paymentCondition = paymentConditions.find(pc => pc.id === formData.condicion_pago_id);
        const fullPaymentConditionText = paymentCondition ? `${paymentCondition.nombre}` : "Predeterminada";
    
        const message = generateWhatsAppMessage({
            contactName: currentContact.nombre,
            type: 'Pedido',
            number: formData.numero_pedido || 'S/N',
            products: currentProducts,
            total: totalValue,
            paymentCondition: fullPaymentConditionText,
            bankAccounts: bankAccounts
        });
    
        window.open(buildWhatsAppUrl(currentContact.telefono, message), "_blank");
    };

    const handleGeneratePDF = async () => {
        if (!currentContact || !formData) return;
        setIsGeneratingPDF(true);
    
        try {
            const doc = new jsPDF();
            const logoDataUri = await getLogoDataUri(sharedConfig.logo_url);
    
            const margin = 14;
            const pageWidth = doc.internal.pageSize.getWidth();
            const contentWidth = pageWidth - margin * 2;
            const col2X = pageWidth / 2;
            let currentY = 20;
    
            // --- Header ---
            doc.setFontSize(22);
            doc.setFont('helvetica', 'bold');
            doc.text('Detalle de Pedido (Remito)', margin, currentY);
            currentY += 10;
    
            if (logoDataUri) {
                const imgProps = doc.getImageProperties(logoDataUri);
                const imgWidth = 40;
                const imgHeight = (imgProps.height * imgWidth) / imgProps.width;
                doc.addImage(logoDataUri, 'PNG', pageWidth - margin - imgWidth, 15, imgWidth, imgHeight);
            }
    
            doc.setFontSize(10);
            doc.setFont('helvetica', 'normal');
            doc.text(`Pedido N°: ${formData.numero_pedido || 'N/A'}`, margin, currentY);
            currentY += 6;
            doc.text(`Fecha: ${new Date(formData.created_at || Date.now()).toLocaleDateString('es-AR')}`, margin, currentY);
            currentY += 12;
    
            const drawLine = () => {
                doc.setDrawColor(220, 220, 220);
                doc.line(margin, currentY, pageWidth - margin, currentY);
                currentY += 8;
            };
    
            // --- Client and Vendor Info ---
            const startYCols = currentY;
            doc.setFont('helvetica', 'bold'); doc.text('Cliente:', margin, currentY);
            doc.setFont('helvetica', 'normal'); doc.text(currentContact.nombre || 'N/A', margin + 35, currentY);
            currentY += 6;
            
            doc.setFont('helvetica', 'bold'); doc.text('Razón Social:', margin, currentY);
            doc.setFont('helvetica', 'normal'); doc.text(currentContact.razon_social || currentContact.nombre, margin + 35, currentY);
            currentY += 6;
    
            doc.setFont('helvetica', 'bold'); doc.text('Condición IVA:', margin, currentY);
            doc.setFont('helvetica', 'normal'); doc.text(currentContact.condicion_iva || 'N/A', margin + 35, currentY);
            currentY += 6;
    
            doc.setFont('helvetica', 'bold'); doc.text('CUIT/DNI:', margin, currentY);
            doc.setFont('helvetica', 'normal'); doc.text(currentContact.cuit || 'N/A', margin + 35, currentY);
            currentY += 6;

            doc.setFont('helvetica', 'bold'); doc.text('Domicilio Fiscal:', margin, currentY);
            doc.setFont('helvetica', 'normal'); doc.text(currentContact.domicilio_fiscal?.full_address || 'N/A', margin + 35, currentY);
            currentY += 6;
    
            doc.setFont('helvetica', 'bold'); doc.text('Teléfono:', margin, currentY);
            doc.setFont('helvetica', 'normal'); doc.text(currentContact.telefono || 'N/A', margin + 35, currentY);
            
            let currentYCol2 = startYCols;
            doc.setFont('helvetica', 'bold'); doc.text('Fecha de Entrega:', col2X, currentYCol2);
            doc.setFont('helvetica', 'normal'); doc.text(formData.fecha_entrega_prevista ? new Date(formData.fecha_entrega_prevista).toLocaleDateString('es-AR') : 'A coordinar', col2X + 40, currentYCol2);
            currentYCol2 += 6;
    
            doc.setFont('helvetica', 'bold'); doc.text('Vendedor Asignado:', col2X, currentYCol2);
            doc.setFont('helvetica', 'normal');
            const vendedor = salespeople.find(s => s.id === formData.vendedor_id);
            doc.text(vendedor?.perfiles.nombre || 'N/A', col2X + 40, currentYCol2);
            currentYCol2 += 6;
    
            doc.setFont('helvetica', 'bold'); doc.text('Condición de Pago:', col2X, currentYCol2);
            doc.setFont('helvetica', 'normal');
            const condPago = paymentConditions.find(pc => pc.id === formData.condicion_pago_id);
            doc.text(condPago ? `${condPago.nombre} (${condPago.dias} días)` : 'A convenir', col2X + 40, currentYCol2);
    
            currentY = Math.max(currentY, currentYCol2) + 10;
            drawLine();
    
            // --- Delivery and Observations ---
            const deliveryAddress = formData.direccion_entrega?.full_address || 'No especificada';
            const deliveryPiso = formData.direccion_entrega?.piso ? `, Piso ${formData.direccion_entrega.piso}` : '';
            const deliveryDepto = formData.direccion_entrega?.depto ? `, Dpto ${formData.direccion_entrega.depto}` : '';
            const fullDeliveryAddress = `${deliveryAddress}${deliveryPiso}${deliveryDepto}`;
            const deliveryHours = formData.dia_hora_entrega || '';
            
            const deliveryLines = doc.splitTextToSize(fullDeliveryAddress, contentWidth);
            const hoursLine = `Días y Horarios: ${deliveryHours}`;
            const hoursLines = doc.splitTextToSize(hoursLine, contentWidth);
            const deliveryBlockHeight = (deliveryLines.length + (deliveryHours ? hoursLines.length : 0)) * 5 + 14;

            // Highlight Box for Delivery
            doc.setFillColor(240, 240, 240);
            doc.rect(margin - 2, currentY - 6, contentWidth + 4, deliveryBlockHeight, 'F');
            doc.setFont('helvetica', 'bold'); doc.text('Datos de Entrega:', margin, currentY);
            currentY += 6;
            doc.setFont('helvetica', 'normal');
            doc.text(deliveryLines, margin, currentY);
            currentY += deliveryLines.length * 5;
            if (deliveryHours) {
                doc.text(hoursLines, margin, currentY);
                currentY += hoursLines.length * 5;
            }
            currentY += 10;
    
            const obsText = formData.observaciones || 'Sin observaciones.';
            const obsLines = doc.splitTextToSize(obsText, contentWidth);
            const obsBlockHeight = (obsLines.length * 5) + 8;
    
            // Highlight Box for Observations
            doc.setFillColor(240, 240, 240);
            doc.rect(margin - 2, currentY - 6, contentWidth + 4, obsBlockHeight, 'F');
            doc.setFont('helvetica', 'bold'); doc.text('Observaciones:', margin, currentY);
            currentY += 6;
            doc.setFont('helvetica', 'normal');
            doc.text(obsLines, margin, currentY);
            currentY += obsLines.length * 5 + 8;
    
            // --- Products Table ---
            const tableBody = currentProducts.map(p => [
                p.cantidad,
                p.nombre,
                p.lote_numero || 'N/A',
                formatCurrency(p.precio_unitario),
                formatCurrency(p.subtotal)
            ]);
    
            autoTable(doc, {
                startY: currentY,
                head: [['Cant.', 'Producto', 'Lote', 'Precio Unit.', 'Subtotal']],
                body: tableBody,
                theme: 'striped',
                headStyles: { fillColor: [0, 113, 188] },
                footStyles: { fillColor: [230, 230, 230], textColor: [0,0,0], fontStyle: 'bold' },
                foot: [[
                    { content: 'Costo de Envío:', colSpan: 4, styles: { halign: 'right' } },
                    { content: formatCurrency(shippingInfo.cost), styles: { halign: 'right' } }
                ],[
                    { content: 'Valor Total:', colSpan: 4, styles: { halign: 'right' } },
                    { content: formatCurrency(totalValue), styles: { halign: 'right' } }
                ]]
            });
    
            currentY = (doc as any).lastAutoTable.finalY + 20;

            // --- Payment Info ---
            if (bankAccounts.length > 0) {
                doc.setFont('helvetica', 'bold'); doc.setFontSize(11);
                doc.text('Datos para el Pago', margin, currentY);
                currentY += 6;
                doc.setFont('helvetica', 'normal'); doc.setFontSize(9);
                doc.text(sharedConfig.empresa_nombre || '', margin, currentY);
                currentY += 5;
                doc.text(`CUIT: ${sharedConfig.empresa_cuit || ''}`, margin, currentY);
                currentY += 5;
                doc.text(`Dirección: ${sharedConfig.empresa_direccion || ''}`, margin, currentY);
                currentY += 8;

                autoTable(doc, {
                    startY: currentY,
                    head: [['Banco', 'Alias', 'CBU/CVU', 'N° Cuenta', 'Sucursal']],
                    body: bankAccounts.map(acc => [ acc.banco, acc.alias || '', acc.cbu_cvu, acc.numero_cuenta || '', acc.sucursal || '' ]),
                    theme: 'striped',
                    headStyles: { fillColor: [0, 113, 188] },
                    styles: { fontSize: 8 },
                });
            }
    
            doc.save(`Pedido-${formData.numero_pedido}.pdf`);
    
        } catch (error) {
            console.error("Error generating PDF:", error);
            showMessage('Error', 'No se pudo generar el PDF.', [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
            ]);
        } finally {
            setIsGeneratingPDF(false);
        }
    };


    if (!isOpen) return null;

    if (isLoading) return <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center"><div className="text-white">Cargando...</div></div>;

    return (
        <>
        <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center p-4">
            <div className="bg-slate-50 rounded-lg shadow-xl w-full max-w-6xl max-h-[95vh] flex flex-col">
                <div className="p-4 border-b flex justify-between items-center bg-white rounded-t-lg">
                    <h2 className="text-xl font-semibold text-primary">{pedidoId ? `Pedido N° ${formData.numero_pedido}`: 'Crear Nuevo Pedido'}</h2>
                    <button onClick={handleClose} className="text-3xl text-gray-400 hover:text-gray-600">&times;</button>
                </div>

                <div className="flex-grow flex-1 flex flex-col md:flex-row overflow-hidden">
                    <div className="flex-1 overflow-y-auto p-6 space-y-6">
                        <fieldset className="p-4 rounded-lg bg-white border space-y-4">
                            <legend className="font-bold text-lg text-primary px-2">1. Datos del Cliente</legend>
                            <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-4 relative">
                                <div>
                                    <label htmlFor="contact-search" className="form-label">Contacto</label>
                                    <input type="text" id="contact-search" className="form-input" value={contactSearchTerm} onChange={handleContactSearch} placeholder="Buscar cliente..." required disabled={isViewOnly || !!pedidoId || !!opportunityData} autoComplete="off" />
                                    {contactResults.length > 0 && (
                                        <div className="absolute z-10 w-full bg-white border mt-1 rounded-md shadow-lg">
                                            {contactResults.map(c => <div key={c.id} onClick={() => selectContact(c)} className="p-2 hover:bg-gray-100 cursor-pointer">{c.nombre}</div>)}
                                        </div>
                                    )}
                                </div>
                                <div>
                                    <label className="form-label">Vendedor</label>
                                    <p className="p-2 bg-gray-100 rounded-md text-sm">{salespeople.find(s => s.id === formData.vendedor_id)?.perfiles.nombre || 'No asignado'}</p>
                                </div>
                                {(formData as any).numero_propuesta_origen && (
                                  <div>
                                    <label className="form-label">N° de Presupuesto de Origen</label>
                                    <p className="p-2 bg-gray-100 rounded-md text-sm">{String((formData as any).numero_propuesta_origen).padStart(4, "0")}</p>
                                  </div>
                                )}
                                 <div className="sm:col-span-2">
                                    <label className="form-label">Fuente de Stock</label>
                                    <div className="flex gap-4 p-2 bg-gray-100 rounded-md">
                                        <label className="flex items-center"><input type="radio" name="stock_source" value="deposito_principal" checked={stockSource === 'deposito_principal'} onChange={e => setStockSource(e.target.value as any)} disabled={isViewOnly} className="h-4 w-4" /><span className="ml-2">Depósito Principal</span></label>
                                        <label className="flex items-center"><input type="radio" name="stock_source" value="stock_vendedor" checked={stockSource === 'stock_vendedor'} onChange={e => setStockSource(e.target.value as any)} disabled={isViewOnly} className="h-4 w-4" /><span className="ml-2">Stock Vendedor</span></label>
                                    </div>
                                    {stockSource === 'deposito_principal' && (
                                        <div className="mt-2 flex items-center gap-2 p-2 bg-blue-50 border border-blue-200 rounded-md text-xs text-blue-800">
                                            <InformationCircleIcon className="w-5 h-5"/>
                                            <span>Este pedido será gestionado y enviado por <strong>Logística</strong>.</span>
                                        </div>
                                    )}
                                </div>
                            </div>
                        </fieldset>

                        <fieldset className="p-4 rounded-lg bg-white border space-y-4">
                             <legend className="font-bold text-lg text-primary px-2">2. Productos del Pedido</legend>
                            <div className="bg-slate-50 p-4 rounded-lg border">
                                <div className="grid grid-cols-1 md:grid-cols-12 gap-4 items-end">
                                    <div className="md:col-span-8">
                                        <label className="form-label">Producto</label>
                                        {!selectedProductInfo ? (
                                            <div className="relative">
                                                <input type="text" value={productSearch} onChange={e => setProductSearch(e.target.value)} className="form-input" placeholder="Buscar producto..." disabled={!currentContact || isViewOnly}/>
                                                {productSuggestions.length > 0 && (
                                                    <div className="absolute z-20 w-full bg-white border mt-1 rounded-md shadow-lg max-h-60 overflow-y-auto">
                                                        {productSuggestions.map((item: { representative: Product; totalStock: number; all_ids: number[] }) => (
                                                            <div key={item.representative.id} onClick={() => handleProductSelect(item)} className="flex justify-between items-center p-2 hover:bg-gray-100 cursor-pointer text-sm">
                                                                <span>{item.representative.nombre}</span>
                                                                <span className="font-semibold text-primary bg-primary-light px-2 py-0.5 rounded-full text-xs">
                                                                    {item.totalStock} disp.
                                                                </span>
                                                            </div>
                                                        ))}
                                                    </div>
                                                )}
                                            </div>
                                        ) : (
                                            <div className="flex items-center justify-between p-2 bg-slate-200 rounded-md">
                                                <div>
                                                    <p className="font-semibold">{selectedProductInfo.name}</p>
                                                    <p className="text-xs text-slate-600 font-medium">Stock disponible: {selectedProductInfo.stock} unidades</p>
                                                </div>
                                                <button type="button" onClick={() => setSelectedProductInfo(null)} className="p-1 rounded-full hover:bg-slate-300"><XMarkIcon className="w-4 h-4 text-slate-700"/></button>
                                            </div>
                                        )}
                                    </div>
                                    <div className="md:col-span-2"><label className="form-label">Cantidad</label><input type="number" value={quantity} onChange={e => setQuantity(parseInt(e.target.value) || 1)} className="form-input text-center" min="1" max={selectedProductInfo?.stock} disabled={!selectedProductInfo || isViewOnly} /></div>
                                    <div className="md:col-span-2"><button type="button" onClick={handleAddProduct} className="btn btn-secondary w-full" disabled={!selectedProductInfo || isViewOnly || quantity > (selectedProductInfo?.stock ?? 0) }>Añadir</button></div>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset className="p-4 rounded-lg bg-white border space-y-4">
                             <legend className="font-bold text-lg text-primary px-2">3. Entrega y Pago</legend>
                             <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-4">
                                 <div className="sm:col-span-2">
                                     <label className="form-label">Dirección / Modalidad Entrega</label>
                                     <div className="mt-2 space-y-2 rounded-md border bg-white p-2">
                                        {addressOptions.map(opt => (
                                            <label key={opt.value} className="flex items-center p-3 rounded-md hover:bg-slate-100 cursor-pointer transition-colors">
                                                <input type="radio" name="delivery_option" value={opt.value} checked={selectedAddress === opt.value} onChange={(e) => handleAddressSelection(e.target.value)} className="h-4 w-4 text-primary focus:ring-primary border-gray-300" disabled={isViewOnly || !currentContact} />
                                                <span className="ml-3 text-sm font-medium text-slate-800">{opt.label}</span>
                                            </label>
                                        ))}
                                     </div>
                                 </div>
                                 {selectedAddress === 'manual' && (
                                    <div className="sm:col-span-2 space-y-2">
                                        <label className="form-label">Dirección Manual</label>
                                        <input type="text" className="form-input" placeholder="Calle y número, Localidad, Provincia" value={formData.direccion_entrega?.full_address || ''} onChange={e => handleManualAddressChange('full_address', e.target.value)} disabled={isViewOnly}/>
                                        <div className="grid grid-cols-2 gap-4">
                                            <input type="text" className="form-input" placeholder="Piso" value={formData.direccion_entrega?.piso || ''} onChange={e => handleManualAddressChange('piso', e.target.value)} disabled={isViewOnly} />
                                            <input type="text" className="form-input" placeholder="Departamento" value={formData.direccion_entrega?.depto || ''} onChange={e => handleManualAddressChange('depto', e.target.value)} disabled={isViewOnly} />
                                        </div>
                                    </div>
                                )}
                                 <div><label className="form-label">Fecha Entrega Prevista</label><input type="date" value={formData.fecha_entrega_prevista || ''} onChange={e => setFormData(p => ({...p, fecha_entrega_prevista: e.target.value}))} className="form-input" disabled={isViewOnly}/></div>
                                 <div><label className="form-label">Franja Horaria</label><input type="text" value={formData.dia_hora_entrega || ''} onChange={e => setFormData(p => ({...p, dia_hora_entrega: e.target.value}))} className="form-input" placeholder="Ej: 9 a 18hs" disabled={isViewOnly}/></div>
                                 <div className="sm:col-span-2"><label className="form-label">Condición de Pago</label><select className="form-input" value={formData.condicion_pago_id || ''} onChange={e => { const val = e.target.value; setFormData(p => ({...p, condicion_pago_id: val ? parseInt(val) : undefined }));}} disabled={isViewOnly}><option value="">Seleccione...</option>{paymentConditions.map(pc => <option key={pc.id} value={pc.id}>{pc.nombre}</option>)}</select></div>
                                 <div className="sm:col-span-2"><label className="form-label">Observaciones</label><textarea rows={2} value={formData.observaciones || ''} onChange={e => setFormData(p => ({...p, observaciones: e.target.value}))} className="form-input" disabled={isViewOnly}></textarea></div>
                             </div>
                        </fieldset>
                    </div>
                    <div className="w-full md:w-[450px] p-6 border-l bg-white space-y-4 overflow-y-auto">
                         <h3 className="font-bold text-lg text-primary">Resumen del Pedido</h3>
                         {currentContact && <div className="flex items-center gap-3 p-3 bg-slate-50 rounded-lg"><Avatar name={currentContact.nombre} /><p className="font-semibold text-sm">{currentContact.nombre}</p></div>}
                         <div className="space-y-2 max-h-[calc(95vh-350px)] overflow-y-auto pr-2">
                            {currentProducts.length === 0 && <p className="text-sm text-gray-500 text-center py-4">No hay productos añadidos.</p>}
                            {currentProducts.map((p, i) => (
                                <div key={`${p.producto_id}-${p.lote_seleccionado_id}-${i}`} className="text-sm border-b pb-2">
                                    <div className="flex justify-between items-start">
                                        <p className="font-semibold">{p.nombre}</p>
                                        <div className="flex items-center gap-2">
                                            <p className="font-semibold">{formatCurrency(p.subtotal)}</p>
                                            {!isViewOnly && <button onClick={() => removeProduct(i)}><TrashIcon className="w-4 h-4 text-red-500"/></button>}
                                        </div>
                                    </div>
                                    <div className="text-xs text-gray-500 mt-1">Lote: {p.lote_numero}</div>
                                    <div className="flex items-center gap-2 mt-2">
                                        <label className="text-xs">Cant:</label>
                                        <input type="number" value={p.cantidad} onChange={e => handleCartItemChange(i, 'cantidad', e.target.value)} className="form-input w-16 text-center p-1 text-sm" disabled={isViewOnly}/>
                                        <label className="text-xs ml-2">Precio:</label>
                                        <input type="number" value={p.precio_unitario.toFixed(2)} onChange={e => handleCartItemChange(i, 'precio_unitario', e.target.value)} className={`form-input w-24 text-right p-1 text-sm ${p.promo_aplicada === 'Precio Manual' ? 'bg-yellow-100' : ''}`} disabled={isViewOnly || !canEditPrice} step="0.01"/>
                                    </div>
                                    {p.promo_aplicada && <div className="text-xs text-green-600 font-semibold mt-1">{p.promo_aplicada}</div>}
                                </div>
                            ))}
                         </div>
                         {pedidoId && (
                         <div className="border-t pt-4">
                            <h3 className="font-semibold text-gray-700 mb-3">Acciones</h3>
                                <div className="space-y-2">
                                    <button type="button" onClick={handleShareTextWhatsApp} disabled={!currentContact?.telefono} className="w-full btn btn-action-blue disabled:opacity-50 disabled:cursor-not-allowed" title={!currentContact?.telefono ? "El contacto no tiene un teléfono" : ""}>
                                        Enviar Texto por WhatsApp
                                    </button>
                                     <button 
                                        type="button" 
                                        onClick={handleGeneratePDF} 
                                        className="w-full btn btn-secondary"
                                        disabled={isGeneratingPDF}
                                    >
                                        {isGeneratingPDF ? 'Generando...' : 'Descargar PDF'}
                                    </button>
                                </div>
                        </div>
                        )}
                         <div className="border-t pt-4 space-y-2">
                             <div className="flex justify-between items-center font-medium">
                                <p>Subtotal Productos</p>
                                <p>{formatCurrency(productsValue)}</p>
                             </div>
                              <div className="flex justify-between items-center font-medium">
                                <div className="flex items-center gap-2">
                                    <p>Costo de Envío</p>
                                    {shippingInfo.isLoading && <span className="text-xs animate-pulse">Calculando...</span>}
                                    {shippingInfo.zoneName && <span className="text-xs bg-slate-200 px-2 py-0.5 rounded-full">{shippingInfo.zoneName}</span>}
                                </div>
                                <input 
                                    type="number" 
                                    value={shippingInfo.cost} 
                                    onChange={(e) => setShippingInfo(s => ({...s, cost: parseFloat(e.target.value) || 0}))} 
                                    className="form-input w-28 text-right p-1 text-sm" 
                                    disabled={isViewOnly}
                                />
                             </div>
                             <div className="flex justify-between items-center text-lg pt-2 border-t">
                                <p className="font-semibold">TOTAL</p>
                                <p className="font-bold text-primary">{formatCurrency(totalValue)}</p>
                            </div>
                         </div>
                    </div>
                </div>

                <div className="p-4 border-t flex justify-between items-center bg-white rounded-b-lg sticky bottom-0">
                    <div>
                        {pedidoId && !isViewOnly && (
                            <button
                                type="button"
                                onClick={handleAnular}
                                className="btn bg-red-100 text-red-700 hover:bg-red-200"
                                disabled={isSaving}
                            >
                                Anular Pedido
                            </button>
                        )}
                    </div>
                    <div className="flex gap-3">
                        <button type="button" onClick={handleClose} className="btn btn-secondary">
                            Cerrar
                        </button>
                        {!isViewOnly && (
                            <button 
                                type="button" 
                                onClick={handleSubmit} 
                                className="btn btn-primary" 
                                disabled={isSaving || !currentContact || currentProducts.length === 0}
                            >
                                {isSaving ? 'Guardando...' : (pedidoId ? 'Actualizar Pedido' : 'Confirmar Pedido')}
                            </button>
                        )}
                    </div>
                </div>
            </div>
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default PedidoModal;