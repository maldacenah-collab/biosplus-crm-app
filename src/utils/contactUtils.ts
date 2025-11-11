// src/utils/contactUtils.ts
import { Contact } from '../types';

export type AddressObject = {
    full_address: string;
    piso?: string;
    depto?: string;
    zip?: string;
    days?: string;
    hours?: string;
};

/**
 * Obtiene la dirección de entrega principal de un contacto siguiendo un orden de prioridad.
 * 1. direccion_entrega
 * 2. direccion_entrega_2
 * 3. domicilio_fiscal
 * @param contact El objeto de contacto.
 * @returns Un objeto de dirección o null si no se encuentra ninguna.
 */
export const getPrimaryAddress = (contact: Partial<Contact>): AddressObject | null => {
    if (contact.direccion_entrega && contact.direccion_entrega.full_address) {
        return contact.direccion_entrega;
    }
    if (contact.direccion_entrega_2 && contact.direccion_entrega_2.full_address) {
        return contact.direccion_entrega_2;
    }
    if (contact.domicilio_fiscal && contact.domicilio_fiscal.full_address) {
        // Adaptar la estructura de domicilio_fiscal a la de direccion_entrega
        return {
            full_address: contact.domicilio_fiscal.full_address,
            piso: contact.domicilio_fiscal.piso,
            depto: contact.domicilio_fiscal.depto,
            zip: contact.domicilio_fiscal.zip,
            days: '',
            hours: ''
        };
    }
    return null;
};
