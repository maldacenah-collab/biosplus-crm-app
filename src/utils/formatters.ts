// src/utils/formatters.ts
// Este archivo contiene funciones de ayuda para formatear datos.

import { BankAccount, OpportunityProduct, PedidoProduct } from '../types';

/**
 * Formats a number as a currency string, defaulting to ARS.
 * @param value The numeric value to format.
 * @param currency The currency code (e.g., 'ARS', 'USD').
 * @returns A formatted currency string.
 */
export const formatCurrency = (value: number, currency = 'ARS'): string => {
    const number = Number(value) || 0;
    return number.toLocaleString('es-AR', { style: 'currency', currency: currency });
};

/**
 * Formatea un número de teléfono para que sea compatible con la URL de WhatsApp (wa.me).
 * Elimina caracteres no numéricos y añade el prefijo internacional si es necesario.
 * @param phone El número de teléfono a formatear.
 * @param countryCode El código del país (ej. "AR" para Argentina).
 * @returns El número de teléfono limpio y formateado.
 */
export const formatPhoneNumberForWhatsApp = (phone?: string, countryCode = "AR"): string => {
  if (!phone) return "";
  let cleanPhone = phone.replace(/\D/g, "");
  const prefixes: { [key: string]: string } = { AR: "549", PY: "595", UY: "598" }; // Corregido para Argentina
  const prefix = prefixes[countryCode] || "549";

  if (cleanPhone.startsWith(prefix.substring(0, 2))) {
    // Si ya tiene "54", verificamos si le falta el "9"
    if (cleanPhone.length === 12 && cleanPhone.startsWith("54") && !cleanPhone.startsWith("549")) {
        // Formato 54 + 10 dígitos (ej: 541122334455) -> 5491122334455
        return `549${cleanPhone.substring(2)}`;
    }
    return cleanPhone;
  }
  
  // Si tiene 10 dígitos (ej: 1122334455), se le agrega el prefijo completo
  if (countryCode === "AR" && cleanPhone.length === 10) {
    return `${prefix}${cleanPhone}`;
  }
  
  // Si ya tiene el 9 (ej: 91122334455), se le agrega solo el 54
  if (countryCode === "AR" && cleanPhone.length === 11 && cleanPhone.startsWith('9')) {
    return `54${cleanPhone}`;
  }

  return prefix + cleanPhone;
}

/**
 * Construye la URL correcta de WhatsApp según el dispositivo.
 * Evita perder caracteres (p. ej. emojis) cuando se abre desde escritorio.
 */
export const buildWhatsAppUrl = (phone?: string, message?: string): string => {
  if (!phone) return '#';
  const formattedPhone = formatPhoneNumberForWhatsApp(phone);
  const encodedMessage = message ? encodeURIComponent(message) : '';
  const isMobile = typeof navigator !== 'undefined'
    && /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
  const baseUrl = isMobile ? 'https://api.whatsapp.com/send' : 'https://web.whatsapp.com/send';
  const queryParts = [`phone=${formattedPhone}`];
  if (encodedMessage) {
    queryParts.push(`text=${encodedMessage}`);
  }
  return `${baseUrl}?${queryParts.join('&')}`;
};

/**
 * Genera un mensaje de WhatsApp formateado para presupuestos o pedidos.
 * @param details - Un objeto con los detalles necesarios para el mensaje.
 * @returns El string del mensaje formateado.
 */
export const generateWhatsAppMessage = (details: {
  contactName: string;
  type: 'Propuesta Comercial' | 'Pedido';
  number: string | number;
  products: (OpportunityProduct | PedidoProduct)[];
  total: number;
  paymentCondition: string;
  bankAccounts: BankAccount[];
}): string => {
  const { contactName, type, number, products, total, paymentCondition, bankAccounts } = details;

  const firstName = contactName.split(' ')[0] || contactName;

  let message = `¡Hola, *${firstName}*! 👋\n\n`;
  message += `Te enviamos el detalle de la *${type} N° ${String(number).padStart(4, '0')}*:\n\n`;
  message += `_*PRODUCTOS*_ 🛍️\n`;
  message += `-----------------------------------\n\n`;

  products.forEach(p => {
    const promoText = p.promo_aplicada ? ` (${p.promo_aplicada})` : '';
    message += `✨ *${p.cantidad} x ${p.nombre}*${promoText}\n`;
    message += `› Precio Unit.: ${formatCurrency(p.precio_unitario)}\n`;
    message += `› *Subtotal: ${formatCurrency(p.subtotal)}*\n\n`;
  });

  message += `-----------------------------------\n`;
  message += `*TOTAL: ${formatCurrency(total)}* 💰\n\n`;

  message += `*Condición de Pago:* ${paymentCondition}\n\n`;

  if (bankAccounts.length > 0 && paymentCondition.toLowerCase().includes('transferencia')) {
    message += `*Datos para el Pago:*\n`;
    bankAccounts.forEach(acc => {
      message += `🏦 *Banco:* ${acc.banco}\n`;
      if (acc.alias) message += `🆔 *Alias:* ${acc.alias}\n`;
      message += `🔢 *CBU:* ${acc.cbu_cvu}\n_(Haz clic en el número para copiarlo)_\n\n`;
    });
  }
  
  message += `Quedamos a tu disposición por cualquier consulta.\n¡Saludos!`;
  
  return message;
};
