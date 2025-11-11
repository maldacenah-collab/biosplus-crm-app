// src/components/cliente360/InteractionModal.tsx
import React, { useState } from 'react';
import { useCliente360Store } from '../../stores/useCliente360Store';
import { useSharedStore } from '../../stores/useSharedStore';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

interface InteractionModalProps {
    isOpen: boolean;
    onClose: () => void;
    contactId: number;
}

const InteractionModal = ({ isOpen, onClose, contactId }: InteractionModalProps) => {
    const { addInteraction } = useCliente360Store();
    const { currentUser } = useSharedStore();
    const { modalProps, showMessage, hideModal } = useActionModal();
    const [type, setType] = useState('WhatsApp');
    const [summary, setSummary] = useState('');
    const [scheduleFollowUp, setScheduleFollowUp] = useState(false);
    const [followUpDate, setFollowUpDate] = useState('');
    const [isSaving, setIsSaving] = useState(false);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!summary.trim() || !currentUser) return;
        if (scheduleFollowUp && !followUpDate) {
            showMessage('Fecha requerida', 'Por favor, seleccione una fecha para el seguimiento.', [
                { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
            ]);
            return;
        }

        setIsSaving(true);
        try {
            await addInteraction({
                contacto_id: contactId,
                tipo: type,
                resumen: summary,
                user_id: currentUser.id,
                fecha_proximo_seguimiento: scheduleFollowUp ? followUpDate : undefined,
            });
            onClose();
            // Reset form for next time
            setSummary('');
            setType('WhatsApp');
            setScheduleFollowUp(false);
            setFollowUpDate('');
        } catch (error) {
            console.error(error);
            showMessage('Error', 'No se pudo registrar la interacción.', [
                { label: 'Cerrar', onClick: hideModal, variant: 'primary' }
            ]);
        } finally {
            setIsSaving(false);
        }
    };

    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center p-4">
            <div className="bg-white rounded-lg shadow-xl w-full max-w-lg">
                <form onSubmit={handleSubmit}>
                    <div className="p-4 border-b flex justify-between items-center">
                        <h2 className="text-xl font-semibold">Registrar Interacción</h2>
                        <button type="button" onClick={onClose} className="text-3xl font-light text-gray-500 hover:text-gray-800">&times;</button>
                    </div>
                    <div className="p-6 space-y-4">
                        <div>
                            <label className="form-label">Tipo de Interacción</label>
                            <div className="flex gap-2 mt-1">
                                {['WhatsApp', 'Llamada', 'Reunión'].map(t => (
                                    <button
                                        key={t}
                                        type="button"
                                        onClick={() => setType(t)}
                                        className={`btn text-sm ${type === t ? 'btn-primary' : 'btn-secondary'}`}
                                    >
                                        {t === 'WhatsApp' ? '💬' : t === 'Llamada' ? '📞' : '👥'} {t}
                                    </button>
                                ))}
                            </div>
                        </div>
                        <div>
                            <label htmlFor="summary" className="form-label">Resumen</label>
                            <textarea
                                id="summary"
                                value={summary}
                                onChange={e => setSummary(e.target.value)}
                                className="form-input"
                                rows={4}
                                required
                            />
                        </div>
                        <div className="pt-2 border-t">
                            <label className="flex items-center">
                                <input
                                    type="checkbox"
                                    checked={scheduleFollowUp}
                                    onChange={e => setScheduleFollowUp(e.target.checked)}
                                    className="h-4 w-4"
                                />
                                <span className="ml-2 text-sm">Agendar próximo seguimiento</span>
                            </label>
                            {scheduleFollowUp && (
                                <input
                                    type="date"
                                    value={followUpDate}
                                    onChange={e => setFollowUpDate(e.target.value)}
                                    className="form-input mt-2"
                                />
                            )}
                        </div>
                    </div>
                    <div className="p-4 border-t flex justify-end gap-2 bg-gray-50 rounded-b-lg">
                        <button type="button" onClick={onClose} className="btn btn-secondary">Cancelar</button>
                        <button type="submit" className="btn btn-primary" disabled={isSaving}>
                            {isSaving ? 'Guardando...' : 'Guardar'}
                        </button>
                    </div>
                </form>
            </div>
            <ActionModal {...modalProps} />
        </div>
    );
};

export default InteractionModal;
