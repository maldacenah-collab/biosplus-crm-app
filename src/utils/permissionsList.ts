// src/utils/permissionsList.ts

export const ALL_PERMISSIONS: string[] = [
    // Dashboard
    'dashboard:ver:gerencial',
    'dashboard:ver:propio',

    // Configuracion
    'configuracion:ver',
    'configuracion:editar:roles',
    'configuracion:editar:empresa',
    'configuracion:editar:etapas',

    // Contactos
    'contactos:ver:propios',
    'contactos:ver:todos',
    'contactos:crear',
    'contactos:editar',
    'contactos:eliminar',
    'contactos:asignar_vendedor',

    // Oportunidades
    'oportunidades:ver:propias',
    'oportunidades:ver:todos',
    'oportunidades:crear',
    'oportunidades:editar',
    'oportunidades:eliminar',
    'oportunidades:editar:precio',

    // Pedidos
    'pedidos:ver:propios',
    'pedidos:ver:todos',
    'pedidos:crear',
    'pedidos:editar',
    'pedidos:anular',
    'pedidos:cambiar_estado',
    'pedidos:anular:propios',
    'pedidos:ver:precios',
    'pedidos:descargar:pdf',

    // Productos e Inventario
    'productos:ver',
    'productos:crear',
    'productos:editar',
    
    // Stock
    'stock:ver:general',
    'stock:ver:propios',
    'stock:asignar',
    'stock:ajustar',

    // Compras
    'compras:ver',
    'compras:crear',
    'compras:editar',
    'compras:recepcionar',
    'compras:reversar',
    
    // Cta Cte Clientes
    'ctacte_clientes:ver:propios',
    'ctacte_clientes:ver:todos',
    'ctacte_clientes:crear_pago',

    // Cta Cte Proveedores
    'ctacte_proveedores:ver',
    'ctacte_proveedores:crear_pago',

    // Análisis de Ventas
    'analisis:ver:propios',
    'analisis:ver:todos',
    'analisis:ver:gerencial',

    // Comisiones
    'comisiones:ver:propias',
    'comisiones:ver:todas',
    'comisiones:liquidar',

    // Aprobaciones
    'solicitudes:resolver',

    // Vista 360
    'vista360:acceder'
];