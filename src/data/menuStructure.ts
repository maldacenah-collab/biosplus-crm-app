// src/data/menuStructure.ts

import {
  ChartBarIcon, PresentationChartLineIcon, UsersIcon, PhoneIcon, LightBulbIcon, ArchiveBoxIcon, CheckBadgeIcon,
  CubeIcon, TruckIcon, ShoppingCartIcon, BuildingStorefrontIcon,
  CurrencyDollarIcon, BanknotesIcon, GiftIcon,
  Cog6ToothIcon, FlagIcon, SparklesIcon, QuestionMarkCircleIcon
} from '@heroicons/react/24/outline';

export const navItems = [
    { type: 'group', title: 'Principal' },
    { type: 'link', to: '/dashboard', text: 'Dashboard', icon: ChartBarIcon, permission: 'dashboard:ver:propio' },
    { type: 'link', to: '/dashboard-gerencial', text: 'Gerencial', icon: PresentationChartLineIcon, permission: 'dashboard:ver:gerencial' },
    { type: 'link', to: '/analisis-ventas', text: 'Análisis de Ventas', icon: PresentationChartLineIcon, permission: 'analisis:ver:propios' },
    
    { type: 'group', title: 'Ventas' },
    { type: 'link', to: '/contactos', text: 'Contactos', icon: UsersIcon, permission: 'contactos:ver:propios' },
    { type: 'link', to: '/callcenter', text: 'Call Center IA', icon: PhoneIcon, permission: 'ia:usar:callcenter' },
    { type: 'link', to: '/asistente-ia', text: 'Asistente IA', icon: SparklesIcon, permission: 'ia:usar:asistente' },
    { type: 'link', to: '/oportunidades', text: 'Presupuestos', icon: LightBulbIcon, permission: 'oportunidades:ver:propias' },
    { type: 'link', to: '/pedidos', text: 'Pedidos', icon: ArchiveBoxIcon, permission: 'pedidos:ver:propios' },
    { type: 'link', to: '/aprobaciones', text: 'Aprobaciones', icon: CheckBadgeIcon, permission: 'solicitudes:resolver' },
    
    { type: 'group', title: 'Operaciones' },
    { type: 'link', to: '/inventario', text: 'Inventario', icon: CubeIcon, permission: 'stock:ver:propios' },
    { type: 'link', to: '/logistica', text: 'Logística', icon: TruckIcon, permission: 'pedidos:ver:todos' },
    { type: 'link', to: '/compras', text: 'Compras', icon: ShoppingCartIcon, permission: 'compras:ver' },
    { type: 'link', to: '/proveedores', text: 'Proveedores', icon: BuildingStorefrontIcon, permission: 'compras:ver' },

    { type: 'group', title: 'Finanzas' },
    { type: 'link', to: '/cuenta-corriente', text: 'Cta. Corriente', icon: CurrencyDollarIcon, permission: 'ctacte_clientes:ver:propios' },
    { type: 'link', to: '/pagos-proveedores', text: 'Pagos Proveedores', icon: BanknotesIcon, permission: 'ctacte_proveedores:ver' },
    { type: 'link', to: '/comisiones', text: 'Comisiones', icon: GiftIcon, permission: 'comisiones:ver:propias' },
    
    { type: 'group', title: 'Administración' },
    { type: 'link', to: '/configuracion', text: 'Configuración', icon: Cog6ToothIcon, permission: 'configuracion:ver' },

    { type: 'group', title: 'Soporte' },
    { type: 'link', to: '/manual', text: 'Manual de Usuario', icon: QuestionMarkCircleIcon, permission: 'dashboard:ver:propio' },
    { type: 'link', to: '/reportes', text: 'Reportes y Sugerencias', icon: FlagIcon, permission: 'configuracion:ver' }
];
