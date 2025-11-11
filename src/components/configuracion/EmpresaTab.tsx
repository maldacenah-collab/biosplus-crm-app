// src/components/configuracion/EmpresaTab.tsx
// Fix: Import 'React' to resolve "Cannot find namespace 'React'" error, which is necessary for using types like React.ChangeEvent.
import React, { useEffect, useState, useRef } from 'react';
import { useSharedStore } from '../../stores/useSharedStore';
import { supabase } from '../../services/supabase';
import { BankAccount } from '../../types';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

const EmpresaTab = () => {
  const { sharedConfig, bankAccounts, fetchConfig, saveConfig, fetchBankAccounts, addBankAccount, deleteBankAccount } = useSharedStore();
  const { modalProps, showMessage, hideModal } = useActionModal();
  
  const [logoFile, setLogoFile] = useState<File | null>(null);
  const [logoPreview, setLogoPreview] = useState<string | null>(null);
  const [companyData, setCompanyData] = useState<Record<string, any>>({});
  const [newAccount, setNewAccount] = useState<Partial<BankAccount>>({});

  const addressRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    fetchConfig();
    fetchBankAccounts();
  }, [fetchConfig, fetchBankAccounts]);

  useEffect(() => {
    setCompanyData(sharedConfig);
    setLogoPreview(sharedConfig.logo_url || null);
  }, [sharedConfig]);

  const handleLogoChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files[0]) {
      const file = e.target.files[0];
      setLogoFile(file);
      const reader = new FileReader();
      reader.onloadend = () => {
        setLogoPreview(reader.result as string);
      };
      reader.readAsDataURL(file);
    }
  };

  const handleSaveLogo = async () => {
    if (!logoFile) {
      showMessage('Archivo requerido', 'Seleccione un archivo primero.');
      return;
    }
    const filePath = `public/logo_${Date.now()}`;
    const { error } = await supabase.storage.from('assets').upload(filePath, logoFile, {
      cacheControl: '3600',
      upsert: true,
    });
    if (error) {
      showMessage('Error', `Error al subir el logo: ${error.message}`, [
        { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
      ]);
      return;
    }
    
    const { data } = supabase.storage.from('assets').getPublicUrl(filePath);
    await saveConfig({ logo_url: data.publicUrl });
    showMessage('Logo guardado', 'Logo guardado con éxito.', [
      { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
    ]);
  };

  const handleCompanyDataChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setCompanyData(prev => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleSaveCompanyData = async () => {
    await saveConfig(companyData);
    showMessage('Datos guardados', 'Datos de la empresa guardados.', [
      { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
    ]);
  };
  
  const handleNewAccountChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setNewAccount(prev => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleAddAccount = async () => {
    if (!newAccount.banco || !newAccount.cbu_cvu) {
        showMessage('Datos incompletos', 'El nombre del banco y el CBU son obligatorios.', [
          { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
        ]);
        return;
    }
    await addBankAccount(newAccount as Omit<BankAccount, 'id'>);
    setNewAccount({});
    showMessage('Cuenta añadida', 'Cuenta añadida.', [
      { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
    ]);
  };

  return (
    <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
        <div className="space-y-8">
            <div className="bg-white p-6 rounded-lg shadow-md">
                <h2 className="text-xl font-semibold mb-4">Logotipo del Laboratorio</h2>
                {logoPreview && <img src={logoPreview} alt="Vista previa" className="h-20 mb-4 border p-2 rounded-md" />}
                <input type="file" onChange={handleLogoChange} accept="image/*" className="form-input" />
                <button onClick={handleSaveLogo} className="btn btn-primary mt-4">Guardar Logo</button>
            </div>
            <div className="bg-white p-6 rounded-lg shadow-md">
                <h2 className="text-xl font-semibold mb-4">Datos de la Empresa</h2>
                <div className="space-y-4">
                    <div><label className="form-label">Nombre / Razón Social</label><input name="empresa_nombre" value={companyData.empresa_nombre || ''} onChange={handleCompanyDataChange} className="form-input" /></div>
                    <div><label className="form-label">CUIT</label><input name="empresa_cuit" value={companyData.empresa_cuit || ''} onChange={handleCompanyDataChange} className="form-input" /></div>
                    <div><label className="form-label">Dirección (con predictivo)</label><input ref={addressRef} name="empresa_direccion" value={companyData.empresa_direccion || ''} onChange={handleCompanyDataChange} className="form-input" /></div>
                    <div><label className="form-label">WhatsApp de Logística</label><input name="logistica_whatsapp" value={companyData.logistica_whatsapp || ''} onChange={handleCompanyDataChange} className="form-input" /></div>
                    <button onClick={handleSaveCompanyData} className="btn btn-primary">Guardar Datos</button>
                </div>
            </div>
        </div>
        <div className="bg-white p-6 rounded-lg shadow-md">
            <h2 className="text-xl font-semibold mb-4">Cuentas Bancarias</h2>
            <div className="space-y-6">
                <fieldset className="p-4 rounded-lg bg-slate-50 border space-y-4">
                    <legend className="font-semibold text-gray-700 px-2">Añadir Nueva Cuenta</legend>
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div><label className="form-label text-sm">Nombre del Banco</label><input name="banco" value={newAccount.banco || ''} onChange={handleNewAccountChange} className="form-input" /></div>
                        <div><label className="form-label text-sm">Alias</label><input name="alias" value={newAccount.alias || ''} onChange={handleNewAccountChange} className="form-input" /></div>
                        <div className="sm:col-span-2"><label className="form-label text-sm">CBU / CVU (22 dígitos)</label><input name="cbu_cvu" value={newAccount.cbu_cvu || ''} onChange={handleNewAccountChange} className="form-input" maxLength={22} /></div>
                        <div><label className="form-label text-sm">Número de Cuenta</label><input name="numero_cuenta" value={newAccount.numero_cuenta || ''} onChange={handleNewAccountChange} className="form-input" /></div>
                        <div><label className="form-label text-sm">Sucursal</label><input name="sucursal" value={newAccount.sucursal || ''} onChange={handleNewAccountChange} className="form-input" /></div>
                    </div>
                     <div className="text-right"><button onClick={handleAddAccount} className="btn btn-primary text-sm">Añadir Cuenta</button></div>
                </fieldset>
                 <div>
                    <h3 className="font-semibold text-gray-700 mb-2">Cuentas Guardadas</h3>
                    <div className="space-y-2 max-h-60 overflow-y-auto">
                        {bankAccounts.map(acc => (
                            <div key={acc.id} className="p-3 border rounded-md text-sm relative">
                                <p><strong>{acc.banco}</strong></p>
                                <p>Alias: {acc.alias}</p>
                                <p>CBU/CVU: {acc.cbu_cvu}</p>
                                <button onClick={() => deleteBankAccount(acc.id)} className="absolute top-2 right-2 text-red-500 text-xl">&times;</button>
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        </div>
        <ActionModal {...modalProps} />
    </div>
  );
};

export default EmpresaTab;
