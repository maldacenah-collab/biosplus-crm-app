// src/components/auth/ProtectedRoute.tsx
import { ReactNode, useEffect, FC } from 'react';
import { Navigate } from 'react-router-dom';
import { useSharedStore } from '../../stores/useSharedStore';
import { can } from '../../utils/permissions';

interface ProtectedRouteProps {
  children: ReactNode;
  permission?: string;
}

const ProtectedRoute: FC<ProtectedRouteProps> = ({ children, permission }) => {
  const { currentUser, fetchSharedData, hasFetched } = useSharedStore();

  useEffect(() => {
    if (!hasFetched) {
      fetchSharedData();
    }
  }, [hasFetched, fetchSharedData]);
  
  if (!hasFetched) {
    return <div className="flex justify-center items-center h-screen">Cargando...</div>;
  }
  
  if (!currentUser) {
    return <Navigate to="/login" replace />;
  }

  // Nuevo: Chequeo de permiso específico si se proporciona uno.
  if (permission && !can(permission)) {
    // Si no tiene permiso, redirige al dashboard.
    // En el futuro, se podría redirigir a una página de "Acceso Denegado".
    return <Navigate to="/dashboard" replace />;
  }


  return <>{children}</>;
};

export default ProtectedRoute;