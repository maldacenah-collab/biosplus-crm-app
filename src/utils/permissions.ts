// src/utils/permissions.ts
// Lógica centralizada para la verificación de permisos.

import { useSharedStore } from '../stores/useSharedStore';

/**
 * Verifica si el usuario actual tiene un permiso específico.
 * Lee directamente del estado de Zustand sin necesidad de ser un hook.
 * @param permission El string del permiso a verificar (ej: 'contactos:crear').
 * @returns {boolean} True si el usuario tiene el permiso, false en caso contrario.
 */
export const can = (permission: string): boolean => {
  const state = useSharedStore.getState();
  const currentUser = state.currentUser;

  if (!currentUser) {
    return false;
  }
  
  // El Superadministrador siempre tiene acceso total.
  if (currentUser.roles.includes('Superadministrador')) {
    return true;
  }

  return (currentUser.permissions || []).includes(permission);
};