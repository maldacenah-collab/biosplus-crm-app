// src/components/layout/Layout.tsx
// Este es el "cascarón" principal de la aplicación.
// Contiene la barra lateral, la cabecera y el área donde se renderizará cada página.

import Header from './Header';
import Sidebar from './Sidebar';
import { useState, useEffect, ReactNode, FC } from 'react';
import { useSharedStore } from '../../stores/useSharedStore';
import FAB from '../common/FAB'; // Importar el nuevo FAB

interface LayoutProps {
  fullHeight?: boolean;
  children: ReactNode;
}

const Layout: FC<LayoutProps> = ({ children, fullHeight = false }) => {
  const [isSidebarOpen, setSidebarOpen] = useState(false);
  const { fetchSharedData, hasFetched } = useSharedStore();

  useEffect(() => {
    if (!hasFetched) {
      fetchSharedData();
    }
  }, [hasFetched, fetchSharedData]);

  const mainClasses = `flex-1 overflow-x-hidden overflow-y-auto ${!fullHeight ? 'p-4 md:p-6' : 'p-4 md:p-6 flex flex-col'}`;
  const childrenContainerClasses = fullHeight ? 'h-full' : '';

  return (
    <div className="flex min-h-screen bg-background-light">
      <Sidebar isOpen={isSidebarOpen} setIsOpen={setSidebarOpen} />
      <div className="flex-1 flex flex-col overflow-hidden">
        <Header onMenuClick={() => setSidebarOpen(true)} />
        <main className={mainClasses}>
          <div className={childrenContainerClasses}>
            {children}
          </div>
        </main>
      </div>
      <FAB />
    </div>
  );
};

export default Layout;
