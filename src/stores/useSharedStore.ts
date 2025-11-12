// src/stores/useSharedStore.ts
import { create } from 'zustand';
import * as sharedApi from '../services/sharedApi';
import * as configApi from '../services/configApi';
import { Salesperson, Status, PaymentCondition, SalesStage, Product, BankAccount, Lote, EstadoPedido, Deposito, StockVendedor, CurrentUser, Provider, UserWithRoles, RoleWithPermissions, ReglaAlerta, Perfil, Contact } from '../types';
import { supabase } from '../services/supabase';
import { saveData, loadData } from '../utils/db';

interface ModalState {
  contact: { isOpen: boolean; contactId: number | null; };
  opportunity: { isOpen: boolean; opportunityId: number | null; contactData?: Partial<Contact> | null; isReadOnly?: boolean; };
  pedido: { isOpen: boolean; pedidoId: number | null; opportunityData?: any | null; contactData?: Contact | null; isReadOnly?: boolean; };
}

interface SharedState {
  salespeople: Salesperson[];
  statuses: Status[];
  paymentConditions: PaymentCondition[];
  salesStages: SalesStage[];
  products: Product[];
  lotes: Lote[];
  bankAccounts: BankAccount[];
  sharedConfig: Record<string, any>;
  estadosPedido: EstadoPedido[];
  depositos: Deposito[];
  stock_vendedores: StockVendedor[];
  providers: Provider[];
  roles: any[]; 
  currentUser: CurrentUser | null;
  hasFetched: boolean;
  isOffline: boolean;
  error: string | null;
  
  modalState: ModalState;
  openModal: <K extends keyof ModalState>(modal: K, props: Omit<ModalState[K], 'isOpen'>) => void;
  closeModal: (modal: keyof ModalState) => void;

  fetchSharedData: (forceCache?: boolean) => Promise<void>;
  logoutUser: () => void;

  // State for config page
  usuariosConRoles: UserWithRoles[];
  rolesConPermisos: RoleWithPermissions[];
  perfiles: Perfil[];
  reglas: ReglaAlerta[];
  fetchUsersAndRoles: () => Promise<void>;
  updateUserRoles: (userId: string, roleNames: string[]) => Promise<void>;
  fetchConfig: () => Promise<void>;
  saveConfig: (config: Record<string, any>) => Promise<void>;
  fetchBankAccounts: () => Promise<void>;
  addBankAccount: (account: Omit<BankAccount, 'id'>) => Promise<void>;
  deleteBankAccount: (id: number) => Promise<void>;
  fetchPerfiles: () => Promise<void>;
  fetchReglas: () => Promise<void>;
}

const initialModalState: ModalState = {
  contact: { isOpen: false, contactId: null },
  opportunity: { isOpen: false, opportunityId: null },
  pedido: { isOpen: false, pedidoId: null }
};

const initialState: Omit<SharedState, 'fetchSharedData' | 'logoutUser' | 'openModal' | 'closeModal' | 'fetchUsersAndRoles' | 'updateUserRoles' | 'fetchConfig' | 'saveConfig' | 'fetchBankAccounts' | 'addBankAccount' | 'deleteBankAccount' | 'fetchPerfiles' | 'fetchReglas'> = {
  salespeople: [],
  statuses: [],
  paymentConditions: [],
  salesStages: [],
  products: [],
  lotes: [],
  bankAccounts: [],
  sharedConfig: {},
  estadosPedido: [],
  depositos: [],
  stock_vendedores: [],
  providers: [],
  roles: [],
  currentUser: null,
  hasFetched: false,
  isOffline: false,
  error: null,
  modalState: initialModalState,
  usuariosConRoles: [],
  rolesConPermisos: [],
  perfiles: [],
  reglas: [],
};

