// src/types/index.ts
// Este archivo centraliza las definiciones de tipo de TypeScript para el proyecto.

// --- TIPOS BÁSICOS Y COMPARTIDOS ---

export interface SalespersonProfile {
  nombre: string;
}

export interface Salesperson {
  id: number;
  perfiles: SalespersonProfile;
}

export interface Status {
  id: number;
  nombre: string;
}

export interface PaymentCondition {
  id: number;
  nombre: string;
  dias: number;
}

export interface BankAccount {
  id: number;
  banco: string;
  alias?: string;
  cbu_cvu: string;
  numero_cuenta?: string;
  sucursal?: string;
  organizacion_id: number;
}

export interface Deposito {
  id: number;
  nombre: string;
}

export interface Organizacion {
  id: number;
  nombre: string;
}

export interface CurrentUser {
    id: string;
    nombre: string;
    email: string;
    telefono?: string | null;
    foto_url?: string | null;
    vendedorId?: number | null;
    vendedorData?: any;
    roles: string[];
    permissions: string[];
    organizacion_id: number;
    nombre_organizacion: string;
    modo_creacion_organizacion_id?: number | null;
}


// --- TIPOS DE MÓDULO: CONFIGURACIÓN ---
export interface UserWithRoles {
    usuario_id: string;
    vendedor_id: number | null;
    nombre_vendedor: string;
    roles: string[];
}

export interface RoleWithPermissions {
    rol_id: number;
    nombre_rol: string;
    permisos: string[];
}

export interface Perfil {
  id: string;
  nombre: string;
  email: string;
  telefono?: string;
  foto_url?: string;
  vendedor_id?: number;
  vendedores?: VendedorData;
  usuario_roles: { roles: { nombre_rol: string } }[];
  organizacion_id?: number;
  organizaciones?: { nombre: string };
  modo_creacion_organizacion_id?: number | null;
}

export interface VendedorData {
  id: number;
  porcentaje_comision?: number;
  meta_ventas?: number;
}

export interface ReglaAlerta {
  id: number;
  nombre_regla: string;
  descripcion: string;
  entidad: string;
  condicion_sql: string;
  mensaje_alerta: string;
  mensaje_whatsapp?: string;
  activa: boolean;
}



// --- TIPOS DE MÓDULO: CONTACTOS Y PROVEEDORES ---

export interface Contact {
  id: number;
  created_at: string;
  nombre: string;
  telefono?: string;
  email?: string;
  vendedor_id?: number;
  estado_id?: number;
  clasificacion?: string;
  profesion?: string;
  especialidades?: string[];
  productos_habituales?: string;
  zona?: string;
  zona_id?: number | null;
  condicion_pago_id?: number;
  razon_social?: string;
  cuit?: string;
  condicion_iva?: string;
  requiere_factura?: boolean;
  porcentaje_facturacion_preferido?: number;
  domicilio_fiscal?: { full_address: string; piso?: string; depto?: string; zip?: string };
  direccion_entrega?: { full_address: string; days?: string; hours?: string; piso?: string; depto?: string; zip?: string; };
  direccion_entrega_2?: { full_address: string; days?: string; hours?: string; piso?: string; depto?: string; zip?: string; };
  entrega_en_sucursal?: boolean;
  deuda_actual?: number;
  ultima_compra?: string | null;
  foto_url?: string | null;
  vendedores?: Salesperson;
  estados?: Status;
  organizacion_id?: number;
}

export interface Provider {
  id: string;
  created_at: string;
  nombre: string;
  cuit?: string;
  condicion_pago_id?: number;
  direccion?: { street: string; city: string; province: string; zip: string; };
  contactos?: { tipo: string; nombre: string; telefono: string; }[];
  cuentas?: { banco: string; alias: string; cbu: string; numero_cuenta: string; sucursal: string; }[];
}


// --- TIPOS DE MÓDULO: VENTAS (OPORTUNIDADES, PEDIDOS) ---

export interface SalesStage {
  id: number;
  nombre: string;
  orden: number;
}

export interface OpportunityProduct {
  producto_id: number;
  nombre: string;
  cantidad: number;
  precio_unitario: number;
  subtotal: number;
  promo_aplicada?: string | null;
  datos_solicitud?: any;
}

export interface Opportunity {
  id: number;
  created_at: string;
  nombre: string;
  contacto_id: number;
  vendedor_id: number;
  etapa_id: number;
  valor: number;
  productos: OpportunityProduct[];
  fecha_cierre_prevista?: string | null;
  numero_propuesta: number;
  condicion_pago_id?: number | null;
  observaciones?: string | null;
  contactos?: Partial<Contact>;
  vendedores?: Salesperson;
  etapas_venta?: SalesStage;
  organizacion_id?: number;
}

export interface EstadoPedido {
  id: number;
  nombre: string;
}

export interface LogisticaEnvio {
  id: number;
  pedido_id: number;
  costo_envio?: number;
  tracking_number?: string;
  transportista_id?: number;
}

