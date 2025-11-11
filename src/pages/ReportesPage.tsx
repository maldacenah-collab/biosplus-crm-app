// src/pages/ReportesPage.tsx
// Fix: Import 'React' to resolve "Cannot find namespace 'React'" error, which is necessary for using types like React.FormEvent.
import React, { useEffect, useState } from 'react';
import { useReportesStore } from '../stores/useReportesStore';
import { useSharedStore } from '../stores/useSharedStore';
import { can } from '../utils/permissions';
import { Reporte } from '../types';
import ActionModal from '../components/common/ActionModal';
import { useActionModal } from '../utils/useActionModal';

const ReportesPage = () => {
    const { reportes, isLoading, fetchReportes, saveReporte, updateReporteStatus } = useReportesStore();
    const { currentUser } = useSharedStore();
    const { modalProps, showMessage } = useActionModal();

    const [area, setArea] = useState('');
    const [descripcion, setDescripcion] = useState('');
    const [prioridad, setPrioridad] = useState<'Media' | 'Baja' | 'Alta' | 'Crítica'>('Media');
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [isPromptModalOpen, setIsPromptModalOpen] = useState(false);
    const [generatedPrompt, setGeneratedPrompt] = useState('');

    const esAdmin = can('configuracion:editar:roles');
    
    const areasCRM = [
        'Dashboard', 'Dashboard Gerencial', 'Análisis de Ventas', 'Contactos', 
        'Presupuestos', 'Pedidos', 'Aprobaciones', 'Inventario', 'Logística', 
        'Compras', 'Proveedores', 'Cta. Corriente Clientes', 'Cta. Corriente Prov.', 
        'Comisiones', 'Configuración', 'Reportes', 'Cliente 360', 'Otro'
    ];

    useEffect(() => {
        fetchReportes();
    }, [fetchReportes]);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!descripcion.trim() || !area) {
            showMessage('Datos incompletos', 'Por favor complete todos los campos.');
            return;
        }
        setIsSubmitting(true);
        try {
            await saveReporte({
                area_crm: area,
                descripcion,
                prioridad,
                reportado_por: currentUser?.nombre || 'Desconocido',
                estado: 'Pendiente',
            } as Omit<Reporte, 'id' | 'created_at'>);
            
            showMessage('Reporte enviado', 'Reporte enviado con éxito. ¡Gracias por tu colaboración!');
            setArea('');
            setDescripcion('');
            setPrioridad('Media');

        } catch (error) {
            showMessage('Error', 'No se pudo enviar el reporte.');
        } finally {
            setIsSubmitting(false);
        }
    };
    
    const handleStatusChange = async (id: number, nuevoEstado: Reporte['estado']) => {
        await updateReporteStatus(id, nuevoEstado);
    };

    const handleGeneratePrompt = () => {
        const pendientes = reportes.filter(r => r.estado === 'Pendiente');
        if (pendientes.length === 0) {
            showMessage('Sin pendientes', 'No hay reportes pendientes para consolidar.');
            return;
        }
        
        let promptText = `### **Prompt Maestro Consolidado: CRM (Múltiples Bugs)**\n\n**1. Misión Principal:**\nResolver la siguiente lista de bugs reportados por los usuarios.\n\n**2. Contexto General:**\nSe han acumulado ${pendientes.length} reportes en estado "Pendiente". A continuación se detallan:\n\n`;
        
        pendientes.forEach((reporte, index) => {
            promptText += `--- REPORTE #${index + 1} (ID: ${reporte.id}) ---\n`;
            promptText += `* **Área:** ${reporte.area_crm}\n`;
            promptText += `* **Prioridad:** ${reporte.prioridad}\n`;
            promptText += `* **Descripción:** ${reporte.descripcion}\n\n`;
        });

        promptText += `**3. Solicitud:**\n"Gemini, como arquitecto del sistema, analiza cada uno de estos incidentes. Proporcióname un plan de acción y el código SQL y/o las funciones completas de JavaScript necesarias para solucionar todos los bugs listados, respetando los mandamientos del proyecto."`;

        setGeneratedPrompt(promptText);
        setIsPromptModalOpen(true);
    };
    
    const handleCopyPrompt = () => {
        const consoleErrors = (document.getElementById('console-error-input') as HTMLTextAreaElement).value;
        let finalPrompt = generatedPrompt;
        if(consoleErrors.trim()){
            finalPrompt += `\n\n**4. Errores de Consola Adicionales (Contexto):**\n\`\`\`\n${consoleErrors}\n\`\`\``;
        }
        navigator.clipboard.writeText(finalPrompt).then(() => {
            setIsPromptModalOpen(false);
            showMessage('Prompt copiado', '¡Prompt copiado al portapapeles!');
        });
    };

    return (
        <div>
            <h1 className="text-3xl font-bold text-gray-800 mb-6">Reportes y Sugerencias de Usabilidad</h1>
            <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                <div className="lg:col-span-2 space-y-8">
                     <form onSubmit={handleSubmit} className="bg-white p-6 rounded-lg shadow-md space-y-4">
                        <h2 className="text-xl font-semibold mb-2">Nuevo Reporte</h2>
                        <div>
                            <label htmlFor="area" className="form-label">Área del CRM</label>
                            <select id="area" value={area} onChange={e => setArea(e.target.value)} className="form-input" required>
                                <option value="">Seleccione un área...</option>
                                {areasCRM.map(a => <option key={a} value={a}>{a}</option>)}
                            </select>
                        </div>
                         <div>
                            <label htmlFor="descripcion" className="form-label">Descripción (Bug o Sugerencia)</label>
                            <textarea id="descripcion" value={descripcion} onChange={e => setDescripcion(e.target.value)} rows={5} className="form-input" required placeholder="Describe el problema o tu idea..."></textarea>
                        </div>
                        <div>
                            <label htmlFor="prioridad" className="form-label">Prioridad</label>
                            <select id="prioridad" value={prioridad} onChange={e => setPrioridad(e.target.value as any)} className="form-input">
                                <option>Media</option><option>Baja</option><option>Alta</option><option>Crítica</option>
                            </select>
                        </div>
                        <div className="text-right">
                            <button type="submit" className="btn btn-primary" disabled={isSubmitting}>{isSubmitting ? 'Enviando...' : 'Guardar Reporte'}</button>
                        </div>
                    </form>

                    <div className="bg-white p-6 rounded-lg shadow-md">
                        <h2 className="text-xl font-semibold mb-4">Listado de Reportes</h2>
                        <div className="overflow-x-auto">
                            <table className="w-full text-sm">
                                <thead className="bg-gray-50 text-left">
                                    <tr>
                                        <th className="p-2">#</th><th className="p-2">Reportado por</th><th className="p-2">Área</th>
                                        <th className="p-2">Prioridad</th><th className="p-2">Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {isLoading && <tr><td colSpan={5} className="text-center p-4">Cargando reportes...</td></tr>}
                                    {reportes.map(r => (
                                        <tr key={r.id} className="border-b">
                                            <td className="p-2 font-semibold">#{r.id}</td>
                                            <td className="p-2">{r.reportado_por}</td>
                                            <td className="p-2">{r.area_crm}</td>
                                            <td className="p-2"><span className="px-2 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">{r.prioridad}</span></td>
                                            <td className="p-2">
                                                <select 
                                                    value={r.estado} 
                                                    onChange={e => handleStatusChange(r.id, e.target.value as Reporte['estado'])}
                                                    disabled={!esAdmin}
                                                    className="form-input p-1 text-xs"
                                                >
                                                    <option>Pendiente</option><option>En Proceso</option><option>Resuelto</option>
                                                </select>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div className="lg:col-span-1">
                     <div onDoubleClick={handleGeneratePrompt} className="bg-yellow-50 border-l-4 border-yellow-400 p-6 rounded-lg shadow-md cursor-pointer" title="Doble clic para generar prompt de desarrollo">
                        <h3 className="font-bold text-yellow-800 mb-2">💡 Guía para Reportar Eficazmente</h3>
                        <ul className="list-disc list-inside text-sm text-yellow-700 space-y-2 mt-3">
                            <li><strong>Sé Específico:</strong> En "Área del CRM", elige la sección más exacta.</li>
                            <li><strong>Describe el "Qué":</strong> ¿Qué intentabas hacer?</li>
                            <li><strong>Describe el "Cómo":</strong> ¿Qué pasos seguiste?</li>
                            <li><strong>El Resultado Inesperado:</strong> ¿Qué pasó que no debería haber pasado?</li>
                            <li><strong>El Resultado Esperado:</strong> ¿Qué debería haber sucedido?</li>
                        </ul>
                    </div>
                </div>
            </div>

            {isPromptModalOpen && (
                <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-center items-center p-4">
                    <div className="bg-white rounded-lg shadow-xl w-full max-w-3xl flex flex-col max-h-[90vh]">
                        <div className="p-4 border-b flex justify-between items-center"><h3 className="text-lg font-semibold">Generar Prompt Consolidado</h3><button onClick={() => setIsPromptModalOpen(false)}>&times;</button></div>
                        <div className="p-6 space-y-4 overflow-y-auto">
                            <div><label htmlFor="console-error-input" className="block text-sm font-medium mb-2">1. Pega aquí los errores de la consola (opcional):</label><textarea id="console-error-input" rows={6} className="w-full form-input" placeholder="Copia y pega el texto de los errores..."></textarea></div>
                            <div><label className="block text-sm font-medium mb-2">2. Prompt generado con reportes pendientes:</label><textarea id="consolidated-prompt-output" rows={15} className="w-full form-input bg-gray-100" readOnly value={generatedPrompt}></textarea></div>
                        </div>
                        <div className="p-4 border-t text-right"><button onClick={handleCopyPrompt} className="btn btn-primary">Copiar Prompt Final</button></div>
                    </div>
                </div>
            )}
            <ActionModal {...modalProps} />
        </div>
    );
};

export default ReportesPage;
