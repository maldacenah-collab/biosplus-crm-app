// src/components/contacts/ContactModal.tsx
// Modal para crear o editar un contacto.
// Fix: The reference to google maps types is removed as the types package is not available in the environment.
// The necessary types are now declared globally in the `vite-env.d.ts` file.

// Fix: Import React to resolve "Cannot find namespace 'React'" errors.
import React, { useEffect, useState, useRef, useCallback } from 'react';
import { useContactStore } from '../../stores/useContactStore';
import { useSharedStore } from '../../stores/useSharedStore';
import { useZonasEnvioStore } from '../../stores/useZonasEnvioStore';
import { Contact } from '../../types';

interface ContactModalProps {
  isOpen: boolean;
  onClose: () => void;
  contact: Contact | null;
}

const availableEspecialidades = [
    "Dermatología", "Cirugía Plástica", "Medicina Regenerativa", "Flebología",
    "Ginecología Estética", "Nutrición", "Kinesiología", "Cosmiatría", "Traumatología"
];

// Function to load Google Maps script
const loadGoogleMapsScript = (apiKey: string, callback: () => void, onError: () => void) => {
  // Check if script is already loaded
  if (window.google && window.google.maps && window.google.maps.places) {
    callback();
    return;
  }

  // Check if script is already being loaded to avoid duplicates
  const existingScript = document.querySelector('script[src*="maps.googleapis.com"]');
  if (existingScript) {
    const onScriptLoad = () => {
      callback();
      existingScript.removeEventListener('load', onScriptLoad);
    };
    existingScript.addEventListener('load', onScriptLoad);
    return;
  }

  const script = document.createElement('script');
  script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}&libraries=places`;
  script.async = true;
  script.defer = true;
  script.onload = () => {
    callback();
  };
  script.onerror = () => {
    console.error("Google Maps script failed to load.");
    onError();
  };
  document.head.appendChild(script);
};


const ContactModal = ({ isOpen, onClose, contact }: ContactModalProps) => {
  const { saveContact } = useContactStore();
  const { salespeople, statuses, paymentConditions } = useSharedStore();
  const { zonas, fetchZonas } = useZonasEnvioStore();
  const [initialData, setInitialData] = useState<string>(''); // For dirty check
  const [formData, setFormData] = useState<Partial<Contact>>({});
  const [especialidades, setEspecialidades] = useState<string[]>([]);
  const [isDirty, setIsDirty] = useState(false);
  const [apiKeyError, setApiKeyError] = useState(false);
  
  const billingStreetRef = useRef<HTMLInputElement>(null);
  const deliveryStreetRef = useRef<HTMLInputElement>(null);
  const delivery2StreetRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    if (isOpen) {
        const initialContactData: Partial<Contact> = contact || {};
        const fullInitialData = {
            ...initialContactData,
            domicilio_fiscal: initialContactData.domicilio_fiscal || { full_address: '', piso: '', depto: '', zip: '' },
            direccion_entrega: initialContactData.direccion_entrega || { full_address: '', days: '', hours: '', piso: '', depto: '', zip: '' },
            direccion_entrega_2: initialContactData.direccion_entrega_2 || { full_address: '', days: '', hours: '', piso: '', depto: '', zip: '' },
            especialidades: initialContactData.especialidades || [],
        };
        setFormData(fullInitialData);
        setEspecialidades(fullInitialData.especialidades || []);
        setInitialData(JSON.stringify(fullInitialData));
        setIsDirty(false);
        fetchZonas();
    }
  }, [contact, isOpen, fetchZonas]);
  
  useEffect(() => {
    if (!isOpen) return;
    const currentData = JSON.stringify({ ...formData, especialidades });
    setIsDirty(currentData !== initialData);
  }, [formData, especialidades, initialData, isOpen]);

  const handleClose = () => {
    if (isDirty && !window.confirm('Tienes cambios sin guardar. ¿Estás seguro de que quieres salir?')) {
      return;
    }
    onClose();
  };

  useEffect(() => {
    const handleBeforeUnload = (e: BeforeUnloadEvent) => {
      if (isDirty) {
        e.preventDefault();
        e.returnValue = ''; // Standard for most browsers
      }
    };

    if (isOpen) {
      window.addEventListener('beforeunload', handleBeforeUnload);
    }

    return () => {
      window.removeEventListener('beforeunload', handleBeforeUnload);
    };
  }, [isDirty, isOpen]);

  const fillInAddress = useCallback(async (place: google.maps.places.PlaceResult, fieldPrefix: 'domicilio_fiscal' | 'direccion_entrega' | 'direccion_entrega_2') => {
    let route = '', streetNumber = '', city = '', province = '', postalCode = '';
    for (const component of place.address_components || []) {
        const type = component.types[0];
        if (type === "route") route = component.long_name;
        if (type === "street_number") streetNumber = component.long_name;
        if (type === "locality") city = component.long_name;
        if (type === "administrative_area_level_1") province = component.long_name;
        if (type === 'postal_code') postalCode = component.long_name;
    }
    const fullAddress = `${route} ${streetNumber}, ${city}, ${province}`.replace(/^ ,|, $/g, '').trim();
    
    setFormData(prev => ({
        ...prev,
        [fieldPrefix]: { ...prev[fieldPrefix], full_address: fullAddress, zip: postalCode },
    }));

  }, []);

  useEffect(() => {
    const initAutocomplete = () => {
      if (!window.google || !window.google.maps || !window.google.maps.places) {
        setApiKeyError(true);
        return;
      }
      if (!isOpen || !billingStreetRef.current || !deliveryStreetRef.current || !delivery2StreetRef.current) {
        return;
      }
      const options = { componentRestrictions: { country: "ar" }, fields: ["address_components", "geometry"], types: ["address"] };
      
      const billingAutocomplete = new window.google.maps.places.Autocomplete(billingStreetRef.current, options);
      billingAutocomplete.addListener("place_changed", () => fillInAddress(billingAutocomplete.getPlace(), 'domicilio_fiscal'));

      const deliveryAutocomplete = new window.google.maps.places.Autocomplete(deliveryStreetRef.current, options);
      deliveryAutocomplete.addListener("place_changed", () => fillInAddress(deliveryAutocomplete.getPlace(), 'direccion_entrega'));

      const delivery2Autocomplete = new window.google.maps.places.Autocomplete(delivery2StreetRef.current, options);
      delivery2Autocomplete.addListener("place_changed", () => fillInAddress(delivery2Autocomplete.getPlace(), 'direccion_entrega_2'));
    };

    if (isOpen) {
        let apiKey = import.meta.env.VITE_GOOGLE_MAPS_API_KEY;
        if (!apiKey || apiKey.length < 30) {
            console.error("Google Maps API Key is missing, invalid, or is a placeholder.");
            setApiKeyError(true);
            return;
        }
        if (apiKey.includes('TU_CLAVE_DE_API_DE_GOOGLE_MAPS')) {
            apiKey = "";
        }
        loadGoogleMapsScript(apiKey, initAutocomplete, () => setApiKeyError(true));
    }
  }, [isOpen, fillInAddress]);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement>) => {
    const { name, value, type } = e.target;
    const checked = (e.target as HTMLInputElement).checked;

    let processedValue: any = value;
    // For all foreign key fields, convert empty string to null to avoid DB errors (like sending 0).
    if (name.endsWith('_id')) {
      processedValue = value === '' ? null : parseInt(value, 10);
    }
    
    setFormData(prev => ({ ...prev, [name]: type === 'checkbox' ? checked : processedValue }));
  };

  const handleAddressChange = (addressType: 'domicilio_fiscal' | 'direccion_entrega' | 'direccion_entrega_2', field: 'full_address' | 'days' | 'hours' | 'piso' | 'depto' | 'zip', value: string) => {
    setFormData(prev => ({ ...prev, [addressType]: { ...(prev[addressType] || {}), [field]: value } as any }));
  };
  
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const { estados, vendedores, ...dataToSave } = formData;
      await saveContact({ ...dataToSave, especialidades });
      setIsDirty(false); // Reset dirty state before closing
      onClose(); // Use original onClose, not the wrapped one
    } catch (error) {
      console.error("Failed to save contact:", error);
    }
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center p-4">
      <div className="bg-white rounded-lg shadow-xl w-full max-w-3xl max-h-[90vh] flex flex-col">
        <div className="p-4 border-b flex justify-between items-center">
          <h2 className="text-xl font-semibold">{contact ? 'Editar Contacto' : 'Crear Contacto'}</h2>
          <button onClick={handleClose} className="text-3xl font-light text-gray-500 hover:text-gray-800">&times;</button>
        </div>
        <form onSubmit={handleSubmit} id="contact-form-modal" className="flex-grow overflow-y-auto p-6 space-y-6">
            <fieldset className="p-4 rounded-lg bg-slate-50 border space-y-4">
                <legend className="font-semibold text-gray-700 px-2">Información Principal</legend>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-4">
                    <div><label htmlFor="nombre" className="form-label">Nombre de Fantasía</label><input type="text" name="nombre" id="nombre" className="form-input" value={formData.nombre || ''} onChange={handleChange} required /></div>
                    <div><label htmlFor="telefono" className="form-label">Teléfono</label><input type="tel" name="telefono" id="telefono" className="form-input" value={formData.telefono || ''} onChange={handleChange}/></div>
                    <div className="sm:col-span-2"><label htmlFor="email" className="form-label">Email</label><input type="email" name="email" id="email" className="form-input" value={formData.email || ''} onChange={handleChange}/></div>
                    <div><label htmlFor="vendedor_id" className="form-label">Vendedor Asignado</label><select name="vendedor_id" id="vendedor_id" className="form-input" value={formData.vendedor_id || ''} onChange={handleChange}><option value="">Sin Asignar</option>{salespeople.map(s => <option key={s.id} value={s.id}>{s.perfiles.nombre}</option>)}</select></div>
                    <div><label htmlFor="estado_id" className="form-label">Estado</label><select name="estado_id" id="estado_id" className="form-input" value={formData.estado_id || ''} onChange={handleChange}><option value="">Seleccionar...</option>{statuses.map(s => <option key={s.id} value={s.id}>{s.nombre}</option>)}</select></div>
                </div>
            </fieldset>

            <fieldset className="p-4 rounded-lg bg-slate-50 border space-y-4">
                <legend className="font-semibold text-gray-700 px-2">Segmentación y Perfil</legend>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-4">
                    <div><label htmlFor="clasificacion" className="form-label">Clasificación</label><select name="clasificacion" id="clasificacion" className="form-input" value={formData.clasificacion || ''} onChange={handleChange}><option value="">Seleccionar...</option><option>A</option><option>B</option><option>C</option></select></div>
                    <div><label htmlFor="profesion" className="form-label">Profesión</label><select name="profesion" id="profesion" className="form-input" value={formData.profesion || ''} onChange={handleChange}><option value="">Seleccionar...</option><option>Médico Esteticista</option><option>Odontólogo</option><option>Cosmiatra</option><option>Kinesiólogo</option></select></div>
                    <div><label htmlFor="condicion_pago_id" className="form-label">Condición de Pago</label><select name="condicion_pago_id" id="condicion_pago_id" className="form-input" value={formData.condicion_pago_id || ''} onChange={handleChange}><option value="">Ninguna</option>{paymentConditions.map(c => <option key={c.id} value={c.id}>{c.nombre}</option>)}</select></div>
                    <div>
                        <label htmlFor="zona" className="form-label">Zona de Envío</label>
                        <select name="zona" id="zona" className="form-input" value={formData.zona || ''} onChange={handleChange}>
                            <option value="">Seleccionar Zona...</option>
                            {zonas.map(z => (
                                <option key={z.id} value={z.nombre}>{z.nombre}</option>
                            ))}
                        </select>
                    </div>
                </div>
                {formData.profesion === 'Médico Esteticista' && (
                    <div>
                        <label className="form-label">Especialidades</label>
                        <div className="flex flex-wrap gap-2 p-2 border rounded-md min-h-[42px] bg-white">
                            {especialidades.map(esp => <span key={esp} className="bg-blue-100 text-blue-800 text-sm font-medium px-2.5 py-1 rounded-full flex items-center">{esp}<button type="button" onClick={() => setEspecialidades(e => e.filter(item => item !== esp))} className="ml-2 text-blue-600 hover:text-blue-800">&times;</button></span>)}
                        </div>
                        <select className="form-input mt-2" onChange={e => !especialidades.includes(e.target.value) && setEspecialidades(prev => [...prev, e.target.value])} value="">
                            <option value="">Añadir especialidad...</option>
                            {availableEspecialidades.filter(opt => !especialidades.includes(opt)).map(opt => <option key={opt} value={opt}>{opt}</option>)}
                        </select>
                    </div>
                )}
                <div><label htmlFor="productos_habituales" className="form-label">Productos de Interés</label><textarea name="productos_habituales" id="productos_habituales" className="form-input" rows={2} value={formData.productos_habituales || ''} onChange={handleChange}></textarea></div>
            </fieldset>

            <fieldset className="p-4 rounded-lg bg-slate-50 border space-y-4">
                <legend className="font-semibold text-gray-700 px-2">Datos Fiscales</legend>
                 {apiKeyError && <div className="p-2 bg-yellow-100 text-yellow-800 text-xs rounded-md mb-2">La función de autocompletar dirección está deshabilitada. Revisa la configuración de la clave de API de Google Maps.</div>}
                 <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-4">
                    <div className="sm:col-span-2"><label htmlFor="razon_social" className="form-label">Razón Social</label><input type="text" name="razon_social" id="razon_social" value={formData.razon_social || ''} onChange={handleChange} className="form-input" /></div>
                    <div><label htmlFor="cuit" className="form-label">CUIT (11 dígitos)</label><input type="text" name="cuit" id="cuit" value={formData.cuit || ''} onChange={handleChange} className="form-input" maxLength={11} /></div>
                    <div><label htmlFor="condicion_iva" className="form-label">Condición IVA</label><select name="condicion_iva" id="condicion_iva" value={formData.condicion_iva || ''} onChange={handleChange} className="form-input"><option value="">Seleccionar...</option><option>Responsable Inscripto</option><option>Monotributista</option><option>Consumidor Final</option><option>Exento</option></select></div>
                    <div className="sm:col-span-2 space-y-2">
                        <label htmlFor="domicilio_fiscal.full_address" className="form-label">Domicilio Fiscal Completo</label>
                        <input type="text" ref={billingStreetRef} name="domicilio_fiscal.full_address" id="domicilio_fiscal.full_address" value={formData.domicilio_fiscal?.full_address || ''} onChange={e => handleAddressChange('domicilio_fiscal', 'full_address', e.target.value)} className="form-input" />
                        <div className="grid grid-cols-3 gap-4">
                            <input type="text" name="domicilio_fiscal.piso" placeholder="Piso" value={formData.domicilio_fiscal?.piso || ''} onChange={e => handleAddressChange('domicilio_fiscal', 'piso', e.target.value)} className="form-input" />
                            <input type="text" name="domicilio_fiscal.depto" placeholder="Dpto." value={formData.domicilio_fiscal?.depto || ''} onChange={e => handleAddressChange('domicilio_fiscal', 'depto', e.target.value)} className="form-input" />
                             <input type="text" name="domicilio_fiscal.zip" placeholder="CP" value={formData.domicilio_fiscal?.zip || ''} onChange={e => handleAddressChange('domicilio_fiscal', 'zip', e.target.value)} className="form-input bg-gray-200" readOnly />
                        </div>
                    </div>
                    <div className="sm:col-span-2 flex items-center gap-4 pt-2">
                        <label className="flex items-center"><input name="requiere_factura" id="requiere_factura" type="checkbox" checked={formData.requiere_factura || false} onChange={handleChange} className="h-4 w-4 rounded" /><span className="ml-2 text-sm text-gray-700">Requiere Factura A</span></label>
                        <div className="flex items-center gap-2"><label htmlFor="porcentaje_facturacion_preferido" className="text-sm text-gray-700">Facturar al:</label><input type="number" name="porcentaje_facturacion_preferido" id="porcentaje_facturacion_preferido" value={formData.porcentaje_facturacion_preferido || ''} onChange={handleChange} className="form-input w-24" placeholder="100" />%</div>
                    </div>
                </div>
            </fieldset>

            <fieldset className="p-4 rounded-lg bg-slate-50 border space-y-4">
                <legend className="font-semibold text-gray-700 px-2">Direcciones de Entrega</legend>
                 {apiKeyError && <div className="p-2 bg-yellow-100 text-yellow-800 text-xs rounded-md mb-2">La función de autocompletar dirección está deshabilitada. Revisa la configuración de la clave de API de Google Maps.</div>}
                <div className="space-y-4 pt-2">
                    <div className="space-y-2">
                        <div className="flex justify-between items-center">
                            <label htmlFor="direccion_entrega.full_address" className="form-label">Domicilio de Entrega Principal</label>
                            <button type="button" onClick={() => setFormData(p => ({...p, direccion_entrega: { ...(p.direccion_entrega || {}), full_address: p.domicilio_fiscal?.full_address || '', piso: p.domicilio_fiscal?.piso || '', depto: p.domicilio_fiscal?.depto || '', zip: p.domicilio_fiscal?.zip || '' }}))} className="text-xs bg-gray-200 px-2 py-1 rounded hover:bg-gray-300">Copiar Domicilio Fiscal</button>
                        </div>
                        <input type="text" ref={deliveryStreetRef} name="direccion_entrega.full_address" id="direccion_entrega.full_address" value={formData.direccion_entrega?.full_address || ''} onChange={e => handleAddressChange('direccion_entrega', 'full_address', e.target.value)} className="form-input" />
                        <div className="grid grid-cols-3 gap-4">
                            <input type="text" name="direccion_entrega.piso" placeholder="Piso" value={formData.direccion_entrega?.piso || ''} onChange={e => handleAddressChange('direccion_entrega', 'piso', e.target.value)} className="form-input" />
                            <input type="text" name="direccion_entrega.depto" placeholder="Dpto." value={formData.direccion_entrega?.depto || ''} onChange={e => handleAddressChange('direccion_entrega', 'depto', e.target.value)} className="form-input" />
                            <input type="text" name="direccion_entrega.zip" placeholder="CP" value={formData.direccion_entrega?.zip || ''} onChange={e => handleAddressChange('direccion_entrega', 'zip', e.target.value)} className="form-input bg-gray-200" readOnly />
                        </div>
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div><label htmlFor="direccion_entrega.days" className="form-label">Días</label><input type="text" name="direccion_entrega.days" id="direccion_entrega.days" value={formData.direccion_entrega?.days || ''} onChange={e => handleAddressChange('direccion_entrega', 'days', e.target.value)} className="form-input" placeholder="L a V" /></div>
                            <div><label htmlFor="direccion_entrega.hours" className="form-label">Horarios</label><input type="text" name="direccion_entrega.hours" id="direccion_entrega.hours" value={formData.direccion_entrega?.hours || ''} onChange={e => handleAddressChange('direccion_entrega', 'hours', e.target.value)} className="form-input" placeholder="9 a 18hs" /></div>
                        </div>
                    </div>
                    <div className="space-y-2 pt-4 border-t">
                        <label htmlFor="direccion_entrega_2.full_address" className="form-label">Domicilio de Entrega Alternativo</label>
                        <input type="text" ref={delivery2StreetRef} name="direccion_entrega_2.full_address" id="direccion_entrega_2.full_address" value={formData.direccion_entrega_2?.full_address || ''} onChange={e => handleAddressChange('direccion_entrega_2', 'full_address', e.target.value)} className="form-input" />
                        <div className="grid grid-cols-3 gap-4">
                            <input type="text" name="direccion_entrega_2.piso" placeholder="Piso" value={formData.direccion_entrega_2?.piso || ''} onChange={e => handleAddressChange('direccion_entrega_2', 'piso', e.target.value)} className="form-input" />
                            <input type="text" name="direccion_entrega_2.depto" placeholder="Dpto." value={formData.direccion_entrega_2?.depto || ''} onChange={e => handleAddressChange('direccion_entrega_2', 'depto', e.target.value)} className="form-input" />
                            <input type="text" name="direccion_entrega_2.zip" placeholder="CP" value={formData.direccion_entrega_2?.zip || ''} onChange={e => handleAddressChange('direccion_entrega_2', 'zip', e.target.value)} className="form-input bg-gray-200" readOnly />
                        </div>
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                             <div><label htmlFor="direccion_entrega_2.days" className="form-label">Días</label><input type="text" name="direccion_entrega_2.days" id="direccion_entrega_2.days" value={formData.direccion_entrega_2?.days || ''} onChange={e => handleAddressChange('direccion_entrega_2', 'days', e.target.value)} className="form-input" /></div>
                            <div><label htmlFor="direccion_entrega_2.hours" className="form-label">Horarios</label><input type="text" name="direccion_entrega_2.hours" id="direccion_entrega_2.hours" value={formData.direccion_entrega_2?.hours || ''} onChange={e => handleAddressChange('direccion_entrega_2', 'hours', e.target.value)} className="form-input" /></div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </form>
        <div className="p-4 border-t flex justify-end gap-3">
          <button type="button" onClick={handleClose} className="btn btn-secondary">Cancelar</button>
          <button type="submit" form="contact-form-modal" className="btn btn-primary">Guardar Cambios</button>
        </div>
      </div>
    </div>
  );
};

export default ContactModal;