// src/pages/ManualPage.tsx
import React, { useState, useRef, useEffect } from 'react';

const sections = [
    { id: 'dashboard', title: 'Dashboard', group: 'Vistas Principales' },
    { id: 'dashboard_gerencial', title: 'Dashboard Gerencial', group: 'Vistas Principales' },
    { id: 'analisis_ventas', title: 'Análisis de Ventas', group: 'Vistas Principales' },
    { id: 'contactos', title: 'Contactos (Clientes)', group: 'Gestión Comercial' },
    { id: 'presupuestos', title: 'Presupuestos', group: 'Gestión Comercial' },
    { id: 'pedidos', title: 'Pedidos', group: 'Gestión Comercial' },
    { id: 'inventario', title: 'Inventario', group: 'Operaciones y Logística' },
    { id: 'logistica', title: 'Logística', group: 'Operaciones y Logística' },
    { id: 'compras', title: 'Compras y Proveedores', group: 'Operaciones y Logística' },
    { id: 'cuentas_corrientes', title: 'Cuentas Corrientes', group: 'Finanzas' },
    { id: 'pagos_proveedores', title: 'Pagos a Proveedores', group: 'Finanzas' },
    { id: 'comisiones', title: 'Comisiones', group: 'Finanzas' },
    { id: 'configuracion', title: 'Configuración', group: 'Administración' },
    { id: 'reportes', title: 'Reportes y Sugerencias', group: 'Administración' },
];

const groupedSections = sections.reduce((acc, section) => {
    if (!acc[section.group]) {
        acc[section.group] = [];
    }
    acc[section.group].push(section);
    return acc;
}, {} as Record<string, typeof sections>);

type SectionContentProps = {
    title: string;
    // Fix: Made children optional to resolve 'Property 'children' is missing' TypeScript error.
    children?: React.ReactNode;
};

const SectionContent = ({ title, children }: SectionContentProps) => (
    <div className="bg-white p-6 rounded-xl shadow-md border border-gray-200 mb-8">
        <h2 className="text-2xl font-bold text-primary mb-4 border-b pb-2">{title}</h2>
        <div className="space-y-4 text-text-secondary">
            {children}
        </div>
    </div>
);