export interface PedidoProduct extends OpportunityProduct { 
  lote_seleccionado_id?: number | null;
  lote_numero?: string;
  fecha_vencimiento?: string;
}

export interface Pedido {
  id: number;
  created_at: string;
  numero_pedido: string;
  oportunidad_id?: number | null;
  contacto_id: number;
  vendedor_id: number;
  deposito_principal_id: number;
  estado_id: number;
  productos: PedidoProduct[];
  valor: number;
  direccion_entrega?: { full_address: string; days?: string; hours?: string; piso?: string; depto?: string; } | null;
  modalidad_entrega?: 'DOMICILIO' | 'OFICINA_COMERCIAL' | 'SUCURSAL_CORREO' | null;
  fecha_entrega_prevista?: string | null;
  dia_hora_entrega?: string | null;
  observaciones?: string | null;
  pagos_efectuados?: number;
  cobrar_en_entrega?: boolean;
  monto_a_cobrar?: number;
  condicion_pago_id?: number | null;
  estado_pago?: string;
  origen_stock?: 'deposito_principal' | 'stock_vendedor';
  reserva_creada?: boolean;
  reserva_confirmada?: boolean;
  contactos?: Partial<Contact>;
  vendedores?: Salesperson;
  estados_pedido?: EstadoPedido;
  organizacion_id?: number;
  logistica_envios?: LogisticaEnvio[];
}

// --- TIPO DE MÓDULO: LOGÍSTICA ---
export interface PedidoLogistica extends Pedido {
    destino: string;
    condicion_pago_nombre: string;
    condicion_pago_dias: number;
    pagado: boolean;
    proveedor_logistica_id?: number;
    numero_seguimiento?: string;
    costo_envio?: number;
    estado_nombre?: string;
}

export interface ZonaEnvio {
  id: number;
  nombre: string;
  costo: number;
  monto_minimo_bonificacion?: number;
  organizacion_id: number;
  geometria?: any;
}


// --- TIPOS DE MÓDULO: INVENTARIO Y COMPRAS ---

export interface PriceTier {
  cantidad: number;
  precio: number;
}

export interface Product {
  id: number;
  nombre: string;
  sku?: string;
  linea_marca?: string;
  categoria?: string;
  origen?: string;
  presentacion?: string;
  composicion?: string;
  especificaciones_adicionales?: any;
  precio_base: number;
  permite_combinacion: boolean;
  precios_escalonados?: PriceTier[];
  deposito_default_id?: number;
  stock_total?: number;
}

export interface Lote {
  id: number;
  producto_id: number;
  compra_id?: number;
  numero_lote: string;
  fecha_vencimiento?: string;
  cantidad_inicial: number;
  stock_disponible: number;
  stock_reservado: number; // Campo añadido para el nuevo flujo
  productos?: Product;
}

export interface StockVendedor {
  id: number;
  lote_id: number;
  vendedor_id: number;
  cantidad_asignada: number;
  created_at: string;
  lotes?: Partial<Lote>;
}

export interface StockGeneral {
  producto_id: number;
  nombre_producto: string;
  stock_deposito_disponible: number;
  stock_deposito_reservado: number;
  stock_asignado: number;
  stock_total_fisico: number;
  stock_por_vendedor: {
    vendedor_id: number;
    nombre: string;
    cantidad: number;
  }[];
}

export interface MovimientoStock {
  fecha: string;
  tipo_movimiento: string;
  producto_nombre: string;
  numero_lote?: string;
  cantidad: number;
  origen: string;
  destino: string;
  justificacion?: string;
  referencia: string;
  detalle: string;
}

export interface AuditResult {
  lote_id: number;
  producto_nombre: string;
  numero_lote: string;
  cantidad_inicial: number;
  total_entradas_ajuste: number;
  total_salidas: number;
  stock_fisico_teorico: number;
  stock_fisico_actual: number;
  diferencia: number;
}

export interface Compra {
    id: number;
    created_at: string;
    proveedor_id: number;
    deposito_id: number;
    fecha_emision: string;
    fecha_recepcion_prevista?: string;
    estado: 'Borrador' | 'Recibida';
    productos: any[];
    total_compra: number;
    factura_proveedor_nro?: string;
    proveedores?: { id: number, nombre: string };
}


// --- TIPOS PARA DASHBOARDS Y REPORTES ---

export interface DashboardData {
    ventas_mes_actual: number;
    meta_ventas: number;
    valor_stock_asignado: number;
    comisiones_a_pagar_total: number;
    comisiones_pagar_mes_actual: number;
    comisiones_pagar_meses_anteriores: number;
    total_por_cobrar_clientes: number;
    pipeline: { nombre: string, monto: number, cantidad: number }[];
}

export interface ContactoDashboard {
    id: number;
    nombre: string;
    telefono?: string;
    zona?: string;
    deuda_actual?: number;
    oportunidades_activas_conteo: number;
    oportunidades_activas_valor: number;
    ultima_actividad: string;
}

