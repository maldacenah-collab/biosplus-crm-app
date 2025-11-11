// src/components/pagosProveedores/PagosProveedoresDetailView.tsx
import React, { useEffect, useState, useMemo } from 'react';
import { usePagosProveedoresStore } from '../../stores/usePagosProveedoresStore';
import { SaldoProveedorGlobal } from '../../types';
import { formatCurrency } from '../../utils/formatters';
import { can } from '../../utils/permissions';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface Props {
  provider: SaldoProveedorGlobal;
  onBack: () => void;
}

const PagosProveedoresDetailView = ({ provider, onBack }: Props) => {
  const { 
    movimientos, 
    documentosPendientes, 
    isDetailLoading, 
    fetchDetalleProveedor,
    registrarPago,
    anularMovimiento,
  } = usePagosProveedoresStore();
  
  const [isSaving, setIsSaving] = useState(false);
  const { modalProps, showMessage, hideModal } = useActionModal();

  const saldoFinal = useMemo(() => {
    return movimientos.reduce((acc, mov) => acc + mov.debe - mov.haber, 0);
  }, [movimientos]);

  useEffect(() => {
    fetchDetalleProveedor(provider.id);
  }, [provider.id, fetchDetalleProveedor]);

  const handleRegistrarPago = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsSaving(true);
    const form = e.target as HTMLFormElement;
    const formData = new FormData(form);

    const pagoData = {
        p_proveedor_id: provider.id,
        p_monto: parseFloat(formData.get('monto') as string),
        p_metodo_pago: formData.get('metodo'),
        p_referencia: formData.get('referencia'),
        p_fecha_pago: formData.get('fecha')
    };

    if (!pagoData.p_monto || pagoData.p_monto <= 0) {
        showMessage('Monto inválido', 'El monto debe ser mayor a cero.', [
            { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
        ]);
        setIsSaving(false);
        return;
    }

    try {
        await registrarPago(pagoData);
        showMessage('Pago registrado', 'Pago registrado.', [
            { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
        ]);
        form.reset();
    } catch(error: any) {
        showMessage('Error', `Error: ${error.message}`, [
            { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
        ]);
    } finally {
        setIsSaving(false);
    }
  }

  const handleAnular = async (movimientoId: number) => {
    if(confirm('¿Seguro que desea anular este pago?')) {
        await anularMovimiento(movimientoId, provider.id);
    }
  }

  if (isDetailLoading) {
    return <div>Cargando detalle del proveedor...</div>;
  }

  return (
    <>
    <div className="space-y-6">
      <button onClick={onBack} className="btn btn-secondary text-sm">&larr; Volver a la lista</button>
      
      <div className="bg-white p-6 rounded-lg shadow-md">
        <h2 className="text-xl font-semibold">{provider.nombre}</h2>
        <p className="text-gray-600">Saldo Actual: <span className={`font-bold text-lg ml-2 ${saldoFinal > 0 ? 'text-red-600' : 'text-text-secondary'}`}>{formatCurrency(saldoFinal)}</span></p>
      </div>

      {can('ctacte_proveedores:crear_pago') && (
        <form onSubmit={handleRegistrarPago} className="bg-gray-50 p-6 rounded-lg border">
            <h3 className="font-semibold text-lg mb-4">Registrar Pago a Proveedor</h3>
            <div className="grid grid-cols-1 md:grid-cols-5 gap-4 items-end">
                <div><label className="form-label">Monto</label><input name="monto" type="number" step="0.01" className="form-input"/></div>
                <div><label className="form-label">Método</label><select name="metodo" className="form-input"><option>Transferencia</option><option>Efectivo</option><option>Cheque</option></select></div>
                <div><label className="form-label">Referencia</label><input name="referencia" type="text" className="form-input" /></div>
                <div><label className="form-label">Fecha</label><input name="fecha" type="date" defaultValue={new Date().toISOString().split('T')[0]} className="form-input" /></div>
                <button type="submit" className="btn btn-primary" disabled={isSaving}>{isSaving ? 'Guardando...' : 'Registrar Pago'}</button>
            </div>
        </form>
      )}

       <div className="bg-white p-6 rounded-lg shadow-md">
            <h3 className="font-semibold text-lg mb-4">Documentos Pendientes de Pago</h3>
            {documentosPendientes.length > 0 ? (
                 <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                        <thead className="bg-gray-50"><tr><th className="p-2 text-left">N° OC / Factura</th><th className="p-2 text-left">Fecha</th><th className="p-2 text-right">Total</th><th className="p-2 text-right">Saldo Pendiente</th></tr></thead>
                        <tbody>
                            {documentosPendientes.map(doc => (
                                <tr key={doc.compra_id} className="border-t">
                                    <td className="p-2">{doc.factura_nro || doc.numero_oc}</td>
                                    <td className="p-2">{new Date(doc.fecha).toLocaleDateString('es-AR')}</td>
                                    <td className="p-2 text-right">{formatCurrency(doc.total)}</td>
                                    <td className="p-2 text-right font-semibold text-red-600">{formatCurrency(doc.saldo_pendiente)}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            ) : <p className="text-sm text-gray-500">Este proveedor no tiene documentos pendientes de pago.</p>}
        </div>

      <div className="bg-white p-6 rounded-lg shadow-md">
        <h3 className="font-semibold text-lg mb-4">Historial de Cuenta Corriente</h3>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead className="bg-gray-50">
                <tr>
                    <th className="p-2 text-left">Fecha</th><th className="p-2 text-left">Concepto</th>
                    <th className="p-2 text-right">Debe</th><th className="p-2 text-right">Haber</th><th className="p-2 text-right">Saldo</th>
                    <th className="p-2 text-center">Acción</th>
                </tr>
            </thead>
            <tbody>
              {movimientos.map(m => (
                <tr key={m.id} className="border-t">
                  <td className="p-2">{new Date(m.fecha).toLocaleDateString('es-AR')}</td>
                  <td className="p-2">{m.concepto}</td>
                  <td className="p-2 text-right text-red-500">{m.debe > 0 ? formatCurrency(m.debe) : ''}</td>
                  <td className="p-2 text-right text-text-secondary">{m.haber > 0 ? formatCurrency(m.haber) : ''}</td>
                  <td className={`p-2 text-right font-semibold ${m.saldo > 0 ? 'text-red-600' : 'text-text-secondary'}`}>{formatCurrency(m.saldo)}</td>
                  <td className="p-2 text-center">{m.haber > 0 && can('ctacte_proveedores:crear_pago') && <button onClick={() => handleAnular(m.id)} className="text-xs text-red-500 hover:underline">Anular</button>}</td>
                </tr>
              )).reverse()}
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <ActionModal {...modalProps} />
    </>
  );
};

export default PagosProveedoresDetailView;
