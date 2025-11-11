// src/components/configuracion/EmbudoVentasTab.tsx
import React, { useEffect, useState } from 'react';
import { useSharedStore } from '../../stores/useSharedStore';
import { DragDropContext, Droppable, Draggable, DropResult } from "@hello-pangea/dnd";
import * as configApi from '../../services/configApi';
import { SalesStage } from '../../types';
import ActionModal from '../common/ActionModal';
import { useActionModal } from '../../utils/useActionModal';

const EmbudoVentasTab = () => {
    const { salesStages, fetchSharedData } = useSharedStore();
    const [stages, setStages] = useState<SalesStage[]>([]);
    const [newStageName, setNewStageName] = useState('');
    const { modalProps, showMessage, hideModal, showModal } = useActionModal();

    useEffect(() => {
        if (salesStages) {
            setStages([...salesStages].sort((a, b) => a.orden - b.orden));
        }
    }, [salesStages]);

    const handleOnDragEnd = (result: DropResult) => {
        if (!result.destination) return;
        const items = Array.from(stages);
        const [reorderedItem] = items.splice(result.source.index, 1);
        items.splice(result.destination.index, 0, reorderedItem);

        // Fix: Explicitly type 'item' as SalesStage to resolve spread operator error.
        const updatedStages = items.map((item: SalesStage, index) => ({ ...item, orden: index + 1 }));
        setStages(updatedStages);
    };

    const handleStageNameChange = (id: number, newName: string) => {
        setStages(stages.map(stage => stage.id === id ? { ...stage, nombre: newName } : stage));
    };
    
    const handleAddStage = async () => {
        if (!newStageName.trim()) return;
        const newOrder = stages.length > 0 ? Math.max(...stages.map(s => s.orden)) + 1 : 1;
        await configApi.upsertSalesStages([{ nombre: newStageName, orden: newOrder }]);
        fetchSharedData(true);
        setNewStageName('');
    };
    
    const handleSaveChanges = async () => {
        await configApi.updateSalesStages(stages.map(({ id, nombre, orden }) => ({ id, nombre, orden })));
        fetchSharedData(true);
        showMessage('Cambios guardados', 'Orden del embudo guardado.', [
            { label: 'Aceptar', onClick: hideModal, variant: 'primary' }
        ]);
    };
    
    const handleDeleteStage = async (id: number) => {
        const stage = stages.find(s => s.id === id);
        if (!stage) return;
        showModal((hide) => ({
            title: 'Eliminar etapa',
            message: `¿Estás seguro de que deseas eliminar la etapa "${stage.nombre}"?`,
            buttons: [
                { label: 'Cancelar', onClick: hide, variant: 'secondary' },
                {
                    label: 'Eliminar',
                    variant: 'danger',
                    onClick: async () => {
                        hide();
                        await configApi.deleteSalesStage(id);
                        fetchSharedData(true);
                    },
                },
            ],
        }));
    };
    
    return (
        <>
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div className="lg:col-span-2 bg-white p-6 rounded-lg shadow-md">
                <h2 className="text-xl font-semibold mb-4">Etapas de Presupuesto</h2>
                {/* Fix: Wrap DragDropContext's children in a fragment to resolve the missing 'children' prop error. */}
                <DragDropContext onDragEnd={handleOnDragEnd}>
                    <>
                    <Droppable droppableId="stages">
                        {(provided) => (
                            <div {...provided.droppableProps} ref={provided.innerRef} className="space-y-3">
                                {stages.map((stage, index) => (
                                    // Fix: Wrap Draggable in a React.Fragment and move the key to it to resolve the invalid 'key' prop error.
                                    <React.Fragment key={stage.id}>
                                    <Draggable draggableId={String(stage.id)} index={index}>
                                        {(provided) => (
                                            <div ref={provided.innerRef} {...provided.draggableProps} {...provided.dragHandleProps} className="flex items-center gap-2 p-3 border rounded-lg bg-gray-50">
                                                <span className="text-gray-500 cursor-move">☰</span>
                                                <input type="text" value={stage.nombre} onChange={e => handleStageNameChange(stage.id, e.target.value)} className="form-input flex-grow" />
                                                <button onClick={() => handleDeleteStage(stage.id)} className="text-red-500">&times;</button>
                                            </div>
                                        )}
                                    </Draggable>
                                    </React.Fragment>
                                ))}
                                {provided.placeholder}
                            </div>
                        )}
                    </Droppable>
                    </>
                </DragDropContext>
                <div className="text-right mt-6"><button onClick={handleSaveChanges} className="btn btn-primary">Guardar Cambios</button></div>
            </div>
            <div className="bg-white p-6 rounded-lg shadow-md">
                <h3 className="font-semibold mb-2">Añadir Nueva Etapa</h3>
                <div className="space-y-3">
                    <div><label className="form-label">Nombre</label><input type="text" value={newStageName} onChange={e => setNewStageName(e.target.value)} className="form-input" /></div>
                    <button onClick={handleAddStage} className="btn btn-secondary w-full">Añadir</button>
                </div>
            </div>
        </div>
        <ActionModal {...modalProps} />
        </>
    );
};

export default EmbudoVentasTab;
