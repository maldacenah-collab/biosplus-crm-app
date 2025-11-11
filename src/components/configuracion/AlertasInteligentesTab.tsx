// src/components/configuracion/AlertasInteligentesTab.tsx
import { useEffect, useState } from 'react';
import * as configApi from '../../services/configApi';
import { ReglaAlerta } from '../../types'; // Asumiendo que se creará este tipo

const AlertasInteligentesTab = () => {
    const [rules, setRules] = useState<ReglaAlerta[]>([]);

    async function fetchRules() {
        const data = await configApi.getAlertRules();
        setRules(data);
    }

    useEffect(() => {
        fetchRules();
    }, []);

    const handleUpdate = async (id: number, field: keyof ReglaAlerta, value: any) => {
        const ruleToUpdate = rules.find(r => r.id === id);
        if (ruleToUpdate) {
            await configApi.updateAlertRule(id, { ...ruleToUpdate, [field]: value });
            fetchRules();
        }
    };
    
    const handleDelete = async (id: number) => {
        if(confirm('¿Seguro que desea eliminar esta regla?')) {
            await configApi.deleteAlertRule(id);
            fetchRules();
        }
    }

    return (
        <div className="space-y-4">
            {rules.map(rule => (
                <div key={rule.id} className="bg-white p-4 rounded-lg shadow-md border-l-4" style={{borderColor: rule.activa ? '#0071BC' : '#f87171'}}>
                    <div className="flex justify-between items-start">
                        <input 
                            className="text-lg font-semibold border-b-2 border-transparent focus:border-primary outline-none"
                            value={rule.nombre_regla}
                            onChange={e => handleUpdate(rule.id, 'nombre_regla', e.target.value)}
                        />
                         <div className="flex items-center gap-4">
                            <label className="inline-flex items-center cursor-pointer">
                                <input type="checkbox" checked={rule.activa} onChange={e => handleUpdate(rule.id, 'activa', e.target.checked)} className="sr-only peer" />
                                <div className="relative w-11 h-6 bg-gray-200 rounded-full peer peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:start-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary"></div>
                            </label>
                            <button onClick={() => handleDelete(rule.id)} className="text-gray-400 hover:text-red-500">&times;</button>
                        </div>
                    </div>
                    <textarea 
                        className="text-sm text-gray-600 mt-1 w-full border-b-2 border-transparent focus:border-gray-300 outline-none resize-none"
                        value={rule.descripcion}
                        onChange={e => handleUpdate(rule.id, 'descripcion', e.target.value)}
                        rows={1}
                    />
                     <div className="mt-4 space-y-2 text-sm">
                        <div><label className="font-medium text-gray-500 w-32 inline-block">Mensaje Alerta:</label><input className="form-input inline-block w-2/3" value={rule.mensaje_alerta} onChange={e => handleUpdate(rule.id, 'mensaje_alerta', e.target.value)} /></div>
                        <div><label className="font-medium text-gray-500 w-32 inline-block">Mensaje WhatsApp:</label><input className="form-input inline-block w-2/3" value={rule.mensaje_whatsapp || ''} onChange={e => handleUpdate(rule.id, 'mensaje_whatsapp', e.target.value)} /></div>
                        <div><label className="font-medium text-gray-500 w-32 inline-block align-top">Condición SQL:</label><textarea className="form-input inline-block w-2/3 font-mono text-xs" rows={3} value={rule.condicion_sql} onChange={e => handleUpdate(rule.id, 'condicion_sql', e.target.value)}></textarea></div>
                    </div>
                </div>
            ))}
        </div>
    );
};

export default AlertasInteligentesTab;