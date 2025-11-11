// src/pages/ConfiguracionPage.tsx
import { useState } from 'react';
import EmpresaTab from '../components/configuracion/EmpresaTab';
import PerfilesTab from '../components/configuracion/PerfilesTab';
import UsuariosSeguridadTab from '../components/configuracion/UsuariosSeguridadTab';
import EmbudoVentasTab from '../components/configuracion/EmbudoVentasTab';
import AlertasInteligentesTab from '../components/configuracion/AlertasInteligentesTab';
import ZonasEnvioMapTab from '../components/logistica/ZonasEnvioMapTab'; // Cambiado
import { can } from '../utils/permissions';

const ConfiguracionPage = () => {
  const [activeTab, setActiveTab] = useState('empresa');

  const tabs = [
    { id: 'empresa', label: 'Empresa' },
    { id: 'perfiles', label: 'Perfiles' },
    { id: 'usuarios', label: 'Usuarios y Seguridad' },
    { id: 'embudo', label: 'Etapas de Presupuesto' },
    { id: 'alertas', label: 'Alertas Inteligentes' },
    { id: 'zonas', label: 'Zonas de Envío', permission: 'configuracion:ver' },
  ];

  return (
    <div>
      <h1 className="text-3xl font-bold text-gray-800 mb-6">Configuración General</h1>

      <div className="border-b border-gray-200">
        <nav className="-mb-px flex space-x-8 overflow-x-auto" aria-label="Tabs">
          {tabs.map(tab => {
            if (tab.permission && !can(tab.permission)) return null;
            return (
              <button
                key={tab.id}
                onClick={() => setActiveTab(tab.id)}
                className={`${
                  activeTab === tab.id
                    ? 'border-primary text-primary'
                    : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
                } whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm transition-colors`}
              >
                {tab.label}
              </button>
            )
          })}
        </nav>
      </div>

      <div className="mt-6">
        {activeTab === 'empresa' && <EmpresaTab />}
        {activeTab === 'perfiles' && <PerfilesTab />}
        {activeTab === 'usuarios' && <UsuariosSeguridadTab />}
        {activeTab === 'embudo' && <EmbudoVentasTab />}
        {activeTab === 'alertas' && <AlertasInteligentesTab />}
        {activeTab === 'zonas' && <ZonasEnvioMapTab />}
      </div>
    </div>
  );
};

export default ConfiguracionPage;