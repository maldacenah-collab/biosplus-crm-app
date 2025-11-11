// src/components/cuentaCorriente/CtaCorrienteDetailView.tsx
import React, { useEffect, useState, useMemo } from 'react';
import { useCtaCorrienteStore } from '../../stores/useCtaCorrienteStore';
import { SaldoClienteGlobal, MovimientoCtaCorrienteCliente, DocumentoPendienteCliente, DeudaProveedorAgrupada } from '../../types';
import { formatCurrency } from '../../utils/formatters';
import { can } from '../../utils/permissions';
import { useSharedStore } from '../../stores/useSharedStore';
import { supabase } from '../../services/supabase';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface Props {
  contact: SaldoClienteGlobal;
  onBack: () => void;
}

const CtaCorrienteDetailView = ({ contact, onBack }: Props) => {
  const { 
    movimientos, 
    documentosPendientes, 
    deudasProveedores,
    isDetailLoading, 
    fetchDetalleContacto,
    registrarPago,
    anularMovimiento
  } = useCtaCorrienteStore();
  const { currentUser } = useSharedStore();
  
  const [isSaving, setIsSaving] = useState(false);
  const [pagoMonto, setPagoMonto] = useState('');
  const [isPagoCruzado, setIsPagoCruzado] = useState(false);
  const { modalProps, showMessage, hideModal } = useActionModal();
  
  const saldoFinal = useMemo(() => {
    return movimientos.reduce((acc, mov) => acc + mov.debe - mov.haber, 0);
  }, [movimientos]);

  useEffect(() => {
    fetchDetalleContacto(contact.id);
  }, [contact.id, fetchDetalleContacto]);

  const handleAnular = async (movimientoId: number) => {
    if (confirm('¿Está seguro de que desea anular este pago? Esta acción es irreversible.')) {
        await anularMovimiento(movimientoId, contact.id);
    }
  }

  const handleRegistrarPago = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsSaving(true);

    const form = e.target as HTMLFormElement;
    const formData = new FormData(form);
    
    const monto = parseFloat(pagoMonto.replace(/\./g, '').replace(',', '.')) || 0;
    if (monto <= 0) {
        showMessage('Monto inválido', 'El monto debe ser mayor a cero.', [
            { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
        ]);
        setIsSaving(false);
        return;
    }
    
    try {
        let comprobanteUrl: string | null = null;
        const file = formData.get('comprobante') as File;
        if (file && file.size > 0) {
            const fileName = `cliente_${contact.id}/cobranza_${new Date().toISOString()}_${file.name}`;
            const { error: uploadError } = await supabase.storage.from('comprobantes_pago_clientes').upload(fileName, file);
            if (uploadError) throw new Error(`Error al subir el comprobante: ${uploadError.message}`);
            const { data } = supabase.storage.from('comprobantes_pago_clientes').getPublicUrl(fileName);
            comprobanteUrl = data.publicUrl;
        }
        
        const pagoData: any = {
            p_contacto_id: contact.id,
            p_monto: monto,
            p_metodo_pago: formData.get('metodo'),
            p_referencia: formData.get('referencia'),
            p_fecha_pago: formData.get('fecha'),
            p_es_cruzado: isPagoCruzado,
            p_comprobante_url: comprobanteUrl,
            p_user_id: currentUser?.id,
        };

        if (isPagoCruzado) {
            const compraCruzada = formData.get('compra_cruzada') as string;
            if (!compraCruzada) throw new Error('Debe seleccionar una deuda de proveedor para el pago cruzado.');
            const [proveedorId, compraId] = compraCruzada.split('|');
            pagoData.p_proveedor_id = proveedorId;
            pagoData.p_compra_id = parseInt(compraId);
        }

        await registrarPago(pagoData);
        showMessage('Pago registrado', 'Pago registrado con éxito.', [
            { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
        ]);
        form.reset();
        setPagoMonto('');
        setIsPagoCruzado(false);

    } catch (error: any) {
        showMessage('Error', `Error: ${error.message}`, [
            { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
        ]);
    } finally {
        setIsSaving(false);
    }
  };

  if (isDetailLoading) {
    return <div>Cargando detalle del cliente...</div>;
  }

  return (
    <>
    <div className="space-y-6">
      <button onClick={onBack} className="btn btn-secondary text-sm">&larr; Volver a la lista</button>
      
      <div className="bg-white p-6 rounded-lg shadow-md">
        <h2 className="text-xl font-semibold">{contact.nombre}</h2>
        <p className="text-gray-600">Saldo Actual: 
            <span className={`font-bold text-lg ml-2 ${saldoFinal > 0 ? 'text-red-600' : 'text-text-secondary'}`}>
                {formatCurrency(saldoFinal)}
            </span>
        </p>
      </div>

      {can('ctacte_clientes:crear_pago') && (
        <form onSubmit={handleRegistrarPago} className="bg-gray-50 p-6 rounded-lg border">
            <h3 className="font-semibold text-lg mb-4">Registrar Nuevo Pago</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                 <div><label className="form-label">Monto</label><input type="text" value={pagoMonto} onChange={e => setPagoMonto(e.target.value)} className="form-input"/></div>
                 <div><label className="form-label">Método</label><select name="metodo" className="form-input"><option>Transferencia</option><option>Efectivo</option><option>Cheque</option></select></div>
                 <div><label className="form-label">Referencia</label><input name="referencia" type="text" className="form-input" /></div>
                 <div><label className="form-label">Fecha del Pago</label><input name="fecha" type="date" defaultValue={new Date().toISOString().split('T')[0]} className="form-input" /></div>
                 <div className="md:col-span-2"><label className="form-label">Comprobante</label><input name="comprobante" type="file" className="form-input" /></div>
                 {deudasProveedores.length > 0 && (
                    <div className="md:col-span-2">
                        <label className="flex items-center"><input type="checkbox" checked={isPagoCruzado} onChange={e => setIsPagoCruzado(e.target.checked)} className="h-4 w-4"/> <span className="ml-2">Es un Pago Cruzado</span></label>
                        {isPagoCruzado && (
                            <div className="mt-2">
                                <label className="form-label">Deuda de proveedor a saldar</label>
                                <select name="compra_cruzada" className="form-input">
                                    <option value="">Seleccione...</option>
                                    {deudasProveedores.map(d => (
                                        <option key={d.compra_id} value={`${d.proveedor_id}|${d.compra_id}`}>
                                            {d.proveedor_nombre} - OC-{d.compra_id} - Saldo: {formatCurrency(d.compra_saldo_pendiente)}
                                        </option>
                                    ))}
                                </select>
                            </div>
                        )}
                    </div>
                 )}
            </div>
            <div className="mt-4 text-right"><button type="submit" className="btn btn-primary" disabled={isSaving}>{isSaving ? 'Guardando...' : 'Añadir Pago'}</button></div>
        </form>
      )}

        <div className="bg-white p-6 rounded-lg shadow-md">
            <h3 className="font-semibold text-lg mb-4">Documentos Pendientes de Pago</h3>
            {documentosPendientes.length > 0 ? (
                <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                        <thead className="bg-gray-50">
                            <tr>
                                <th className="p-2 text-left">Tipo</th>
                                <th className="p-2 text-left">Número</th>
                                <th className="p-2 text-left">Fecha</th>
                                <th className="p-2 text-right">Total</th>
                                <th className="p-2 text-right">Saldo Pendiente</th>
                            </tr>
                        </thead>
                        <tbody>
                            {documentosPendientes.map(doc => (
                                <tr key={`${doc.tipo}-${doc.documento_id}`} className="border-t">
                                    <td className="p-2">{doc.tipo}</td>
                                    <td className="p-2">{doc.numero}</td>
                                    <td className="p-2">{new Date(doc.fecha).toLocaleDateString('es-AR')}</td>
                                    <td className="p-2 text-right">{formatCurrency(doc.total)}</td>
                                    <td className="p-2 text-right font-semibold text-red-600">{formatCurrency(doc.saldo_pendiente)}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            ) : <p className="text-sm text-gray-500">Este cliente no tiene documentos pendientes de pago.</p>}
        </div>

      <div className="bg-white p-6 rounded-lg shadow-md">
        <h3 className="font-semibold text-lg mb-4">Historial de Cuenta Corriente</h3>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead className="bg-gray-50">
              <tr>
                <th className="p-2 text-left">Fecha</th>
                <th className="p-2 text-left">Concepto</th>
                <th className="p-2 text-right">Debe</th>
                <th className="p-2 text-right">Haber</th>
                <th className="p-2 text-right">Saldo</th>
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
                  <td className="p-2 text-center">{m.haber > 0 && can('ctacte_clientes:crear_pago') && <button onClick={() => handleAnular(m.id)} className="text-xs text-red-500 hover:underline">Anular</button>}</td>
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

export default CtaCorrienteDetailView;
