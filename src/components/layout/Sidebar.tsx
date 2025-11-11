// src/components/layout/Sidebar.tsx
import { NavLink } from 'react-router-dom';
import { XMarkIcon } from '@heroicons/react/24/outline';
import React from 'react';
import { can } from '../../utils/permissions';
import { navItems } from '../../data/menuStructure';

interface SidebarProps {
  isOpen: boolean;
  setIsOpen: (isOpen: boolean) => void;
}

const Sidebar = ({ isOpen, setIsOpen }: SidebarProps) => {
  return (
    <>
      {/* Overlay */}
      <div
        className={`fixed inset-0 bg-black bg-opacity-30 z-20 md:hidden transition-opacity ${isOpen ? 'opacity-100' : 'opacity-0 pointer-events-none'}`}
        onClick={() => setIsOpen(false)}
      />
      
      {/* Sidebar */}
      <aside className={`fixed top-0 left-0 w-64 h-screen bg-accent-dark text-white transform transition-transform z-30 flex flex-col md:relative md:h-auto md:min-h-screen md:translate-x-0 ${isOpen ? 'translate-x-0' : '-translate-x-full'}`}>
        <div className="relative flex items-center justify-center h-16 border-b border-gray-700 bg-white">
          <img src="https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/assets/public/logo_laboratorio.png" alt="BiosPlus CRM" className="h-full w-auto p-2" />
          <button className="md:hidden p-1 absolute top-1/2 right-4 -translate-y-1/2" onClick={() => setIsOpen(false)}>
             <XMarkIcon className="w-6 h-6" />
          </button>
        </div>

        <nav className="flex-1 overflow-y-auto scrollbar-hidden p-4">
          {navItems.map((item, index) => {
            if (item.type === 'group') {
              // Verificamos si alguno de los links del grupo es visible antes de renderizar el título.
              const nextGroupIndex = navItems.findIndex((subItem, subIndex) => subIndex > index && subItem.type === 'group');
              const linksInGroup = navItems.slice(index + 1, nextGroupIndex > -1 ? nextGroupIndex : undefined);
              const isGroupVisible = linksInGroup.some(linkItem => linkItem.type === 'link' && can(linkItem.permission));

              if (!isGroupVisible) return null;

              return (
                <div key={index} className="mt-6 first:mt-0">
                  <h3 className="px-3 text-xs font-semibold text-gray-400 uppercase tracking-wider">{item.title}</h3>
                </div>
              );
            }
            if (item.type === 'link') {
              if (item.permission && !can(item.permission)) {
                return null;
              }
              const Icon = item.icon;
              const isIA = item.to.includes('ia') || item.to.includes('callcenter');
              return (
                <NavLink
                  key={item.to}
                  to={item.to}
                  onClick={() => setIsOpen(false)}
                  className={({ isActive }) => `flex items-center mt-2 px-3 py-2 text-sm font-medium rounded-md transition-colors ${
                    isActive 
                      ? (isIA ? 'bg-primary/80 text-white' : 'bg-accent text-white') 
                      : 'text-gray-300 hover:bg-accent hover:text-white'
                  }`}
                >
                  <Icon className={`h-5 w-5 mr-3 ${isIA ? 'text-yellow-300' : ''}`} />
                  {item.text}
                </NavLink>
              );
            }
            return null;
          })}
        </nav>
      </aside>
    </>
  );
};

export default Sidebar;
