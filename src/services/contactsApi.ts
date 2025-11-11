// src/services/contactsApi.ts
// Capa de abstracción para las operaciones CRUD de contactos con Supabase.

import { supabase } from './supabase';
import { Contact } from '../types';

export const getContacts = async (): Promise<Contact[]> => {
  const { data, error } = await supabase
    .from('contactos')
    .select('*, estados(id, nombre), vendedores(*, perfiles(nombre))');
  
  if (error) {
    console.error('Error fetching contacts:', error);
    throw error;
  }
  return data || [];
};

export const upsertContact = async (contactData: Partial<Contact>): Promise<Contact> => {
    const { id, ...dataForDb } = contactData;
    let savedContactId: number;

    if (id) {
        // Update existing contact
        const { data, error } = await supabase
            .from('contactos')
            .update(dataForDb)
            .eq('id', id)
            .select('id')
            .single();
        if (error) {
            console.error('Error updating contact:', error);
            throw error;
        }
        savedContactId = data.id;
    } else {
        // Create new contact
        const { data, error } = await supabase
            .from('contactos')
            .insert(dataForDb)
            .select('id')
            .single();
        if (error) {
            console.error('Error creating contact:', error);
            throw error;
        }
        savedContactId = data.id;
    }

    // After saving, fetch the full contact with relations to ensure UI consistency
    const { data: fullContact, error: fetchError } = await supabase
        .from('contactos')
        .select('*, estados(id, nombre), vendedores(*, perfiles(nombre))')
        .eq('id', savedContactId)
        .single();
    
    if (fetchError) {
        console.error('Error fetching full contact after upsert:', fetchError);
        throw fetchError;
    }

    return fullContact;
};

export const archiveOrDeleteContact = async (contactId: number): Promise<void> => {
    // Lógica para archivar si tiene relaciones, o borrar si no las tiene.
    // (Esta lógica se puede mover a una función de Supabase en el futuro)
    const { data: relations, error: checkError } = await supabase.rpc("check_contact_relations", { p_contact_id: contactId });

    if (checkError) {
        console.error('Error checking relations:', checkError);
        throw checkError;
    }
    
    if (relations.has_opportunities || relations.has_pedidos) {
        // Archivar: cambiar estado a 'Inactivo' y quitar vendedor.
        const { error: archiveError } = await supabase
            .from('contactos')
            .update({ estado_id: 2, vendedor_id: null }) // Asumiendo que 2 es 'Inactivo'
            .eq('id', contactId);
        if (archiveError) throw archiveError;
    } else {
        // Eliminar
        const { error: deleteError } = await supabase
            .from('contactos')
            .delete()
            .eq('id', contactId);
        if (deleteError) throw deleteError;
    }
};