// src/components/layout/Header.tsx
// Componente de la cabecera superior.

import { useState } from 'react';
import { supabase } from '../../services/supabase';
import { useNavigate } from 'react-router-dom';
import { useSharedStore } from '../../stores/useSharedStore';

interface HeaderProps {
  onMenuClick: () => void;
}

const Header = ({ onMenuClick }: HeaderProps) => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const navigate = useNavigate();
  const { currentUser, logoutUser } = useSharedStore();

  const handleLogout = async () => {
    await supabase.auth.signOut();
    logoutUser();
    navigate('/login', { replace: true });
  };
  
  const userName = currentUser?.nombre || 'Usuario';
  const userInitial = userName.charAt(0).toUpperCase();
  const orgName = currentUser?.nombre_organizacion ? `(${currentUser.nombre_organizacion})` : '';

  return (
    <header className="flex-shrink-0 bg-white/80 backdrop-blur-sm h-16 border-b border-slate-200 flex items-center justify-between px-4 md:px-6 z-10 sticky top-0">
      <button
        onClick={onMenuClick}
        className="md:hidden text-text-secondary hover:text-primary"
        aria-label="Abrir menú"
      >
        <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16" />
        </svg>
      </button>

      <div className="flex-1 md:hidden"></div>

      <div className="flex items-center space-x-4">
        <div className="relative">
          <div className="flex items-center space-x-2 cursor-pointer" onClick={() => setIsMenuOpen(!isMenuOpen)}>
              <span className="text-sm font-medium text-text-secondary">{userName} <span className="text-xs text-gray-400">{orgName}</span></span>
              <div className="w-8 h-8 rounded-full bg-slate-200 text-slate-600 flex items-center justify-center font-bold">
                  {userInitial}
              </div>
          </div>
          {isMenuOpen && (
            <div className="absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 z-50 border border-slate-200">
              <button
                onClick={handleLogout}
                className="w-full text-left block px-4 py-2 text-sm text-slate-700 hover:bg-slate-100"
              >
                Cerrar Sesión
              </button>
            </div>
          )}
        </div>
      </div>
    </header>
  );
};

export default Header;