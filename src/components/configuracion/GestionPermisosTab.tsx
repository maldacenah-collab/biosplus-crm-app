// src/components/configuracion/GestionPermisosTab.tsx
import { useEffect, useMemo, useState } from 'react';
import { useSharedStore } from '../../stores/useSharedStore';
import { ALL_PERMISSIONS } from '../../utils/permissionsList';
import * as configApi from '../../services/configApi';
import ActionModal from '../common/ActionModal';

const GestionPermisosTab = () => {
  const { rolesConPermisos, fetchUsersAndRoles } = useSharedStore();
  const [selectedRoleId, setSelectedRoleId] = useState<number | null>(null);
  const [selectedPermissions, setSelectedPermissions] = useState<string[]>([]);
  const [pendingRoleId, setPendingRoleId] = useState<number | null>(null);
  const [showDiscardModal, setShowDiscardModal] = useState(false);
  const [showSuccessModal, setShowSuccessModal] = useState(false);
  const [errorMessage, setErrorMessage] = useState<string | null>(null);
  const [isSaving, setIsSaving] = useState(false);

  useEffect(() => {
    fetchUsersAndRoles();
  }, [fetchUsersAndRoles]);

  useEffect(() => {
    if (Array.isArray(rolesConPermisos) && rolesConPermisos.length > 0 && !selectedRoleId) {
      setSelectedRoleId(rolesConPermisos[0].rol_id);
    }
  }, [rolesConPermisos, selectedRoleId]);

  const selectedRole = Array.isArray(rolesConPermisos) ? rolesConPermisos.find(r => r.rol_id === selectedRoleId) : undefined;

  useEffect(() => {
    if (selectedRole) {
      setSelectedPermissions(selectedRole.permisos ? [...selectedRole.permisos] : []);
    } else {
      setSelectedPermissions([]);
    }
  }, [selectedRole]);

  const isDirty = useMemo(() => {
    if (!selectedRole) return false;
    const rolePerms = selectedRole.permisos || [];
    if (rolePerms.length !== selectedPermissions.length) return true;
    const rolePermsSet = new Set(rolePerms);
    return selectedPermissions.some(perm => !rolePermsSet.has(perm));
  }, [selectedRole, selectedPermissions]);

  const permissionsCategorized = ALL_PERMISSIONS.reduce((acc, perm) => {
    const [category] = perm.split(':');
    if (!acc[category]) {
      acc[category] = [];
    }
    acc[category].push(perm);
    return acc;
  }, {} as Record<string, string[]>);

  const handleSelectRole = (roleId: number) => {
    if (roleId === selectedRoleId) return;
    if (isDirty) {
      setPendingRoleId(roleId);
      setShowDiscardModal(true);
      return;
    }
    setSelectedRoleId(roleId);
    setPendingRoleId(null);
  };

  const togglePermission = (perm: string) => {
    setSelectedPermissions(prev => {
      if (prev.includes(perm)) {
        return prev.filter(p => p !== perm);
      }
      return [...prev, perm];
    });
  };

  const handleSavePermissions = async () => {
    if (!selectedRoleId) return;
    setIsSaving(true);
    try {
        await configApi.setPermissionsForRole(selectedRoleId, selectedPermissions);
        await fetchUsersAndRoles();
        setShowSuccessModal(true);
    } catch (error: any) {
        setErrorMessage(error?.message ? `Error al guardar los permisos: ${error.message}` : 'Error al guardar los permisos.');
    } finally {
        setIsSaving(false);
    }
  };

  const confirmDiscardChanges = () => {
    if (pendingRoleId === null) {
      setShowDiscardModal(false);
      return;
    }
    const roleId = pendingRoleId;
    setShowDiscardModal(false);
    setPendingRoleId(null);
    setSelectedRoleId(roleId);
  };

  const cancelDiscardChanges = () => {
    setShowDiscardModal(false);
    setPendingRoleId(null);
  };

  return (
    <div className="bg-white p-6 rounded-lg shadow-md">
        <h2 className="text-xl font-semibold mb-4">Plantillas de Roles y Permisos</h2>
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
            <div className="md:col-span-1">
                <h3 className="font-semibold text-gray-700 mb-2">Roles</h3>
                <div className="space-y-2">
                    {Array.isArray(rolesConPermisos) && rolesConPermisos.map(role => (
                        <button
                            key={role.rol_id}
                            onClick={() => handleSelectRole(role.rol_id)}
                            className={`w-full text-left p-3 rounded-lg border ${selectedRoleId === role.rol_id ? 'bg-primary text-white border-primary-dark' : 'bg-gray-50 hover:bg-gray-100'}`}
                        >
                            {role.nombre_rol}
                        </button>
                    ))}
                </div>
            </div>
            <div className="md:col-span-3 border p-4 rounded-lg" id="permissions-container">
                {selectedRole ? (
                    <>
                        <h3 className="font-semibold text-gray-800 mb-4">Permisos para: <span className="text-primary">{selectedRole.nombre_rol}</span></h3>
                        <div className="space-y-4">
                            {Object.entries(permissionsCategorized).map(([category, permissions]) => (
                                <div key={category}>
                                    <h4 className="font-medium capitalize text-gray-600 mb-2">{category.replace(/_/g, ' ')}</h4>
                                    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-2">
                                        {permissions.map(perm => (
                                            <label key={`${selectedRoleId || 'none'}-${perm}`} className="flex items-center space-x-2">
                                                <input
                                                    type="checkbox"
                                                    data-permission={perm}
                                                    checked={selectedPermissions.includes(perm)}
                                                    onChange={() => togglePermission(perm)}
                                                    className="h-4 w-4"
                                                />
                                                <span className="text-sm">{perm.split(':').slice(1).join(':').replace(/_/g, ' ')}</span>
                                            </label>
                                        ))}
                                    </div>
                                </div>
                            ))}
                        </div>
                        <div className="text-right mt-6">
                            <button onClick={handleSavePermissions} disabled={isSaving || !isDirty} className="btn btn-primary disabled:opacity-50 disabled:cursor-not-allowed">
                                {isSaving ? 'Guardando...' : 'Guardar Permisos'}
                            </button>
                        </div>
                    </>
                ) : (
                    <p className="text-center text-gray-500 pt-16">Seleccione un rol para ver sus permisos.</p>
                )}
            </div>
        </div>

        <ActionModal
            isOpen={showDiscardModal}
            title="Cambios sin guardar"
            message="Tienes cambios sin guardar en los permisos del rol seleccionado. ¿Deseas descartarlos?"
            buttons={[
                { label: 'Cancelar', onClick: cancelDiscardChanges, variant: 'secondary' },
                { label: 'Descartar cambios', onClick: confirmDiscardChanges, variant: 'danger' },
            ]}
        />

        <ActionModal
            isOpen={showSuccessModal}
            title="Permisos guardados"
            message="Los permisos se guardaron correctamente."
            buttons={[
                { label: 'Aceptar', onClick: () => setShowSuccessModal(false), variant: 'primary' },
            ]}
        />
        <ActionModal
            isOpen={!!errorMessage}
            title="Error"
            message={errorMessage || ''}
            buttons={[
                { label: 'Cerrar', onClick: () => setErrorMessage(null), variant: 'primary' },
            ]}
        />
    </div>
  );
};

export default GestionPermisosTab;
