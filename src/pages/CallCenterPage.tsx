// src/pages/CallCenterPage.tsx

import React, { useState, useEffect } from 'react';
// Fix: Use `GoogleGenAI` instead of the deprecated `GoogleGenerativeAI`.
import { GoogleGenAI, Type } from "@google/genai";
import { useSharedStore } from '../stores/useSharedStore';
import * as callCenterApi from '../services/callCenterApi';
import { ContactForPrediction, SuggestedCall } from '../types';
import SuggestedCallCard from '../components/callcenter/SuggestedCallCard';
import { can } from '../utils/permissions';
import InteractionModal from '../components/cliente360/InteractionModal';

const CallCenterPage = () => {
    const { currentUser } = useSharedStore();
    const [contacts, setContacts] = useState<ContactForPrediction[]>([]);
    const [suggestions, setSuggestions] = useState<SuggestedCall[]>([]);
    const [isLoading, setIsLoading] = useState(false);
    const [isGenerating, setIsGenerating] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [isInteractionModalOpen, setInteractionModalOpen] = useState(false);
    const [selectedContactId, setSelectedContactId] = useState<number | null>(null);
    
    useEffect(() => {
        const fetchContacts = async () => {
            if (currentUser?.vendedorId) {
                setIsLoading(true);
                try {
                    const fetchedContacts = await callCenterApi.getContactsForPrediction(currentUser.vendedorId);
                    setContacts(fetchedContacts);
                } catch (err: any) {
                    setError('Error al cargar los contactos. ' + err.message);
                } finally {
                    setIsLoading(false);
                }
            }
        };
        fetchContacts();
    }, [currentUser]);

    const handleGenerateSuggestions = async () => {
        if (contacts.length === 0) {
            setError('No hay contactos para analizar.');
            return;
        }

        setIsGenerating(true);
        setError(null);

        try {
            // Fix: Use `GoogleGenAI` instead of the deprecated `GoogleGenerativeAI`.
            const ai = new GoogleGenAI({ apiKey: process.env.API_KEY });
            
            const prompt = `
                Eres un asistente de ventas experto para un call center de una empresa que vende insumos de estética a profesionales.
                Tu tarea es analizar una lista de contactos y generar una lista de llamadas sugeridas en formato JSON.
                Para cada sugerencia, debes proporcionar: contact_id, nombre, prioridad ('Alta', 'Media', 'Baja'), un motivo conciso, y un guion de llamada breve y amigable.

                Considera los siguientes criterios para priorizar:
                - Deuda actual: Clientes con deudas altas son de alta prioridad.
                - Frecuencia de compra: Clientes que se están desviando de su frecuencia habitual.
                - Última compra: Clientes que no han comprado en mucho tiempo.
                - Clasificación: Clientes 'A' son más importantes.
                - Productos habituales: Puedes sugerir reponer stock o nuevos productos.

                Analiza la siguiente lista de contactos:
                ${JSON.stringify(contacts, null, 2)}
            `;

            const response = await ai.models.generateContent({
                model: 'gemini-2.5-pro',
                contents: prompt,
                config: {
                    responseMimeType: 'application/json',
                    responseSchema: {
                        type: Type.OBJECT,
                        properties: {
                            suggestions: {
                                type: Type.ARRAY,
                                items: {
                                    type: Type.OBJECT,
                                    properties: {
                                        contact_id: { type: Type.NUMBER },
                                        nombre: { type: Type.STRING },
                                        prioridad: { type: Type.STRING },
                                        motivo: { type: Type.STRING },
                                        guion: { type: Type.STRING },
                                    },
                                    required: ['contact_id', 'nombre', 'prioridad', 'motivo', 'guion']
                                }
                            }
                        }
                    }
                }
            });
            
            const jsonText = response.text.trim();
            const jsonResponse = JSON.parse(jsonText);
            setSuggestions(jsonResponse.suggestions || []);

        } catch (err: any) {
            setError('Error al generar sugerencias con IA. ' + err.message);
            console.error(err);
        } finally {
            setIsGenerating(false);
        }
    };
    
    const handleLlamar = (contactId: number) => {
        setSelectedContactId(contactId);
        setInteractionModalOpen(true);
    };

    const handleAction = (contactId: number) => {
        setSuggestions(prev => prev.filter(s => s.contact_id !== contactId));
    };

    if (!can('ia:usar:callcenter')) {
        return (
            <div className="text-center p-8">
                <h1 className="text-2xl font-bold text-red-600">Acceso Denegado</h1>
                <p className="text-gray-600 mt-2">No tienes los permisos necesarios para acceder a esta sección.</p>
            </div>
        );
    }

    return (
        <div>
            <div className="flex justify-between items-center mb-6">
                <h1 className="text-3xl font-bold text-text-main">Call Center Inteligente</h1>
                <button
                    onClick={handleGenerateSuggestions}
                    className="btn btn-primary"
                    disabled={isGenerating || isLoading || contacts.length === 0}
                >
                    {isGenerating ? 'Generando...' : 'Generar Llamadas Sugeridas'}
                </button>
            </div>
            
            {isLoading && <p>Cargando contactos...</p>}
            {error && <p className="text-red-500">{error}</p>}

            <div className="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 gap-6">
                {suggestions.map(suggestion => {
                    const contact = contacts.find(c => c.id === suggestion.contact_id);
                    if (!contact) return null;
                    return (
                        <SuggestedCallCard
                            key={suggestion.contact_id}
                            suggestion={suggestion}
                            contact={contact}
                            onLlamar={handleLlamar}
                            onPosponer={() => handleAction(suggestion.contact_id)}
                            onDescartar={() => handleAction(suggestion.contact_id)}
                        />
                    );
                })}
            </div>

            {isInteractionModalOpen && selectedContactId && (
                <InteractionModal
                    isOpen={isInteractionModalOpen}
                    onClose={() => {
                        const closedContactId = selectedContactId;
                        setInteractionModalOpen(false);
                        setSelectedContactId(null);
                        if(closedContactId) {
                            handleAction(closedContactId);
                        }
                    }}
                    contactId={selectedContactId}
                />
            )}
        </div>
    );
};

export default CallCenterPage;