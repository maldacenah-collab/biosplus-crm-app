// src/utils/promotions.ts
import { OpportunityProduct, Product } from '../types';

export const applyPromotions = (
    productsInCart: Omit<OpportunityProduct, 'subtotal'>[], 
    productsMasterList: Product[]
): OpportunityProduct[] => {
    const totalCombinableQuantity = productsInCart.reduce((sum, item) => {
        const fullProduct = productsMasterList.find((p) => p.id == item.producto_id);
        return fullProduct && fullProduct.permite_combinacion ? sum + Number(item.cantidad) : sum;
    }, 0);

    return productsInCart.map((item) => {
        // No sobreescribir precios manuales o ya aprobados
        if (item.promo_aplicada === 'Precio Manual' || item.promo_aplicada?.includes('Aprobado')) {
            return { ...item, subtotal: item.cantidad * item.precio_unitario };
        }
        
        const fullProduct = productsMasterList.find((p) => p.id == item.producto_id);
        if (!fullProduct) {
             // Si no se encuentra el producto, se mantiene el precio que tenía y se calcula el subtotal.
            const price = item.precio_unitario || 0;
            return { ...item, precio_unitario: price, subtotal: item.cantidad * price };
        }

        let bestPrice = fullProduct.precio_base || 0;
        let promoApplied: string | null = null;
        let quantityForPricing = Number(item.cantidad);
        let tierMet = false;

        if (fullProduct.permite_combinacion) {
            quantityForPricing = totalCombinableQuantity;
        }

        if (fullProduct.precios_escalonados && fullProduct.precios_escalonados.length > 0) {
            const sortedTiers = [...fullProduct.precios_escalonados].sort((a, b) => b.cantidad - a.cantidad);
            for (const tier of sortedTiers) {
                if (quantityForPricing >= tier.cantidad) {
                    bestPrice = tier.precio;
                    tierMet = true;
                    break; 
                }
            }
        }
        
        if (fullProduct.permite_combinacion && tierMet) {
            promoApplied = "Promo Combinada";
        } else if (tierMet) {
            promoApplied = `Precio x${quantityForPricing}`;
        }
        
        return {
            ...item,
            precio_unitario: bestPrice,
            subtotal: item.cantidad * bestPrice,
            promo_aplicada: promoApplied,
        };
    });
};