const ManualPage = () => {
    const contentRef = useRef<HTMLDivElement>(null);

    const scrollToSection = (id: string) => {
        const element = document.getElementById(id);
        if (element && contentRef.current) {
            const topPos = element.offsetTop - contentRef.current.offsetTop + 24; // 24px for padding
            contentRef.current.scrollTo({
                top: topPos,
                behavior: 'smooth',
            });
        }
    };

    return (
        <div className="flex flex-col md:flex-row gap-8 h-full max-h-[calc(100vh-10rem)]">
            <aside className="w-full md:w-1/4 lg:w-1/5 bg-white p-6 rounded-xl shadow-md border border-gray-200">
                <h2 className="text-xl font-bold text-primary mb-4">Índice del Manual</h2>
                <nav className="space-y-4">
                    {Object.entries(groupedSections).map(([group, subSections]) => (
                        <div key={group}>
                            <h3 className="text-sm font-semibold text-gray-400 uppercase mb-2">{group}</h3>
                            <ul className="space-y-1">
                                {subSections.map(section => (
                                    <li key={section.id}>
                                        <button
                                            onClick={() => scrollToSection(section.id)}
                                            className="w-full text-left text-sm text-text-secondary hover:text-primary hover:bg-primary-light p-2 rounded-md transition-colors"
                                        >
                                            {section.title}
                                        </button>
                                    </li>
                                ))}
                            </ul>
                        </div>
                    ))}
                </nav>
            </aside>
            <main ref={contentRef} className="flex-1 overflow-y-auto pr-4 -mr-4">
                <div id="dashboard">
                    <SectionContent title="Dashboard">
                        <p><strong>¿Para qué sirve?</strong> Es tu centro de mando personal. Te da una visión rápida de tus métricas más importantes y tareas pendientes.</p>
                        <ul className="list-disc list-inside space-y-2">
                            <li><strong>Buscador Universal:</strong> La barra de búsqueda principal te permite encontrar al instante Contactos, Pedidos o Presupuestos.</li>
                            <li><strong>KPIs (Indicadores Clave):</strong> Visualiza tus ventas del mes, el valor de tu stock asignado, comisiones por cobrar y la deuda de tus clientes.</li>
                            <li><strong>Alertas Inteligentes:</strong> El sistema te notifica sobre acciones importantes, como un cliente que necesita seguimiento.</li>
                            <li><strong>Cartera de Profesionales:</strong> Un listado rápido de tus clientes con su deuda actual para un acceso directo.</li>
                        </ul>
                    </SectionContent>
                </div>
                <div id="dashboard_gerencial">
                     <SectionContent title="Dashboard Gerencial">
                        <p><strong>¿Para qué sirve?</strong> Ofrece una visión macro del negocio para la toma de decisiones estratégicas.</p>
                        <ul className="list-disc list-inside space-y-2">
                            <li><strong>KPIs Globales:</strong> Muestra las ventas totales, rentabilidad bruta, ticket promedio y deuda total de todos los vendedores.</li>
                            <li><strong>Gráficos Interactivos:</strong> Analiza el rendimiento por vendedor y los productos más rentables en un período determinado.</li>
                        </ul>
                    </SectionContent>
                </div>
                <div id="analisis_ventas">
                    <SectionContent title="Análisis de Ventas">
                        <p><strong>¿Para qué sirve?</strong> Para analizar en profundidad el rendimiento de ventas por productos, vendedores, líneas de producto o evolución en el tiempo.</p>
                        <ul className="list-disc list-inside space-y-2">
                           <li><strong>Filtros Avanzados:</strong> Filtra los datos por rangos de fecha y visualízalos en ARS o USD.</li>
                           <li><strong>Múltiples Vistas:</strong> Cambia entre gráficos de barras, torta o líneas para entender mejor la información.</li>
                           <li><strong>Tablas Detalladas:</strong> Revisa los datos numéricos exactos que componen cada gráfico.</li>
                        </ul>
                    </SectionContent>
                </div>
                <div id="contactos">
                    <SectionContent title="Contactos (Clientes)">
                        <p><strong>¿Para qué sirve?</strong> Es tu agenda de clientes. Aquí gestionas toda la información de tus profesionales.</p>
                         <ul className="list-disc list-inside space-y-2">
                            <li><strong>Crear y Editar:</strong> Rellena la ficha completa del cliente, incluyendo datos fiscales, direcciones y segmentación.</li>
                            <li><strong>Vista 360°:</strong> Accede a una ficha completa con el historial de interacciones, pedidos y cuenta corriente.</li>
                            <li><strong>Filtros y Búsqueda:</strong> Encuentra contactos rápidamente por vendedor, estado o zona.</li>
                        </ul>
                    </SectionContent>
                </div>
                 <div id="presupuestos">
                    <SectionContent title="Presupuestos (Oportunidades)">
                        <p><strong>¿Para qué sirve?</strong> Para crear, enviar y hacer seguimiento de las cotizaciones a tus clientes.</p>
                         <ul className="list-disc list-inside space-y-2">
                            <li><strong>Creación:</strong> Asocia un cliente, añade productos y el sistema aplicará promociones automáticamente.</li>
                            <li><strong>Generación de PDF:</strong> Crea un PDF profesional con el logo y datos bancarios para enviar.</li>
                            <li><strong>Conversión a Pedido:</strong> Con un solo clic, un presupuesto "Ganado" se convierte en un pedido.</li>
                        </ul>
                    </SectionContent>
                </div>
                <div id="pedidos">
                     <SectionContent title="Pedidos">
                        <p><strong>¿Para qué sirve?</strong> Para gestionar las órdenes de compra confirmadas por los clientes.</p>
                         <ul className="list-disc list-inside space-y-2">
                            <li><strong>Creación:</strong> Se pueden crear desde cero o a partir de un presupuesto.</li>
                            <li><strong>Gestión de Stock:</strong> Elige si el pedido se descuenta del Depósito Principal o de tu Stock de Vendedor.</li>
                            <li><strong>Cálculo de Envío:</strong> Selecciona la dirección y el sistema calcula el costo de envío según la zona.</li>
                             <li><strong>Anulación:</strong> Revierte automáticamente el stock y el movimiento en la cuenta corriente del cliente.</li>
                        </ul>
                    </SectionContent>
                </div>
                 <div id="inventario">
                    <SectionContent title="Inventario">
                        <p><strong>¿Para qué sirve?</strong> Es el centro de control para todo lo relacionado con los productos.</p>
                        <p>Se divide en 4 pestañas:</p>
                         <ul className="list-disc list-inside space-y-2">
                            <li><strong>Catálogo:</strong> Lista todos los productos y permite crearlos o editarlos.</li>
                            <li><strong>Gestión y Asignación:</strong> Muestra el stock consolidado (depósito, reservado, asignado) y permite transferir stock a vendedores.</li>
                            <li><strong>Movimientos de Stock:</strong> Historial completo de cada entrada y salida de productos.</li>
                            <li><strong>Auditoría:</strong> Herramienta para detectar y corregir discrepancias de stock.</li>
                        </ul>
                    </SectionContent>
                </div>
                <div id="logistica">
                    <SectionContent title="Logística">
                        <p><strong>¿Para qué sirve?</strong> Para la gestión de los envíos de pedidos que salen desde el depósito principal.</p>
                        <p>Se divide en 2 pestañas:</p>
                         <ul className="list-disc list-inside space-y-2">
                            <li><strong>Tablero Kanban:</strong> Visualiza los pedidos por estado (`En Preparación`, `Preparado`, etc.) y actualízalos arrastrando las tarjetas.</li>
                            <li><strong>Zonas de Envío:</strong> Mapa interactivo para dibujar polígonos, definir zonas geográficas y asignarles un costo de envío fijo.</li>
                        </ul>
                    </SectionContent>
                </div>
                 <div id="compras">
                    <SectionContent title="Compras y Proveedores">
                        <p><strong>¿Para qué sirve?</strong> Para gestionar las órdenes de compra a tus proveedores.</p>
                         <ul className="list-disc list-inside space-y-2">
                            <li><strong>Gestión de Proveedores:</strong> Crea y edita la ficha de cada proveedor.</li>
                            <li><strong>Creación de Órdenes de Compra (OC):</strong> Genera una OC, añade productos y define costos.</li>
                            <li><strong>Recepción de Mercadería:</strong> Al marcar una OC como "Recibida", cargas los lotes y el stock ingresa automáticamente al sistema.</li>
                        </ul>
                    </SectionContent>
                </div>
                <div id="cuentas_corrientes">
                    <SectionContent title="Cuentas Corrientes (Clientes)">
                        <p><strong>¿Para qué sirve?</strong> Para llevar un control detallado de la deuda de cada cliente.</p>
                         <ul className="list-disc list-inside space-y-2">
                            <li><strong>Registro de Pagos:</strong> Ingresa los pagos recibidos, adjunta comprobantes y el sistema los aplica a las deudas más antiguas.</li>
                        </ul>
                    </SectionContent>
                </div>
                <div id="pagos_proveedores">
                     <SectionContent title="Pagos a Proveedores">
                        <p><strong>¿Para qué sirve?</strong> Análogo a la Cta. Cte. de clientes, pero para gestionar las deudas con tus proveedores.</p>
                    </SectionContent>
                </div>
                <div id="comisiones">
                    <SectionContent title="Comisiones">
                        <p><strong>¿Para qué sirve?</strong> Para visualizar y gestionar el pago de tus comisiones por ventas.</p>
                         <ul className="list-disc list-inside space-y-2">
                            <li><strong>Vista de Vendedor:</strong> Muestra tus comisiones pendientes y el historial de pagos.</li>
                            <li><strong>Vista de Administración:</strong> Permite agrupar comisiones en una liquidación, adjuntar un comprobante y marcarlas como pagadas.</li>
                        </ul>
                    </SectionContent>
                </div>
                <div id="configuracion">
                    <SectionContent title="Configuración">
                        <p><strong>¿Para qué sirve?</strong> El panel de control del sistema para administradores.</p>
                         <ul className="list-disc list-inside space-y-2">
                            <li><strong>Empresa:</strong> Configura los datos del laboratorio, logo y cuentas bancarias.</li>
                            <li><strong>Perfiles y Seguridad:</strong> Crea usuarios, asigna roles y define permisos.</li>
                            <li><strong>Etapas de Presupuesto:</strong> Personaliza las etapas de tu embudo de ventas.</li>
                        </ul>
                    </SectionContent>
                </div>
                <div id="reportes">
                    <SectionContent title="Reportes y Sugerencias">
                         <p><strong>¿Para qué sirve?</strong> Es nuestro canal de comunicación directo para mejorar el CRM.</p>
                         <ul className="list-disc list-inside space-y-2">
                            <li><strong>Crear Reporte:</strong> Si encuentras un error o tienes una idea, puedes reportarlo aquí.</li>
                            <li><strong>Generar Prompt (Admin):</strong> Consolida todos los reportes pendientes en un texto para el asistente técnico.</li>
                        </ul>
                    </SectionContent>
                </div>
            </main>
        </div>
    );
};

export default ManualPage;