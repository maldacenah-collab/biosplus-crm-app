// src/components/configuracion/AsignacionRolesTab.tsx
import { useEffect, useState } from 'react';
import { useSharedStore } from '../../stores/useSharedStore';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

const AsignacionRolesTab = () => {
  const { usuariosConRoles, roles, fetchUsersAndRoles, updateUserRoles } = useSharedStore();
  const [savingStatus, setSavingStatus] = useState<Record<string, boolean>>({});
  const { modalProps, showMessage, hideModal } = useActionModal();

  useEffect(() => {
    fetchUsersAndRoles();
  }, [fetchUsersAndRoles]);

  const handleSaveRoles = async (userId: string) => {
    setSavingStatus(prev => ({ ...prev, [userId]: true }));
    const userRow = document.getElementById(`user-row-${userId}`);
    if (userRow) {
      const selectedRoles = Array.from(userRow.querySelectorAll<HTMLInputElement>('input[type="checkbox"]:checked'))
                                 .map(cb => cb.dataset.role as string);
      try {
        await updateUserRoles(userId, selectedRoles);
        showMessage('Roles guardados', 'Roles actualizados con éxito', [
          { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
        ]);
      } catch (error) {
        showMessage('Error', 'Error al actualizar los roles.', [
          { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
        ]);
      } finally {
        setSavingStatus(prev => ({ ...prev, [userId]: false }));
      }
    }
  };

  return (
    <div className="bg-white p-6 rounded-lg shadow-md">
      <h2 className="text-xl font-semibold mb-4">Asignación de Roles a Usuarios</h2>
      <div className="overflow-x-auto">
        <table className="w-full text-sm">
          <thead className="text-left bg-gray-50">
            <tr>
              <th className="p-3">Usuario</th>
              <th className="p-3">Roles</th>
              <th className="p-3 text-center">Acciones</th>
            </tr>
          </thead>
          <tbody>
            {usuariosConRoles.map(user => (
              <tr key={user.usuario_id} id={`user-row-${user.usuario_id}`} className="border-b">
                <td className="p-3 font-medium">{user.nombre_vendedor}</td>
                <td className="p-3">
                  <div className="flex flex-wrap gap-4">
                    {roles.map(role => (
                      <label key={role.id} className="flex items-center space-x-2">
                        <input
                          type="checkbox"
                          data-role={role.nombre_rol}
                          defaultChecked={user.roles.includes(role.nombre_rol)}
                          className="h-4 w-4"
                        />
                        <span>{role.nombre_rol}</span>
                      </label>
                    ))}
                  </div>
                </td>
                <td className="p-3 text-center">
                  <button
                    onClick={() => handleSaveRoles(user.usuario_id)}
                    disabled={savingStatus[user.usuario_id]}
                    className="btn btn-primary text-xs disabled:bg-gray-400"
                  >
                    {savingStatus[user.usuario_id] ? 'Guardando...' : 'Guardar'}
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      <ActionModal {...modalProps} />
    </div>
  );
};

export default AsignacionRolesTab;
