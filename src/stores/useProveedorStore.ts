// src/stores/useProveedorStore.ts
import { create } from 'zustand';
import { getProviders, upsertProvider, deleteProvider } from '../services/proveedoresApi';
import { Provider } from '../types';

const PROVIDERS_PER_PAGE = 30;

interface ProveedorState {
  providers: Provider[];
  isLoading: boolean;
  hasMore: boolean;
  offset: number;
  error: string | null;
  fetchProviders: (searchTerm?: string) => Promise<void>;
  resetAndFetch: (searchTerm?: string) => Promise<void>;
  saveProvider: (provider: Partial<Provider>) => Promise<Provider | undefined>;
  removeProvider: (providerId: string) => Promise<void>;
}

export const useProveedorStore = create<ProveedorState>((set, get) => ({
  providers: [],
  isLoading: false,
  hasMore: true,
  offset: 0,
  error: null,

  fetchProviders: async (searchTerm?: string) => {
    if (get().isLoading || !get().hasMore) return;
    set({ isLoading: true, error: null });
    
    try {
      const newProviders = await getProviders(get().offset, searchTerm);
      set(state => {
        // Create a Set of existing provider IDs for quick lookup to prevent duplicates
        const existingIds = new Set(state.providers.map(p => p.id));
        // Filter out any new providers that are already in the state
        const uniqueNewProviders = newProviders.filter(p => !existingIds.has(p.id));

        return {
          providers: [...state.providers, ...uniqueNewProviders],
          offset: state.offset + newProviders.length, // Maintain original offset logic
          hasMore: newProviders.length === PROVIDERS_PER_PAGE,
          isLoading: false,
        };
      });
    } catch (error: any) {
      set({ error: error.message, isLoading: false });
    }
  },

  resetAndFetch: async (searchTerm?: string) => {
    set({ providers: [], offset: 0, hasMore: true, isLoading: false });
    setTimeout(() => {
        get().fetchProviders(searchTerm);
    }, 0);
  },

  saveProvider: async (provider) => {
    try {
      // Llamamos a la API con el objeto completo. La RPC se encarga del resto.
      const savedProvider = await upsertProvider(provider);
      
      set(state => {
          const index = state.providers.findIndex(p => p.id === savedProvider.id);
          if (index !== -1) {
              const updatedProviders = [...state.providers];
              // Actualizamos con los datos devueltos por la RPC, que son la fuente de verdad.
              updatedProviders[index] = savedProvider;
              return { providers: updatedProviders };
          } else {
              return { providers: [savedProvider, ...state.providers] };
          }
      });
      return savedProvider;
    } catch (error: any) {
      set({ error: error.message });
      throw error;
    }
  },

  removeProvider: async (providerId) => {
    try {
        await deleteProvider(providerId);
        set(state => ({
            providers: state.providers.filter(p => p.id !== providerId)
        }));
    } catch (error: any) {
        set({ error: error.message });
        throw error;
    }
  }
}));