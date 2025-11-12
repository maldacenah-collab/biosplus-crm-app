// src/stores/useContactStore.ts
// Store de Zustand para la gestión del estado de los contactos.

// Fix: Use a named import for 'create' as required by Zustand.
import { create } from 'zustand';
import { getContacts, upsertContact, archiveOrDeleteContact } from '../services/contactsApi';
import { Contact } from '../types';
import { saveData, loadData } from '../utils/db';
import { useSharedStore } from './useSharedStore';

interface ContactState {
  contacts: Contact[];
  isLoading: boolean;
  error: string | null;
  fetchContacts: () => Promise<void>;
  saveContact: (contact: Partial<Contact>) => Promise<Contact | undefined>;
  removeContact: (contactId: number) => Promise<void>;
}

export const useContactStore = create<ContactState>((set, get) => ({
  contacts: [],
  isLoading: false,
  error: null,

  fetchContacts: async () => {
    set({ isLoading: true, error: null });
    try {
      const contacts = await getContacts();
      set({ contacts, isLoading: false });
      useSharedStore.getState().isOffline && set(state => ({ ...state, isOffline: false }));
      await saveData('contacts', contacts);
    } catch (error: any) {
      console.warn('Failed to fetch contacts from network, trying offline.', error);
      try {
        const contacts = await loadData<Contact>('contacts');
        set({ contacts, isLoading: false, error: null });
        useSharedStore.setState({ isOffline: true });
      } catch (dbError: any) {
        set({ error: dbError.message, isLoading: false });
      }
    }
  },

  saveContact: async (contact) => {
    const { currentUser } = useSharedStore.getState();
    if (!currentUser) {
        throw new Error("Usuario no autenticado.");
    }

    const dataToSave = { ...contact };
    // Inject organization_id on creation
    if (!dataToSave.id) {
        dataToSave.organizacion_id = currentUser.organizacion_id;
    }
    
    try {
      const savedContact = await upsertContact(dataToSave);
      // Actualizar el estado local sin necesidad de volver a buscar todo
      const existingContacts = get().contacts;
      const index = existingContacts.findIndex(c => c.id === savedContact.id);
      if (index !== -1) {
        const updatedContacts = [...existingContacts];
        updatedContacts[index] = { ...updatedContacts[index], ...savedContact };
        set({ contacts: updatedContacts });
      } else {
        set({ contacts: [...existingContacts, savedContact] });
      }
      return savedContact;
    } catch (error: any) {
      set({ error: error.message });
      throw error;
    }
  },

  removeContact: async (contactId) => {
    try {
        await archiveOrDeleteContact(contactId);
        // Volvemos a buscar para reflejar el cambio (archivado o borrado)
        await get().fetchContacts();
    } catch (error: any) {
        set({ error: error.message });
        throw error;
    }
  }
}));
