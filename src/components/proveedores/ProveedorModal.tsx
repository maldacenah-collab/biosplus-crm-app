// src/components/proveedores/ProveedorModal.tsx
import React, { useState, useEffect, useRef } from 'react';
import { useProveedorStore } from '../../stores/useProveedorStore';
import { useSharedStore } from '../../stores/useSharedStore';
import { Provider } from '../../types';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface ProveedorModalProps {
  isOpen: boolean;
  onClose: () => void;
  provider: Provider | null;
}

type ProviderContact = { tipo: string; nombre: string; telefono: string; };
type ProviderAccount = { banco: string; alias: string; cbu: string; numero_cuenta: string; sucursal: string; };

const ProveedorModal = ({ isOpen, onClose, provider }: ProveedorModalProps) => {
    const { saveProvider } = useProveedorStore();
    const { paymentConditions } = useSharedStore();
    const [formData, setFormData] = useState<Partial<Provider>>({});
    const [contacts, setContacts] = useState<ProviderContact[]>([]);
    const [accounts, setAccounts] = useState<ProviderAccount[]>([]);
    const [isSaving, setIsSaving] = useState(false);
    const { modalProps, showMessage, hideModal } = useActionModal();

    const addressRef = useRef<HTMLInputElement>(null);

    useEffect(() => {
        if (provider) {
            setFormData({
                id: provider.id,
                nombre: provider.nombre,
                cuit: provider.cuit,
                condicion_pago_id: provider.condicion_pago_id,
                direccion: provider.direccion || { street: '', city: '', province: '', zip: '' },
            });
            setContacts(provider.contactos || []);
            setAccounts(provider.cuentas || []);
        } else {
            setFormData({
                direccion: { street: '', city: '', province: '', zip: '' }
            });
            setContacts([]);
            setAccounts([]);
        }
    }, [provider]);

    const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const handleAddressChange = (field: keyof Provider['direccion'], value: string) => {
        setFormData(prev => ({ ...prev, direccion: { ...prev.direccion, [field]: value } }));
    }

    const handleDynamicListChange = <T,>(list: T[], setList: React.Dispatch<React.SetStateAction<T[]>>, index: number, field: keyof T, value: string) => {
        const newList = [...list];
        newList[index] = { ...newList[index], [field]: value };
        setList(newList);
    };

    const addToList = <T,>(setList: React.Dispatch<React.SetStateAction<T[]>>, newItem: T) => {
        setList(prev => [...prev, newItem]);
    };

    const removeFromList = <T,>(setList: React.Dispatch<React.SetStateAction<T[]>>, index: number) => {
        setList(prev => prev.filter((_, i) => i !== index));
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setIsSaving(true);
        try {
            // Fix: Correctly map local state variables `contacts` and `accounts` to the `contactos` and `cuentas` properties.
            await saveProvider({ ...formData, contactos: contacts, cuentas: accounts });
            onClose();
        } catch (error) {
            showMessage('Error', 'No se pudo guardar el proveedor.', [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
            ]);
        } finally {
            setIsSaving(false);
        }
    };
    
    if (!isOpen) return null;

    return (
        <>
        <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center p-4">
            <div className="bg-white rounded-lg shadow-xl w-full max-w-4xl max-h-[95vh] flex flex-col">
                <div className="p-4 border-b flex justify-between items-center">
                    <h2 className="text-xl font-semibold">{provider ? 'Editar Proveedor' : 'Crear Proveedor'}</h2>
                    <button onClick={onClose}>&times;</button>
                </div>
                <form onSubmit={handleSubmit} className="flex-grow overflow-y-auto p-6 space-y-6">
                    {/* General Info */}
                    <fieldset className="p-4 border rounded-lg space-y-4">
                        <legend className="font-semibold px-2">Información General</legend>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div><label className="form-label">Nombre</label><input name="nombre" value={formData.nombre || ''} onChange={handleChange} className="form-input" required /></div>
                            <div><label className="form-label">CUIT</label><input name="cuit" value={formData.cuit || ''} onChange={handleChange} className="form-input" /></div>
                            <div><label className="form-label">Condición de Pago</label><select name="condicion_pago_id" value={formData.condicion_pago_id || ''} onChange={handleChange} className="form-input"><option value="">Ninguna</option>{paymentConditions.map(pc => <option key={pc.id} value={pc.id}>{pc.nombre}</option>)}</select></div>
                        </div>
                    </fieldset>
                    
                    {/* Address */}
                    <fieldset className="p-4 border rounded-lg space-y-4">
                        <legend className="font-semibold px-2">Dirección</legend>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div className="md:col-span-2"><label className="form-label">Calle y Número</label><input ref={addressRef} value={formData.direccion?.street || ''} onChange={e => handleAddressChange('street', e.target.value)} className="form-input" /></div>
                            <div><label className="form-label">Ciudad</label><input value={formData.direccion?.city || ''} onChange={e => handleAddressChange('city', e.target.value)} className="form-input" /></div>
                            <div><label className="form-label">Provincia</label><input value={formData.direccion?.province || ''} onChange={e => handleAddressChange('province', e.target.value)} className="form-input" /></div>
                            <div><label className="form-label">Código Postal</label><input value={formData.direccion?.zip || ''} onChange={e => handleAddressChange('zip', e.target.value)} className="form-input" /></div>
                        </div>
                    </fieldset>

                    {/* Contacts */}
                    <fieldset className="p-4 border rounded-lg">
                        <legend className="font-semibold px-2">Contactos</legend>
                        <div className="space-y-2">
                            {contacts.map((contact, index) => (
                                <div key={index} className="grid grid-cols-12 gap-2 items-center">
                                    <input placeholder="Tipo (Ventas)" value={contact.tipo} onChange={e => handleDynamicListChange(contacts, setContacts, index, 'tipo', e.target.value)} className="form-input col-span-3"/>
                                    <input placeholder="Nombre" value={contact.nombre} onChange={e => handleDynamicListChange(contacts, setContacts, index, 'nombre', e.target.value)} className="form-input col-span-4"/>
                                    <input placeholder="Teléfono" value={contact.telefono} onChange={e => handleDynamicListChange(contacts, setContacts, index, 'telefono', e.target.value)} className="form-input col-span-4"/>
                                    <button type="button" onClick={() => removeFromList(setContacts, index)} className="text-red-500 col-span-1 text-center font-bold text-xl">&times;</button>
                                </div>
                            ))}
                        </div>
                        <button type="button" onClick={() => addToList(setContacts, { tipo: '', nombre: '', telefono: '' })} className="btn-secondary text-xs mt-4">Añadir Contacto</button>
                    </fieldset>

                    {/* Bank Accounts */}
                    <fieldset className="p-4 border rounded-lg">
                        <legend className="font-semibold px-2">Cuentas Bancarias</legend>
                        <div className="space-y-2">
                            {accounts.map((account, index) => (
                                <div key={index} className="grid grid-cols-12 gap-2 items-center text-sm p-2 rounded bg-gray-50 border">
                                    <input placeholder="Banco" value={account.banco} onChange={e => handleDynamicListChange(accounts, setAccounts, index, 'banco', e.target.value)} className="form-input col-span-3"/>
                                    <input placeholder="Alias" value={account.alias} onChange={e => handleDynamicListChange(accounts, setAccounts, index, 'alias', e.target.value)} className="form-input col-span-3"/>
                                    <input placeholder="CBU" value={account.cbu} onChange={e => handleDynamicListChange(accounts, setAccounts, index, 'cbu', e.target.value)} className="form-input col-span-5"/>
                                    <button type="button" onClick={() => removeFromList(setAccounts, index)} className="text-red-500 col-span-1 text-center font-bold text-xl">&times;</button>
                                </div>
                            ))}
                        </div>
                        <button type="button" onClick={() => addToList(setAccounts, { banco: '', alias: '', cbu: '', numero_cuenta: '', sucursal: ''})} className="btn-secondary text-xs mt-4">Añadir Cuenta</button>
                    </fieldset>

                </form>
                <div className="p-4 border-t flex justify-end gap-2">
                    <button onClick={onClose} className="btn btn-secondary">Cancelar</button>
                    <button onClick={handleSubmit} className="btn btn-primary" disabled={isSaving}>{isSaving ? 'Guardando...' : 'Guardar'}</button>
                </div>
            </div>
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default ProveedorModal;
