// src/components/configuracion/UsuariosSeguridadTab.tsx
import { useState } from 'react';
import AsignacionRolesTab from './AsignacionRolesTab';
import GestionPermisosTab from './GestionPermisosTab';

const UsuariosSeguridadTab = () => {
    const [activeTab, setActiveTab] = useState('asignacion');
    
    return (
        <div>
             <div className="bg-gray-100 p-1.5 rounded-lg inline-flex gap-2 mb-6">
                <button 
                    onClick={() => setActiveTab('asignacion')} 
                    className={`text-sm px-4 py-2 rounded-md font-semibold ${activeTab === 'asignacion' ? 'bg-white shadow text-primary' : 'text-gray-600 hover:bg-gray-200'}`}
                >
                    Asignación de Roles
                </button>
                <button 
                    onClick={() => setActiveTab('permisos')} 
                    className={`text-sm px-4 py-2 rounded-md font-semibold ${activeTab === 'permisos' ? 'bg-white shadow text-primary' : 'text-gray-600 hover:bg-gray-200'}`}
                >
                    Gestión de Permisos por Rol
                </button>
            </div>
            <div>
                {activeTab === 'asignacion' && <AsignacionRolesTab />}
                {activeTab === 'permisos' && <GestionPermisosTab />}
            </div>
        </div>
    );
}

export default UsuariosSeguridadTab;
