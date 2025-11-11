// src/services/sharedApi.ts
// API para obtener datos compartidos como vendedores, estados, etc.

import { supabase } from './supabase';
import { Salesperson, Status, PaymentCondition, SalesStage, Product, BankAccount, Lote, EstadoPedido, Deposito, StockVendedor, Provider } from '../types';

export const getSalespeople = async (): Promise<Salesperson[]> => {
  const { data, error } = await supabase
    .from('perfiles')
    .select('nombre, vendedores!inner(id)');
  
  if (error) {
    console.error('Error fetching salespeople:', error);
    throw error;
  }
  if (!data) return [];

  const salespeople: Salesperson[] = data.map((profile: any) => ({
    id: profile.vendedores.id,
    perfiles: {
        nombre: profile.nombre
    },
  }));

  return salespeople;
};

export const getProviders = async (): Promise<Provider[]> => {
    const { data, error } = await supabase.from('proveedores').select('*').order('nombre');
    if (error) { console.error("Error fetching providers:", error); throw error; }
    return data || [];
};

export const getStatuses = async (): Promise<Status[]> => {
    const { data, error } = await supabase.from('estados').select('*');
    if (error) { console.error('Error fetching statuses:', error); throw error; }
    return data || [];
};

export const getPaymentConditions = async (): Promise<PaymentCondition[]> => {
    const { data, error } = await supabase.from('condiciones_pago').select('*').order('dias', { ascending: true });
    if (error) { console.error('Error fetching payment conditions:', error); throw error; }
    return data || [];
};

export const getSalesStages = async (): Promise<SalesStage[]> => {
  const { data, error } = await supabase.from('etapas_venta').select('*').order('orden', { ascending: true });
  if (error) { console.error('Error fetching sales stages:', error); throw error; }
  return data || [];
};

export const getProducts = async (): Promise<Product[]> => {
    const { data, error } = await supabase.from('productos').select('*').order('nombre', { ascending: true });
    if (error) { console.error('Error fetching products:', error); throw error; }
    return data || [];
};

export const getBankAccounts = async (): Promise<BankAccount[]> => {
    const { data, error } = await supabase.from('cuentas_bancarias').select('*');
    if (error) { console.error('Error fetching bank accounts:', error); throw error; }
    return data || [];
};

export const getLotes = async (): Promise<Lote[]> => {
    const { data, error } = await supabase.from('lotes').select('*');
    if (error) { console.error('Error fetching lotes:', error); throw error; }
    return data || [];
};

export const getEstadosPedido = async (): Promise<EstadoPedido[]> => {
  const { data, error } = await supabase.from('estados_pedido').select('*');
  if (error) { console.error('Error fetching estados pedido:', error); throw error; }
  return data || [];
};

export const getDepositos = async (): Promise<Deposito[]> => {
  const { data, error } = await supabase.from('depositos').select('*');
  if (error) { console.error('Error fetching depositos:', error); throw error; }
  return data || [];
};

export const getSharedConfig = async (): Promise<Record<string, any>> => {
    const { data, error } = await supabase
      .from('configuracion')
      .select('clave, valor');
      
    if (error) { console.error('Error fetching config:', error); throw error; }
    return (data || []).reduce((acc, item) => {
        acc[item.clave] = item.valor;
        return acc;
    }, {});
};

export const getStockVendedores = async (): Promise<StockVendedor[]> => {
  const { data, error } = await supabase.from('stock_vendedores').select('*');
  if (error) { console.error('Error fetching stock vendedores:', error); throw error; }
  return data || [];
};

export const getRoles = async (): Promise<any[]> => {
    const { data, error } = await supabase.from('roles').select('*');
    if (error) { console.error('Error fetching roles:', error); throw error; }
    return data || [];
};