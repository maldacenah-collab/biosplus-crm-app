// src/components/configuracion/PerfilModal.tsx
// Fix: Import 'React' to resolve "Cannot find namespace 'React'" error, which is necessary for using types like React.ChangeEvent.
import React, { useEffect, useState } from 'react';
import { useSharedStore } from '../../stores/useSharedStore';
import * as configApi from '../../services/configApi';
import { Perfil, VendedorData } from '../../types';
import { supabase } from '../../services/supabase';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface PerfilModalProps {
  userId: string | null;
  onClose: () => void;
}

const PerfilModal = ({ userId, onClose }: PerfilModalProps) => {
  const { roles: allRoles, fetchPerfiles, currentUser } = useSharedStore();
  const [isSaving, setIsSaving] = useState(false);
  const [perfilData, setPerfilData] = useState<Partial<Perfil>>({});
  const [vendedorData, setVendedorData] = useState<Partial<VendedorData>>({});
  const [isVendedor, setIsVendedor] = useState(false);
  const [password, setPassword] = useState('');
  const [passwordConfirm, setPasswordConfirm] = useState('');
  const { modalProps, showMessage, hideModal } = useActionModal();

  useEffect(() => {
    async function loadUser() {
        if (userId) {
            const perfil = await configApi.getPerfilById(userId);
            if (perfil) {
                setPerfilData(perfil);
                setVendedorData(perfil.vendedores || {});
                const esVendedorActual = perfil.usuario_roles?.some(ur => ur.roles.nombre_rol === 'Vendedor');
                setIsVendedor(esVendedorActual || !!perfil.vendedores);
            }
        } else {
            // Default for new user
            setPerfilData({});
            setVendedorData({});
            setIsVendedor(true); // Default to being a seller
        }
    }
    loadUser();
  }, [userId]);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setPerfilData(prev => ({...prev, [name]: value}));
  }

  const handleVendedorChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setVendedorData(prev => ({...prev, [name]: value}));
  }

  const handleSave = async () => {
    setIsSaving(true);

    if(!userId) { // --- CREATING a new user ---
        if (password !== passwordConfirm || !password || password.length < 6) {
            showMessage('Contraseña inválida', 'Las contraseñas no coinciden o tienen menos de 6 caracteres.', [
                { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
            ]);
            setIsSaving(false);
            return;
        }

        try {
            const newUserOrgId = currentUser?.modo_creacion_organizacion_id ?? currentUser?.organizacion_id;
            if (!newUserOrgId) {
                throw new Error("Error: No se pudo determinar la organización para el nuevo usuario.");
            }
            
            // 1. Create Supabase Auth user
            // Fix: Use bracket notation to bypass incorrect type definitions for Supabase auth methods.
            const { data: { user }, error: authError } = await supabase.auth['signUp']({
                email: perfilData.email!,
                password: password,
                options: {
                    data: {
                        nombre: perfilData.nombre,
                    }
                }
            });

            if (authError) throw authError;
            if (!user) throw new Error("No se pudo crear el usuario en el sistema de autenticación.");

            // 2. Update the public.perfiles table with additional info
            const { error: profileError } = await supabase
                .from('perfiles')
                .update({ 
                    nombre: perfilData.nombre, 
                    telefono: perfilData.telefono,
                    organizacion_id: newUserOrgId
                })
                .eq('id', user.id);
            
            if (profileError) throw profileError;

            // 3. If 'isVendedor', create the 'vendedores' entry and link it
            if(isVendedor) {
                const { data: newVendedor, error: vendedorError } = await supabase
                    .from('vendedores')
                    .insert({ 
                        porcentaje_comision: vendedorData.porcentaje_comision || 0, 
                        meta_ventas: vendedorData.meta_ventas || 0
                    })
                    .select()
                    .single();

                if (vendedorError) throw vendedorError;
                
                await supabase.from('perfiles').update({ vendedor_id: newVendedor.id }).eq('id', user.id);
            }

            // 4. Assign roles (Defaulting to Vendedor for now)
            const rolesToAssign = ['Vendedor']; 
            await configApi.setUserRoles(user.id, rolesToAssign);

            showMessage('Usuario creado', 'Usuario creado con éxito!', [
                { label: 'Aceptar', onClick: () => { hideModal(); onClose(); }, variant: 'primary' }
            ]);

        } catch (error: any) {
            showMessage('Error', `Error al crear usuario: ${error.message}`, [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
            ]);
        }

    } else { // --- UPDATING an existing user ---
        try {
            // Update basic profile info
            await supabase.from('perfiles').update({
                nombre: perfilData.nombre,
                telefono: perfilData.telefono,
            }).eq('id', userId);
            
            const existingVendedorId = perfilData.vendedor_id;

            // --- Step 1: Handle the 'vendedores' table record ---
            if (isVendedor) {
                // User is a salesperson. Create or update their vendedor record.
                if (existingVendedorId) {
                    // UPDATE existing record
                    const { error } = await supabase
                        .from('vendedores')
                        .update({
                            porcentaje_comision: vendedorData.porcentaje_comision || 0,
                            meta_ventas: vendedorData.meta_ventas || 0
                        })
                        .eq('id', existingVendedorId);
                    if (error) throw error;
                } else {
                    // CREATE new record and link it
                    const { data: newVendedor, error: insertError } = await supabase
                        .from('vendedores')
                        .insert({
                            porcentaje_comision: vendedorData.porcentaje_comision || 0,
                            meta_ventas: vendedorData.meta_ventas || 0
                        })
                        .select('id')
                        .single();
                    if (insertError) throw insertError;

                    if(newVendedor) {
                        await supabase.from('perfiles').update({ vendedor_id: newVendedor.id }).eq('id', userId);
                    }
                }
            } else if (existingVendedorId) {
                // User is NO LONGER a salesperson. Unlink and delete their vendedor record.
                await supabase.from('perfiles').update({ vendedor_id: null }).eq('id', userId);
                await supabase.from('vendedores').delete().eq('id', existingVendedorId);
            }
            
            // --- Step 2: Handle the 'usuario_roles' table record ---
            const currentRoles = perfilData.usuario_roles
                ?.map(ur => ur.roles.nombre_rol)
                .filter(roleName => roleName !== 'Vendedor') || [];
                
            let newRoles = [...currentRoles];
            if (isVendedor) {
                newRoles.push('Vendedor');
            }
            
            await configApi.setUserRoles(userId, [...new Set(newRoles)]);

            showMessage('Perfil actualizado', 'Perfil actualizado con éxito!', [
                { label: 'Aceptar', onClick: () => { hideModal(); onClose(); }, variant: 'primary' }
            ]);
        } catch (error: any) {
            showMessage('Error', `Error al actualizar perfil: ${error.message}`, [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
            ]);
        }
    }

    setIsSaving(false);
  };

  return (
    <>
    <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center p-4">
      <div className="bg-white rounded-lg shadow-xl w-full max-w-3xl flex flex-col max-h-[95vh]">
        <div className="p-4 border-b flex justify-between items-center">
            <h2 className="text-xl font-semibold">{userId ? 'Editar Perfil' : 'Crear Usuario'}</h2>
            <button onClick={onClose}>&times;</button>
        </div>
        <div className="flex-grow overflow-y-auto p-6 space-y-6">
            <fieldset className="border p-4 rounded-lg">
                <legend className="text-sm font-medium px-2">Datos Personales y de Acceso</legend>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mt-2">
                    <div><label className="form-label">Nombre Completo</label><input name="nombre" value={perfilData.nombre || ''} onChange={handleChange} className="form-input" /></div>
                    <div><label className="form-label">Email</label><input name="email" value={perfilData.email || ''} onChange={handleChange} className="form-input" disabled={!!userId} /></div>
                    <div><label className="form-label">Teléfono</label><input name="telefono" value={perfilData.telefono || ''} onChange={handleChange} className="form-input" /></div>
                    
                    {userId && (
                         <div>
                            <label className="form-label">Organización</label>
                            <p className="p-2 bg-gray-100 rounded-md text-sm">{perfilData.organizaciones?.nombre || 'N/A'}</p>
                        </div>
                    )}
                </div>
                {!userId && (
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4 pt-4 mt-4 border-t">
                         <div><label className="form-label">Contraseña</label><input type="password" value={password} onChange={e => setPassword(e.target.value)} className="form-input" placeholder="Mínimo 6 caracteres" /></div>
                         <div><label className="form-label">Confirmar Contraseña</label><input type="password" value={passwordConfirm} onChange={e => setPasswordConfirm(e.target.value)} className="form-input" /></div>
                    </div>
                )}
            </fieldset>
             <fieldset className="border p-4 rounded-lg">
                <legend className="text-sm font-medium px-2">Perfil de Ventas</legend>
                 <div className="pt-2 space-y-4">
                    <label className="flex items-center"><input type="checkbox" checked={isVendedor} onChange={e => setIsVendedor(e.target.checked)} className="h-4 w-4" /><span className="ml-2">Este usuario es un vendedor</span></label>
                    {isVendedor && (
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div><label className="form-label">Comisión (%)</label><input name="porcentaje_comision" value={vendedorData.porcentaje_comision || ''} onChange={handleVendedorChange} className="form-input" type="number" step="0.1" /></div>
                            <div><label className="form-label">Meta de Venta ($)</label><input name="meta_ventas" value={vendedorData.meta_ventas || ''} onChange={handleVendedorChange} className="form-input" type="number" /></div>
                        </div>
                    )}
                </div>
            </fieldset>
        </div>
        <div className="p-4 border-t flex justify-end gap-2">
            <button type="button" onClick={onClose} className="btn btn-secondary">Cancelar</button>
            <button onClick={handleSave} className="btn btn-primary" disabled={isSaving}>
                {isSaving ? 'Guardando...' : 'Guardar'}
            </button>
        </div>
      </div>
    </div>
    <ActionModal {...modalProps} />
    </>
  );
};

export default PerfilModal;
