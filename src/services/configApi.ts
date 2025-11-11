// src/services/configApi.ts
import { supabase } from './supabase';
import { UserWithRoles, RoleWithPermissions, Perfil, SalesStage, ReglaAlerta, BankAccount } from '../types';

// --- Users, Roles, Permissions ---

export const getUsersWithRoles = async (): Promise<UserWithRoles[]> => {
    const { data, error } = await supabase.rpc('get_todos_los_usuarios_con_roles');
    if (error) throw error;
    return data || [];
};

export const getRolesWithPermissions = async (): Promise<RoleWithPermissions[]> => {
    const { data, error } = await supabase.rpc('get_roles_con_permisos');
    if (error) throw error;
    return data || [];
};

export const setUserRoles = async (userId: string, roleNames: string[]): Promise<void> => {
    const { error } = await supabase.rpc('set_usuario_roles', {
        p_usuario_id: userId,
        p_roles_nombres: roleNames,
    });
    if (error) throw error;
};

export const setPermissionsForRole = async (roleId: number, permissionNames: string[]): Promise<void> => {
    const { error } = await supabase.rpc('set_permisos_para_rol', {
        p_rol_id: roleId,
        p_permisos_nombres: permissionNames,
    });
    if (error) throw error;
};

// --- Perfiles ---
export const getPerfiles = async (): Promise<Perfil[]> => {
    const { data, error } = await supabase
        .from('perfiles')
        .select('*, vendedores(*), usuario_roles(roles(nombre_rol))');
    if (error) throw error;
    return data || [];
};

export const getPerfilById = async (id: string): Promise<Perfil | null> => {
    const { data, error } = await supabase
        .from('perfiles')
        .select('*, vendedores(*), usuario_roles(roles(nombre_rol))')
        .eq('id', id)
        .single();
    if (error) {
        console.error("Error fetching perfil by ID:", error);
        return null;
    }
    return data;
}

// --- Company Config & Bank Accounts ---
export const saveConfig = async (configToSave: Record<string, any>) => {
    const updates = Object.entries(configToSave).map(([key, value]) => ({
        clave: key,
        valor: value,
    }));

    const { error } = await supabase.from('configuracion').upsert(updates, { onConflict: 'clave' });
    if (error) throw error;
};

export const addBankAccount = async (accountData: Omit<BankAccount, 'id'>) => {
    const { error } = await supabase.from('cuentas_bancarias').insert([accountData]);
    if (error) throw error;
};

export const deleteBankAccount = async (accountId: number) => {
    const { error } = await supabase.from('cuentas_bancarias').delete().eq('id', accountId);
    if (error) throw error;
};


// --- Sales Funnel (Etapas de Venta) ---
export const upsertSalesStages = async (stages: Partial<SalesStage>[]) => {
    const { error } = await supabase.from('etapas_venta').upsert(stages);
    if (error) throw error;
}

export const updateSalesStages = async (stages: Pick<SalesStage, 'id' | 'nombre' | 'orden'>[]) => {
    const updates = stages.map(stage =>
        supabase
            .from('etapas_venta')
            .update({ nombre: stage.nombre, orden: stage.orden })
            .eq('id', stage.id)
    );
    const results = await Promise.all(updates);
    const failed = results.find(res => res.error);
    if (failed?.error) {
        throw failed.error;
    }
}

export const deleteSalesStage = async (stageId: number) => {
    const { error } = await supabase.from('etapas_venta').delete().eq('id', stageId);
    if (error) throw error;
}

// --- Alert Rules ---
export const getAlertRules = async (): Promise<ReglaAlerta[]> => {
    const { data, error } = await supabase.from('reglas_alertas').select('*').order('id');
    if (error) throw error;
    return data || [];
};

export const updateAlertRule = async (id: number, updates: Partial<ReglaAlerta>): Promise<void> => {
    const { error } = await supabase.from('reglas_alertas').update(updates).eq('id', id);
    if (error) throw error;
};

export const deleteAlertRule = async (id: number): Promise<void> => {
    const { error } = await supabase.from('reglas_alertas').delete().eq('id', id);
    if (error) throw error;
}
