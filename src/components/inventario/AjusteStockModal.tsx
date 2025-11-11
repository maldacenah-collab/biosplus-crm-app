// src/components/inventario/AjusteStockModal.tsx
import { useEffect, useState } from 'react';
import { useSharedStore } from '../../stores/useSharedStore';
import { useInventarioStore } from '../../stores/useInventarioStore';
import * as api from '../../services/inventarioApi';
import { Lote } from '../../types';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface AjusteStockModalProps {
  isOpen: boolean;
  productId: number | null;
  productName: string | null;
  onClose: () => void;
}

const AjusteStockModal = ({ isOpen, productId, productName, onClose }: AjusteStockModalProps) => {
    const { salespeople, currentUser } = useSharedStore();
    const { fetchStockGeneral } = useInventarioStore();
    const [origen, setOrigen] = useState('deposito');
    const [vendedorId, setVendedorId] = useState('');
    const [loteId, setLoteId] = useState('');
    const [tipoAjuste, setTipoAjuste] = useState('entrada');
    const [cantidad, setCantidad] = useState('');
    const [justificacion, setJustificacion] = useState('');
    const [lotesDisponibles, setLotesDisponibles] = useState<any[]>([]);
    const { modalProps, showMessage, hideModal } = useActionModal();

    useEffect(() => {
        const fetchLotes = async () => {
            if (!productId) return;
            setLotesDisponibles([]);
            if (origen === 'deposito') {
                const lotes = await api.getLotesByProducto(productId);
                setLotesDisponibles(lotes.map(l => ({ ...l, displayText: `Lote: ${l.numero_lote} (Stock: ${l.stock_disponible})` })));
            } else if (vendedorId) {
                const stockAsignado = await api.getStockAsignadoByProducto(productId, parseInt(vendedorId));
                setLotesDisponibles(stockAsignado.map(s => ({ ...s.lotes, id: s.lote_id, displayText: `Lote: ${s.lotes?.numero_lote} (Asignado: ${s.cantidad_asignada})` })));
            }
        };
        if (isOpen) {
            fetchLotes();
        }
    }, [isOpen, productId, origen, vendedorId]);
    
    const handleSave = async () => {
        if (!loteId || !cantidad || !justificacion) {
            showMessage('Datos incompletos', 'Complete todos los campos.', [
                { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
            ]);
            return;
        }
        let qty = parseInt(cantidad);
        if (tipoAjuste === 'salida' && qty > 0) qty = -qty;
        
        try {
            if (origen === 'deposito') {
                await api.ajustarStock(parseInt(loteId), qty, justificacion, currentUser?.nombre || 'Sistema');
            } else {
                 await api.devolverStockADeposito(parseInt(loteId), parseInt(vendedorId), qty, justificacion, currentUser?.nombre || 'Sistema');
            }
            await fetchStockGeneral();
            onClose();
        } catch (error) {
            console.error(error);
            showMessage('Error', 'Error al guardar el ajuste.', [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
            ]);
        }
    };

    if (!isOpen) return null;

    return (
        <>
        <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center p-4">
            <div className="bg-white rounded-lg shadow-xl w-full max-w-lg">
                <div className="p-4 border-b"><h3>Ajuste de Stock para: {productName}</h3></div>
                <div className="p-6 space-y-4">
                    <div className="grid grid-cols-2 gap-4">
                        <div><label className="form-label">Origen</label><select value={origen} onChange={e => setOrigen(e.target.value)} className="form-input"><option value="deposito">Depósito Principal</option><option value="vendedor">Stock de Vendedor</option></select></div>
                        {origen === 'vendedor' && <div><label className="form-label">Vendedor</label><select value={vendedorId} onChange={e => setVendedorId(e.target.value)} className="form-input"><option value="">Seleccione...</option>{salespeople.map(s => <option key={s.id} value={s.id}>{s.perfiles.nombre}</option>)}</select></div>}
                    </div>
                    <div><label className="form-label">Lote</label><select value={loteId} onChange={e => setLoteId(e.target.value)} className="form-input"><option value="">Seleccione...</option>{lotesDisponibles.map(l => <option key={l.id} value={l.id}>{l.displayText}</option>)}</select></div>
                    <div className="grid grid-cols-2 gap-4">
                        <div><label className="form-label">Tipo de Ajuste</label><select value={tipoAjuste} onChange={e => setTipoAjuste(e.target.value)} className="form-input">{origen === 'deposito' ? <><option value="entrada">Entrada</option><option value="salida">Salida</option></> : <option value="devolucion">Devolución a Depósito</option>}</select></div>
                        <div><label className="form-label">Cantidad</label><input type="number" value={cantidad} onChange={e => setCantidad(e.target.value)} className="form-input" /></div>
                    </div>
                    <div><label className="form-label">Justificación</label><textarea value={justificacion} onChange={e => setJustificacion(e.target.value)} className="form-input" rows={3}></textarea></div>
                </div>
                <div className="p-4 border-t flex justify-end gap-2">
                    <button onClick={onClose} className="btn btn-secondary">Cancelar</button>
                    <button onClick={handleSave} className="btn btn-primary">Confirmar Ajuste</button>
                </div>
            </div>
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default AjusteStockModal;