export interface Accion {
    entidad_id: number;
    tipo_entidad: string;
    regla_nombre: string;
    mensaje: string;
    telefono_contacto?: string;
    mensaje_whatsapp: string;
}

export interface TopItem {
    nombre: string;
    valor: number;
}

export interface DashboardGerencialData {
    ventas_totales_ars: number;
    costo_total_ars: number;
    rentabilidad_bruta_ars: number;
    margen_promedio: number;
    meta_global_ars: number;
    dinero_por_cobrar_ars: number;
    ticket_promedio_ars: number;
    ventas_totales_usd: number;
    rentabilidad_bruta_usd: number;
    ranking_vendedores: { vendedor_nombre: string, total_vendido: number, rentabilidad_vendedor: number, margen_vendedor: number }[];
    top_productos_rentables: { producto_nombre: string, unidades: number, rentabilidad_producto: number, margen_producto: number }[];
}


export interface TimelineEvent {
    entity_id: number | null;
    event_type: string;
    event_title: string;
    event_date: string;
    descripcion?: string | null;
    event_value?: number | null;
}

// --- TIPOS PARA ANÁLISIS DE VENTAS ---
export interface AnalisisProducto {
  nombre: string;
  linea: string;
  unidades: number;
  ventas_ars: number;
  ventas_usd: number;
  ventas_ars_anterior: number;
}

export interface AnalisisVendedor {
  nombre_vendedor: string;
  pedidos: number;
  ventas_ars: number;
  ventas_usd: number;
  ventas_ars_anterior: number;
}

export interface AnalisisLinea {
  linea: string;
  unidades: number;
  ventas_ars: number;
  ventas_usd: number;
  ventas_ars_anterior: number;
}

export interface AnalisisEvolucion {
  anio: number;
  ventas_ars: number;
  ventas_usd: number;
  pedidos: number;
  ticket_promedio_ars: number;
}

export interface AnalisisData {
  productos: AnalisisProducto[];
  vendedores: AnalisisVendedor[];
  lineas: AnalisisLinea[];
  evolucion: AnalisisEvolucion[];
}


// --- TIPOS PARA CUENTAS CORRIENTES ---

export interface SaldoClienteGlobal {
    id: number;
    nombre: string;
    saldo: number;
    fecha_deuda_mas_antigua: string;
    dias_condicion_pago: number;
    antiguedad_deuda: number;
    dias_vencida: number;
}

export interface MovimientoCtaCorrienteCliente {
    id: number;
    fecha: string;
    concepto: string;
    debe: number;
    haber: number;
    pedido_id: number | null;
    saldo: number; // Campo calculado
}

export interface DocumentoPendienteCliente {
    documento_id: number;
    tipo: 'Pedido' | 'Factura';
    numero: string;
    fecha: string;
    total: number;
    saldo_pendiente: number;
}

export interface DeudaProveedorAgrupada {
    proveedor_id: string;
    proveedor_nombre: string;
    proveedor_deuda_total: number;
    compra_id: number;
    compra_fecha: string;
    compra_factura_nro: string | null;
    compra_total: number;
    compra_saldo_pendiente: number;
}

export interface SaldoProveedorGlobal {
    id: string; // Es un UUID
    nombre: string;
    saldo: number;
}

export interface MovimientoCtaCorrienteProveedor {
    id: number;
    fecha: string;
    concepto: string;
    debe: number;
    haber: number;
    saldo: number; // Campo calculado
}

export interface DocumentoPendienteProveedor {
    compra_id: number;
    numero_oc: string;
    factura_nro: string | null;
    fecha: string;
    total: number;
    saldo_pendiente: number;
}

// --- TIPOS PARA COMISIONES Y REPORTES ---

export interface ResumenLiquidacion {
  vendedor_id: number;
  nombre_vendedor: string;
  comisiones_a_pagar: number;
  comisiones_potenciales: number;
}

export interface ComisionDetalle {
  comision_id: number;
  pedido_numero: string;
  cliente_nombre: string;
  monto_comision: number;
  fecha_generacion: string;
  fecha_pedido: string;
}

export interface HistorialPago {
    id: number;
    fecha_pago: string;
    monto_total: number;
    concepto: string;
    comprobante_url: string | null;
}

export interface Reporte {
    id: number;
    created_at: string;
    area_crm: string;
    descripcion: string;
    estado: 'Pendiente' | 'En Proceso' | 'Resuelto';
    reportado_por: string | null;
    prioridad: 'Baja' | 'Media' | 'Alta' | 'Crítica';
}

// --- TIPOS PARA CALL CENTER ---

export interface ContactForPrediction {
    id: number;
    nombre: string;
    ultima_compra: string | null;
    frecuencia_compra_dias: number | null;
    productos_habituales: string | null;
    deuda_actual: number;
    clasificacion: string | null;
    fecha_ultimo_contacto: string | null;
    telefono: string | null;
}

export interface SuggestedCall {
    contact_id: number;
    nombre: string;
    prioridad: 'Alta' | 'Media' | 'Baja';
    motivo: string;
    guion: string;
}