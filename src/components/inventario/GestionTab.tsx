// src/components/inventario/GestionTab.tsx
import { useEffect, useState, useMemo, MouseEvent } from 'react';
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import { useInventarioStore } from '../../stores/useInventarioStore';
import { useSharedStore } from '../../stores/useSharedStore';
import { Lote, Product, StockGeneral } from '../../types';
import * as api from '../../services/inventarioApi';
import { exportToCSV } from '../../utils/fileExport';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface GestionTabProps {
    onAdjustStock: (productId: number, productName: string) => void;
}

interface PopoverState {
  visible: boolean;
  loading: boolean;
  data: { numero_pedido: string, cliente_nombre: string }[];
  x: number;
  y: number;
}

const GestionTab = ({ onAdjustStock }: GestionTabProps) => {
    const { stockGeneral, fetchStockGeneral, isLoading, refreshAll } = useInventarioStore();
    const { salespeople } = useSharedStore();
    const { modalProps, showMessage, hideModal } = useActionModal();
    const [stockPrincipal, setStockPrincipal] = useState<Lote[]>([]);
    const [selectedVendedor, setSelectedVendedor] = useState('');
    const [stagedAsignacion, setStagedAsignacion] = useState<Record<number, { nombre: string; cantidad: number }>>({});
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [popover, setPopover] = useState<PopoverState>({ visible: false, loading: false, data: [], x: 0, y: 0 });

    useEffect(() => {
        fetchStockGeneral();
        api.getStockPrincipalParaAsignar().then(setStockPrincipal);
    }, [fetchStockGeneral]);
    
    const productosAgrupados = useMemo(() => {
        const grouped = stockPrincipal.reduce((acc, lote) => {
            const productoId = lote.productos!.id;
            if (!acc[productoId]) {
                acc[productoId] = { ...lote.productos!, stock_total: 0 };
            }
            acc[productoId].stock_total! += lote.stock_disponible;
            return acc;
        }, {} as Record<number, Product & { stock_total: number }>);
        return Object.values(grouped).sort((a: Product, b: Product) => a.nombre.localeCompare(b.nombre));
    }, [stockPrincipal]);

    const aggregatedStockGeneral = useMemo(() => {
        if (!stockGeneral) return [];
    
        const groupedByName = stockGeneral.reduce((acc, current) => {
            const name = current.nombre_producto;
            if (!acc[name]) {
                acc[name] = {
                    ...current,
                    stock_por_vendedor: current.stock_por_vendedor ? [...current.stock_por_vendedor] : []
                };
            } else {
                acc[name].stock_deposito_disponible += current.stock_deposito_disponible;
                acc[name].stock_deposito_reservado += current.stock_deposito_reservado;
                acc[name].stock_asignado += current.stock_asignado;
                acc[name].stock_total_fisico += current.stock_total_fisico;
    
                if (current.stock_por_vendedor) {
                    current.stock_por_vendedor.forEach(newVendedorStock => {
                        const existingVendedor = acc[name].stock_por_vendedor.find(v => v.vendedor_id === newVendedorStock.vendedor_id);
                        if (existingVendedor) {
                            existingVendedor.cantidad += newVendedorStock.cantidad;
                        } else {
                            acc[name].stock_por_vendedor.push({ ...newVendedorStock });
                        }
                    });
                }
            }
            return acc;
        }, {} as Record<string, StockGeneral>);
    
        return Object.values(groupedByName);
    }, [stockGeneral]);

    const handleMouseEnterReserved = async (e: MouseEvent<HTMLTableCellElement>, productId: number) => {
      setPopover({ visible: true, loading: true, data: [], x: e.clientX, y: e.clientY });
      try {
        const data = await api.getPedidosConReserva(productId);
        setPopover(prev => ({ ...prev, loading: false, data }));
      } catch (error) {
        console.error("Failed to fetch reserved stock details:", error);
        setPopover(prev => ({ ...prev, loading: false, data: [] }));
      }
    };
    
    const handleMouseLeaveReserved = () => {
      setPopover({ visible: false, loading: false, data: [], x: 0, y: 0 });
    };

    const handleStageAsignacion = () => {
        if (!selectedVendedor) {
            showMessage('Selección requerida', 'Por favor, seleccione un vendedor.', [
                { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
            ]);
            return;
        }
        const newStaged: Record<number, { nombre: string; cantidad: number }> = {};
        let hasErrors = false;
        productosAgrupados.forEach(producto => {
            const input = document.getElementById(`qty-producto-${producto.id}`) as HTMLInputElement;
            const cantidad = parseInt(input.value);
            if (cantidad > 0) {
                if (cantidad > producto.stock_total!) {
                    showMessage('Stock insuficiente', `La cantidad para ${producto.nombre} excede el stock disponible de ${producto.stock_total}.`, [
                        { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
                    ]);
                    hasErrors = true;
                    return;
                }
                newStaged[producto.id] = { nombre: producto.nombre, cantidad };
            }
        });

        if (hasErrors) return;
        if (Object.keys(newStaged).length === 0) {
            showMessage('Sin cantidades', 'No se ha ingresado ninguna cantidad para asignar.', [
                { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
            ]);
            return;
        }
        setStagedAsignacion(newStaged);
    };

    const generateAsignacionPDF = (vendedorNombre: string, asignacion: Record<number, { nombre: string; cantidad: number }>) => {
        const doc = new jsPDF();
        const addPageContent = (copyType: 'ORIGINAL' | 'DUPLICADO') => {
            doc.setFontSize(18);
            doc.text('Remito de Asignación de Stock', 14, 22);
            doc.setFontSize(10);
            doc.text(`Fecha: ${new Date().toLocaleDateString('es-AR')}`, 14, 30);
            doc.text(`Vendedor: ${vendedorNombre}`, 14, 36);
            doc.text(copyType, 180, 22);

            const tableColumn = ["Cantidad", "Producto"];
            // Fix: Type 'item' as 'any' to resolve 'does not exist on type unknown' error.
            const tableRows = Object.values(asignacion).map((item: any) => [item.cantidad, item.nombre]);

            autoTable(doc, {
                head: [tableColumn],
                body: tableRows,
                startY: 45,
            });

            const finalY = (doc as any).lastAutoTable.finalY || 60;
            doc.text('Recibí Conforme:', 14, finalY + 20);
            doc.line(14, finalY + 30, 80, finalY + 30);
            doc.text('Entregué Conforme:', 110, finalY + 20);
            doc.line(110, finalY + 30, 180, finalY + 30);
        };

        addPageContent('ORIGINAL');
        doc.addPage();
        addPageContent('DUPLICADO');

        doc.autoPrint();
        window.open(doc.output('bloburl'), '_blank');
    };
    
    const handleConfirmarAsignacion = async () => {
        const stagedCount = Object.keys(stagedAsignacion).length;
        if (stagedCount === 0 || !selectedVendedor) return;
        
        const selectedSalesperson = salespeople.find(s=>s.id == parseInt(selectedVendedor));
        if (!selectedSalesperson) return;

        if (!confirm(`¿Confirma la asignación de ${stagedCount} tipo(s) de producto(s) a ${selectedSalesperson?.perfiles.nombre}? Se generará un remito para imprimir.`)) return;
        
        setIsSubmitting(true);
        try {
            const asignacionesParaApi = Object.entries(stagedAsignacion).map(([producto_id, data]: [string, { nombre: string; cantidad: number }]) => ({ 
                producto_id: parseInt(producto_id), 
                cantidad: data.cantidad 
            }));
            await api.asignarStockMasivo(parseInt(selectedVendedor), asignacionesParaApi);

            generateAsignacionPDF(selectedSalesperson.perfiles.nombre, stagedAsignacion);
            
            showMessage('Asignación completa', 'Stock asignado con éxito.', [
                { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
            ]);

            setStagedAsignacion({});
            document.querySelectorAll<HTMLInputElement>('input[id^="qty-producto-"]').forEach(input => input.value = '');
            await refreshAll();
            api.getStockPrincipalParaAsignar().then(setStockPrincipal);

        } catch (error) {
            console.error(error);
            showMessage('Error', 'No se pudo completar la asignación.', [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
            ]);
        } finally {
            setIsSubmitting(false);
        }
    };

    const handleExportGeneral = () => {
        exportToCSV(
            ["ID_Producto", "Nombre", "Stock_Deposito", "Stock_Reservado", "Stock_Asignado", "Stock_Total"],
            aggregatedStockGeneral.map((p: StockGeneral) => [p.producto_id, p.nombre_producto, p.stock_deposito_disponible, p.stock_deposito_reservado, p.stock_asignado, p.stock_total_fisico]),
            `inventario_general_${new Date().toISOString().split('T')[0]}.csv`
        );
    };

    const handleExportDetalleAsignado = async () => {
        try {
            const data = await api.getStockAsignadoDetallado();
            if (data.length === 0) {
                showMessage('Sin datos', 'No hay stock asignado para exportar.');
                return;
            }
            exportToCSV(
                ["Vendedor", "Producto", "Lote", "Vencimiento", "Cantidad"],
                data.map(item => [item.vendedor_nombre, item.producto_nombre, item.numero_lote, item.fecha_vencimiento, item.cantidad_asignada]),
                `stock_asignado_detallado_${new Date().toISOString().split('T')[0]}.csv`
            );
        } catch (error) {
            console.error(error);
            showMessage('Error', 'Error al generar el reporte de stock asignado.', [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
            ]);
        }
    };

    return (
        <>
        <div className="space-y-8">
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-start">
                <div className="bg-white p-6 rounded-lg shadow-md space-y-4">
                     <h2 className="text-xl font-semibold mb-4 border-b pb-2">Paso 1: Preparar Asignación</h2>
                    <div>
                        <label className="form-label">Seleccione un Vendedor:</label>
                        <select value={selectedVendedor} onChange={e => setSelectedVendedor(e.target.value)} className="form-input w-full md:w-2/3">
                            <option value="">Seleccione...</option>
                            {salespeople.map(s => <option key={s.id} value={s.id}>{s.perfiles.nombre}</option>)}
                        </select>
                    </div>
                    <div className="border rounded-lg max-h-[50vh] overflow-y-auto">
                        <table className="w-full text-sm">
                            <thead className="bg-gray-50 sticky top-0"><tr><th className="p-2 text-left">Producto</th><th className="p-2 text-center">Disponible</th><th className="p-2 w-28">Cantidad</th></tr></thead>
                            <tbody>
                                {productosAgrupados.map(producto => (
                                    <tr key={`prep-${producto.id}`} className="border-t">
                                        <td className="p-2 font-medium">{producto.nombre}</td>
                                        <td className="p-2 text-center font-semibold text-primary">{producto.stock_total}</td>
                                        <td className="p-1"><input type="number" id={`qty-producto-${producto.id}`} className="form-input text-center w-full" min="0" max={producto.stock_total} placeholder="0" disabled={!selectedVendedor} /></td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                    <div className="text-right">
                        <button onClick={handleStageAsignacion} className="btn-secondary" disabled={!selectedVendedor || isSubmitting}>Preparar Asignación</button>
                    </div>
                </div>

                <div className="bg-white p-6 rounded-lg shadow-md space-y-4">
                    <h2 className="text-xl font-semibold mb-4 border-b pb-2">Paso 2: Confirmar y Asignar</h2>
                    <div className="min-h-[40vh] bg-gray-50 p-4 rounded-lg border overflow-y-auto">
                        {Object.keys(stagedAsignacion).length === 0 ? <p className="text-center text-gray-500 text-sm py-8">Añada productos para asignar.</p> : (
                            <div>
                                <p className="text-sm font-semibold mb-2">Para: <span className="text-primary">{salespeople.find(s=>s.id == parseInt(selectedVendedor))?.perfiles.nombre}</span></p>
                                <table className="w-full text-sm">
                                    <tbody>
                                        {Object.entries(stagedAsignacion).map(([id, data]) => (
                                            <tr key={`stage-${id}`} className="border-b"><td className="p-2 font-medium">{data.nombre}</td><td className="p-2 text-right font-bold">{data.cantidad} unid.</td></tr>
                                        ))}
                                    </tbody>
                                </table>
                            </div>
                        )}
                    </div>
                    <div className="text-right">
                        <button onClick={handleConfirmarAsignacion} className="btn-primary" disabled={Object.keys(stagedAsignacion).length === 0 || isSubmitting}>
                            {isSubmitting ? 'Procesando...' : 'Confirmar y Generar Remito'}
                        </button>
                    </div>
                </div>
            </div>

            <div className="bg-white p-6 rounded-lg shadow-md">
                <div className="flex justify-between items-center mb-4">
                    <h2 className="text-xl font-semibold">Inventario General</h2>
                    <button onClick={handleExportGeneral} className="btn-secondary hidden md:inline-flex items-center gap-2">
                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path></svg>
                        Exportar General
                    </button>
                </div>
                <div className="overflow-x-auto">
                     <table className="w-full text-sm">
                        <thead className="text-xs uppercase bg-gray-50"><tr><th className="px-6 py-3">Producto</th><th className="px-6 py-3 text-center">Depósito</th><th className="px-6 py-3 text-center text-amber-600 bg-amber-50">Reservado</th><th className="px-6 py-3 text-center">Asignado</th><th className="px-6 py-3 text-center font-bold">Total Físico</th><th className="px-6 py-3 text-center">Acciones</th></tr></thead>
                        <tbody>
                            {aggregatedStockGeneral.map((p: StockGeneral, index) => (
                                <tr key={`gen-${p.producto_id}-${index}`} className="border-b"><td className="px-6 py-4 font-medium">{p.nombre_producto}</td><td className="px-6 py-4 text-center">{p.stock_deposito_disponible}</td>
                                <td 
                                    className="px-6 py-4 text-center font-semibold text-amber-700 bg-amber-100 cursor-pointer relative"
                                    onMouseEnter={(e) => p.stock_deposito_reservado > 0 && handleMouseEnterReserved(e, p.producto_id)}
                                    onMouseLeave={handleMouseLeaveReserved}
                                >
                                    {p.stock_deposito_reservado}
                                </td>
                                <td className="px-6 py-4 text-center">{p.stock_asignado}</td><td className="px-6 py-4 text-center font-bold">{p.stock_total_fisico}</td><td className="px-6 py-4 text-center"><button onClick={() => onAdjustStock(p.producto_id, p.nombre_producto)} className="text-xs bg-gray-200 px-3 py-1 rounded hover:bg-gray-300">Ajustar</button></td></tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div className="bg-white p-6 rounded-lg shadow-md">
                 <div className="flex justify-between items-center mb-4">
                    <h2 className="text-xl font-semibold">Stock Asignado por Vendedor</h2>
                    <button onClick={handleExportDetalleAsignado} className="btn-secondary hidden md:inline-flex items-center gap-2">
                         <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path></svg>
                        Exportar Detalle
                    </button>
                </div>
                <div className="overflow-x-auto">
                     <table className="w-full text-sm">
                         <thead className="text-xs uppercase bg-gray-50"><tr><th className="px-6 py-3">Producto</th><th className="px-6 py-3">Detalle de Asignación</th></tr></thead>
                         <tbody>
                            {aggregatedStockGeneral.filter((p: StockGeneral) => p.stock_asignado > 0).map((p: StockGeneral, pIndex) => (
                                <tr key={`asig-${p.producto_id}-${pIndex}`} className="border-b">
                                    <td className="px-6 py-4 font-medium align-top">{p.nombre_producto}</td>
                                    <td className="px-6 py-4">
                                        {p.stock_por_vendedor?.map((v: { vendedor_id: number; nombre: string; cantidad: number; }, vIndex) => (
                                            <div key={`asig-vend-${p.producto_id}-${v.vendedor_id}-${vIndex}`} className="flex justify-between items-center text-xs py-1"><span>{v.nombre}</span><span className="font-bold bg-gray-200 px-2 py-0.5 rounded-full">{v.cantidad}</span></div>
                                        ))}
                                    </td>
                                </tr>
                            ))}
                         </tbody>
                     </table>
                </div>
            </div>
            {popover.visible && (
                <div 
                    className="fixed bg-white border border-gray-300 rounded-lg shadow-lg p-3 text-sm z-50"
                    style={{ top: `${popover.y + 15}px`, left: `${popover.x + 15}px` }}
                >
                    {popover.loading ? <p>Cargando...</p> : (
                        popover.data.length > 0 ? (
                            <ul className="space-y-1">
                                {popover.data.map(item => (
                                    <li key={item.numero_pedido}>
                                        <strong>{item.numero_pedido}:</strong> {item.cliente_nombre}
                                    </li>
                                ))}
                            </ul>
                        ) : <p>No hay reservas activas.</p>
                    )}
                </div>
            )}
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default GestionTab;