export const useSharedStore = create<SharedState>((set, get) => ({
  ...initialState,

  openModal: (modal, props) => set(state => ({
    modalState: { ...state.modalState, [modal]: { ...props, isOpen: true } }
  })),

  closeModal: (modal) => set(state => ({
    modalState: { ...state.modalState, [modal]: { ...initialModalState[modal], isOpen: false } }
  })),

  fetchSharedData: async (force = false) => {
    if (get().hasFetched && !force) return;

    try {
      // ONLINE: Fetch from Supabase
      // Fix: Use bracket notation to access 'getSession' to bypass incorrect type definitions for Supabase auth methods.
      const { data: { session } } = await supabase.auth['getSession']();
      let currentUser: CurrentUser | null = null;
      if (session) {
          const { data: userData, error: userError } = await supabase
            .from('perfiles')
            .select('*, vendedor_id, vendedores(*), usuario_roles!left(roles!inner(nombre_rol, rol_permisos(permisos(nombre_permiso)))), organizaciones(nombre)')
            .eq('id', session.user.id)
            .single();
          
          if (userError) throw userError;

          if (userData) {
            const roles = (userData.usuario_roles || [])
              .map((ur: any) => ur.roles?.nombre_rol)
              .filter(Boolean) as string[];

            const permissionsList = (userData.usuario_roles || []).flatMap((ur: any) => {
                const rolPermisos = ur.roles?.rol_permisos;
                if (!rolPermisos) return [];
                
                const permisosArray = Array.isArray(rolPermisos) ? rolPermisos : [rolPermisos];

                return permisosArray.map((rp: any) => rp.permisos?.nombre_permiso);
            });
            
            const permissions: string[] = Array.from(new Set(permissionsList.filter(Boolean)));
            
            currentUser = {
                id: userData.id, nombre: userData.nombre, email: userData.email, telefono: userData.telefono,
                foto_url: userData.foto_url, vendedorId: userData.vendedor_id, vendedorData: userData.vendedores,
                roles: roles, permissions: permissions,
                organizacion_id: userData.organizacion_id,
                nombre_organizacion: (userData.organizaciones as any)?.nombre || 'Org',
                modo_creacion_organizacion_id: (userData as any).modo_creacion_organizacion_id,
            };
          }
      }
      if (!currentUser) { set({ hasFetched: true, currentUser: null, error: null }); return; };

      const [salespeople, statuses, paymentConditions, salesStages, products, bankAccounts, sharedConfig, lotes, estadosPedido, depositos, stock_vendedores, providers, roles] = await Promise.all([
        sharedApi.getSalespeople(), sharedApi.getStatuses(), sharedApi.getPaymentConditions(),
        sharedApi.getSalesStages(), sharedApi.getProducts(), sharedApi.getBankAccounts(),
        sharedApi.getSharedConfig(), // Fetch global config
        sharedApi.getLotes(), sharedApi.getEstadosPedido(),
        sharedApi.getDepositos(), sharedApi.getStockVendedores(), sharedApi.getProviders(), sharedApi.getRoles(),
      ]);

      const stockMap = lotes.reduce((map: Record<number, number>, lote) => {
        map[lote.producto_id] = (map[lote.producto_id] || 0) + lote.stock_disponible; return map;
      }, {});
      const productsWithStock = products.map(p => ({ ...p, stock_total: stockMap[p.id] || 0 }));
      
      const dataToSet = {
        currentUser, hasFetched: true, salespeople, statuses, paymentConditions, salesStages, products: productsWithStock,
        bankAccounts, sharedConfig, lotes, estadosPedido, depositos, stock_vendedores, providers, roles, isOffline: false, error: null
      };
      set(dataToSet);

      // Save to IndexedDB
      await Promise.all([
          saveData('salespeople', salespeople), saveData('statuses', statuses), saveData('paymentConditions', paymentConditions),
          saveData('salesStages', salesStages), saveData('products', productsWithStock), saveData('bankAccounts', bankAccounts),
          saveData('sharedConfig', [sharedConfig]), saveData('lotes', lotes), saveData('estadosPedido', estadosPedido),
          saveData('depositos', depositos), saveData('stock_vendedores', stock_vendedores), saveData('providers', providers),
          saveData('roles', roles)
      ]);

    } catch (error) {
      console.warn("Failed to fetch shared data from network, trying offline:", error);
      // OFFLINE: Load from IndexedDB
      try {
        const [salespeople, statuses, paymentConditions, salesStages, products, bankAccounts, sharedConfig, lotes, estadosPedido, depositos, stock_vendedores, providers, roles] = await Promise.all([
            loadData<Salesperson>('salespeople'), loadData<Status>('statuses'), loadData<PaymentCondition>('paymentConditions'),
            loadData<SalesStage>('salesStages'), loadData<Product>('products'), loadData<BankAccount>('bankAccounts'),
            loadData<any>('sharedConfig'), loadData<Lote>('lotes'), loadData<EstadoPedido>('estadosPedido'),
            loadData<Deposito>('depositos'), loadData<StockVendedor>('stock_vendedores'), loadData<Provider>('providers'),
            loadData<any>('roles')
        ]);
        
        // Cannot get currentUser offline, but the rest can be loaded.
        set({
            hasFetched: true, isOffline: true, salespeople, statuses, paymentConditions, salesStages, products,
            bankAccounts, sharedConfig: sharedConfig[0] || {}, lotes, estadosPedido, depositos, stock_vendedores, providers, roles, error: null
        });
      } catch (dbError) {
        console.error("Failed to load data from IndexedDB:", dbError);
        set({ hasFetched: true, isOffline: true, error: (dbError as Error).message });
      }
    }
  },

  logoutUser: () => {
    set(initialState);
  },

  fetchUsersAndRoles: async () => {
    try {
        const [usuariosConRoles, rolesConPermisos] = await Promise.all([
            configApi.getUsersWithRoles(),
            configApi.getRolesWithPermissions(),
        ]);
        set({ usuariosConRoles, rolesConPermisos });
    } catch (error: any) {
        console.error("Failed to fetch config data:", error.message);
    }
  },

  updateUserRoles: async (userId, roleNames) => {
    try {
        await configApi.setUserRoles(userId, roleNames);
        await get().fetchUsersAndRoles();
    } catch (error: any) {
        console.error(`Failed to update roles for user ${userId}:`, error.message);
        throw error;
    }
  },

  fetchConfig: async () => {
    const config = await sharedApi.getSharedConfig();
    set({ sharedConfig: config });
  },

  saveConfig: async (configToSave) => {
    await configApi.saveConfig(configToSave);
    await get().fetchConfig();
  },

  fetchBankAccounts: async () => {
    const accounts = await sharedApi.getBankAccounts();
    set({ bankAccounts: accounts });
  },

  addBankAccount: async (account) => {
    const orgId = get().currentUser?.organizacion_id;
    if (!orgId) return;
    await configApi.addBankAccount({ ...account, organizacion_id: orgId });
    await get().fetchBankAccounts();
  },

  deleteBankAccount: async (id) => {
    await configApi.deleteBankAccount(id);
    await get().fetchBankAccounts();
  },
  
  fetchPerfiles: async () => {
    const perfiles = await configApi.getPerfiles();
    set({ perfiles });
  },

  fetchReglas: async () => {
    const reglas = await configApi.getAlertRules();
    set({ reglas });
  },
}));