// src/components/configuracion/PerfilesTab.tsx
import { useEffect, useState } from 'react';
import { useSharedStore } from '../../stores/useSharedStore';
import PerfilModal from './PerfilModal';
import { Perfil } from '../../types';
import Avatar from '../common/Avatar';

const PerfilesTab = () => {
    const { perfiles, fetchPerfiles } = useSharedStore();
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [editingUserId, setEditingUserId] = useState<string | null>(null);
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        const loadData = async () => {
            setIsLoading(true);
            await fetchPerfiles();
            setIsLoading(false);
        }
        loadData();
    }, [fetchPerfiles]);

    const handleOpenModal = (userId: string | null) => {
        setEditingUserId(userId);
        setIsModalOpen(true);
    }
    
    const handleCloseModal = () => {
        setIsModalOpen(false);
        setEditingUserId(null);
        fetchPerfiles(); // Refresca la lista de perfiles
    }

    const getRolesFromProfile = (perfil: Perfil) => {
        if (!perfil.usuario_roles || perfil.usuario_roles.length === 0) {
            return <span className="px-2 py-1 text-xs font-semibold rounded-full bg-gray-100 text-gray-800">Sin Rol</span>;
        }
        return perfil.usuario_roles.map(ur => (
            <span key={ur.roles.nombre_rol} className="px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800 mr-1">
                {ur.roles.nombre_rol}
            </span>
        ));
    }

    if (isLoading) {
        return <div className="text-center p-8">Cargando perfiles...</div>;
    }

    return (
        <div className="bg-white p-6 rounded-lg shadow-md">
            <div className="flex justify-between items-center mb-4">
                <h2 className="text-xl font-semibold">Gestionar Perfiles de Usuario</h2>
                <button onClick={() => handleOpenModal(null)} className="btn btn-primary">Crear Usuario</button>
            </div>
            <div className="overflow-x-auto">
                <table className="w-full text-sm">
                    <thead className="text-left bg-gray-50">
                        <tr>
                            <th className="p-3">Foto</th>
                            <th className="p-3">Nombre</th>
                            <th className="p-3">Email</th>
                            <th className="p-3">Roles</th>
                            <th className="p-3 text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        {perfiles.map(perfil => (
                            <tr key={perfil.id} onClick={() => handleOpenModal(perfil.id)} className="border-b hover:bg-gray-50 cursor-pointer">
                                <td className="p-2"><Avatar src={perfil.foto_url} name={perfil.nombre} /></td>
                                <td className="p-3 font-medium">{perfil.nombre || perfil.email}</td>
                                <td className="p-3">{perfil.email}</td>
                                <td className="p-3">{getRolesFromProfile(perfil)}</td>
                                <td className="p-3 text-center">
                                    <button onClick={(e) => { e.stopPropagation(); handleOpenModal(perfil.id)}} className="font-medium text-primary hover:underline">Editar</button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>

            {isModalOpen && <PerfilModal userId={editingUserId} onClose={handleCloseModal} />}
        </div>
    );
};

export default PerfilesTab;
