// src/App.tsx
// Componente principal que configura el enrutador de la aplicación.
import { useEffect, FC, lazy, Suspense } from 'react';
import { HashRouter, Routes, Route, Navigate, useLocation } from 'react-router-dom';
import Layout from './components/layout/Layout';
import ProtectedRoute from './components/auth/ProtectedRoute';
import { useSharedStore } from './stores/useSharedStore';
import { supabase } from './services/supabase';
import OfflineIndicator from './components/common/OfflineIndicator';

// --- Implementación de Code Splitting (Lazy Loading) ---
const Dashboard = lazy(() => import('./pages/Dashboard'));
const ContactsPage = lazy(() => import('./pages/ContactsPage'));
const OpportunitiesPage = lazy(() => import('./pages/OpportunitiesPage'));
const PedidosPage = lazy(() => import('./pages/PedidosPage'));
const InventarioPage = lazy(() => import('./pages/InventarioPage'));
const AnalisisVentasPage = lazy(() => import('./pages/AnalisisVentasPage'));
const AprobacionesPage = lazy(() => import('./pages/AprobacionesPage'));
const Cliente360Page = lazy(() => import('./pages/Cliente360Page'));
const ComisionesPage = lazy(() => import('./pages/ComisionesPage'));
const ComprasPage = lazy(() => import('./pages/ComprasPage'));
const ConfiguracionPage = lazy(() => import('./pages/ConfiguracionPage'));
const CuentaCorrientePage = lazy(() => import('./pages/CuentaCorrientePage'));
const DashboardGerencialPage = lazy(() => import('./pages/DashboardGerencialPage'));
const LogisticaPage = lazy(() => import('./pages/LogisticaPage'));
const PagosProveedoresPage = lazy(() => import('./pages/PagosProveedoresPage'));
const ProveedoresPage = lazy(() => import('./pages/ProveedoresPage'));
const ReportesPage = lazy(() => import('./pages/ReportesPage'));
const LoginPage = lazy(() => import('./pages/LoginPage'));
const CallCenterPage = lazy(() => import('./pages/CallCenterPage'));
const AsistenteIAPage = lazy(() => import('./pages/AsistenteIAPage'));
const ManualPage = lazy(() => import('./pages/ManualPage'));

const LoadingFallback = () => (
    <div className="flex justify-center items-center h-full w-full p-8">
        <p className="text-primary font-semibold animate-pulse">Cargando módulo...</p>
    </div>
);


const AppContent: FC = () => {
  const location = useLocation();
  const isFullHeightPage = location.pathname === '/asistente-ia';

  return (
    <Layout fullHeight={isFullHeightPage}>
      <OfflineIndicator />
      <Suspense fallback={<LoadingFallback />}>
        <Routes>
          <Route path="/" element={<Navigate to="/dashboard" replace />} />
          
          <Route path="/dashboard" element={<ProtectedRoute permission="dashboard:ver:propio"><Dashboard /></ProtectedRoute>} />
          <Route path="/dashboard-gerencial" element={<ProtectedRoute permission="dashboard:ver:gerencial"><DashboardGerencialPage /></ProtectedRoute>} />
          <Route path="/analisis-ventas" element={<ProtectedRoute permission="analisis:ver:propios"><AnalisisVentasPage /></ProtectedRoute>} />
          
          {/* Rutas de Contactos con manejo de modales */}
          <Route path="/contactos" element={<ProtectedRoute permission="contactos:ver:propios"><ContactsPage /></ProtectedRoute>} />
          <Route path="/contactos/:action" element={<ProtectedRoute permission="contactos:crear"><ContactsPage /></ProtectedRoute>} />
          <Route path="/contactos/:action/:contactId" element={<ProtectedRoute permission="contactos:editar"><ContactsPage /></ProtectedRoute>} />
          
          <Route path="/callcenter" element={<ProtectedRoute permission="ia:usar:callcenter"><CallCenterPage /></ProtectedRoute>} />
          <Route path="/asistente-ia" element={<ProtectedRoute permission="ia:usar:asistente"><AsistenteIAPage /></ProtectedRoute>} />
          
          {/* Rutas de Presupuestos con manejo de modales */}
          <Route path="/oportunidades" element={<ProtectedRoute permission="oportunidades:ver:propias"><OpportunitiesPage /></ProtectedRoute>} />
          <Route path="/oportunidades/:action" element={<ProtectedRoute permission="oportunidades:crear"><OpportunitiesPage /></ProtectedRoute>} />
          <Route path="/oportunidades/:action/:opportunityId" element={<ProtectedRoute permission="oportunidades:editar"><OpportunitiesPage /></ProtectedRoute>} />

          {/* Rutas de Pedidos con manejo de modales */}
          <Route path="/pedidos" element={<ProtectedRoute permission="pedidos:ver:propios"><PedidosPage /></ProtectedRoute>} />
          <Route path="/pedidos/:action" element={<ProtectedRoute permission="pedidos:crear"><PedidosPage /></ProtectedRoute>} />
          <Route path="/pedidos/:action/:pedidoId" element={<ProtectedRoute permission="pedidos:editar"><PedidosPage /></ProtectedRoute>} />

          <Route path="/aprobaciones" element={<ProtectedRoute permission="solicitudes:resolver"><AprobacionesPage /></ProtectedRoute>} />
          
          <Route path="/inventario" element={<ProtectedRoute permission="stock:ver:propios"><InventarioPage /></ProtectedRoute>} />
          <Route path="/logistica" element={<ProtectedRoute permission="pedidos:ver:todos"><LogisticaPage /></ProtectedRoute>} />
          <Route path="/compras" element={<ProtectedRoute permission="compras:ver"><ComprasPage /></ProtectedRoute>} />
          <Route path="/proveedores" element={<ProtectedRoute permission="compras:ver"><ProveedoresPage /></ProtectedRoute>} />
          
          <Route path="/cuenta-corriente" element={<ProtectedRoute permission="ctacte_clientes:ver:propios"><CuentaCorrientePage /></ProtectedRoute>} />
          <Route path="/pagos-proveedores" element={<ProtectedRoute permission="ctacte_proveedores:ver"><PagosProveedoresPage /></ProtectedRoute>} />
          <Route path="/comisiones" element={<ProtectedRoute permission="comisiones:ver:propias"><ComisionesPage /></ProtectedRoute>} />
          
          <Route path="/configuracion" element={<ProtectedRoute permission="configuracion:ver"><ConfiguracionPage /></ProtectedRoute>} />
          <Route path="/reportes" element={<ProtectedRoute permission="configuracion:ver"><ReportesPage /></ProtectedRoute>} />
          <Route path="/manual" element={<ProtectedRoute permission="dashboard:ver:propio"><ManualPage /></ProtectedRoute>} />


          <Route path="/cliente/:id" element={<ProtectedRoute permission="contactos:ver:propios"><Cliente360Page /></ProtectedRoute>} />
          
          <Route path="*" element={<Navigate to="/dashboard" replace />} />
        </Routes>
      </Suspense>
    </Layout>
  );
};


const ProtectedApp: FC = () => (
  // Este componente ahora solo verifica la autenticación una vez.
  // La protección de cada ruta se maneja dentro de AppContent.
  <ProtectedRoute>
    <AppContent />
  </ProtectedRoute>
);

function App() {
  const { logoutUser, fetchSharedData } = useSharedStore();

  useEffect(() => {
    const { data: authListener } = supabase.auth.onAuthStateChange((event, session) => {
      if (event === 'SIGNED_OUT') {
        // El usuario cerró sesión explícitamente. Limpiamos el estado.
        logoutUser();
        // El ProtectedRoute se encargará de redirigir a /login.
      }
      if (event === 'SIGNED_IN' || event === 'TOKEN_REFRESHED') {
        // Esto ocurre al iniciar sesión, al volver a la pestaña, o al refrescar el token.
        // En lugar de recargar la página, solo refrescamos los datos del usuario y compartidos.
        // Esto es mucho más suave para la experiencia de usuario.
        fetchSharedData();
      }
    });

    return () => {
      authListener.subscription.unsubscribe();
    };
  }, [logoutUser, fetchSharedData]);

  return (
    <HashRouter>
      <Routes>
        <Route 
          path="/login" 
          element={
            <Suspense fallback={<div className="flex justify-center items-center h-screen w-screen"><p>Cargando...</p></div>}>
              <LoginPage />
            </Suspense>
          } 
        />
        <Route path="/*" element={<ProtectedApp />} />
      </Routes>
    </HashRouter>
  );
}

export default App;