// src/components/callcenter/SuggestedCallCard.tsx
import React, { useState } from 'react';
import { SuggestedCall } from '../../types';
import Avatar from '../common/Avatar';

interface SuggestedCallCardProps {
  suggestion: SuggestedCall;
  contact: { id: number; nombre: string; telefono?: string | null };
  onLlamar: (contactId: number) => void;
  onPosponer: (contactId: number) => void;
  onDescartar: (contactId: number) => void;
}

const PriorityBadge = ({ prioridad }: { prioridad: SuggestedCall['prioridad'] }) => {
  const styles = {
    Alta: 'bg-red-100 text-red-800',
    Media: 'bg-yellow-100 text-yellow-800',
    Baja: 'bg-blue-100 text-blue-800',
  };
  const icon = {
    Alta: '🔥',
    Media: '⭐',
    Baja: '❄️',
  };
  return (
    <span className={`px-2 py-1 text-xs font-semibold rounded-full ${styles[prioridad]}`}>
      {icon[prioridad]} {prioridad}
    </span>
  );
};

const SuggestedCallCard: React.FC<SuggestedCallCardProps> = ({ suggestion, contact, onLlamar, onPosponer, onDescartar }) => {
  const [isScriptVisible, setIsScriptVisible] = useState(false);

  return (
    <div className="bg-white p-4 rounded-xl shadow-md border border-gray-200 flex flex-col gap-3">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-3">
          <Avatar name={suggestion.nombre} />
          <div>
            <h3 className="font-bold text-text-main">{suggestion.nombre}</h3>
            <p className="text-sm text-text-secondary">{suggestion.motivo}</p>
          </div>
        </div>
        <PriorityBadge prioridad={suggestion.prioridad} />
      </div>

      {isScriptVisible && (
        <div className="bg-slate-50 p-3 rounded-lg border border-slate-200">
          <h4 className="font-semibold text-sm text-primary mb-1">Guion Sugerido</h4>
          <p className="text-sm text-slate-700 whitespace-pre-wrap">{suggestion.guion}</p>
        </div>
      )}

      <div className="flex items-center justify-end gap-2 border-t pt-3 mt-2">
        <button onClick={() => setIsScriptVisible(!isScriptVisible)} className="btn btn-secondary text-xs">
          {isScriptVisible ? 'Ocultar Guion' : 'Ver Guion'}
        </button>
        <button onClick={() => onDescartar(suggestion.contact_id)} className="btn btn-secondary text-xs">Descartar</button>
        <button onClick={() => onPosponer(suggestion.contact_id)} className="btn btn-secondary text-xs">Posponer</button>
        <button onClick={() => onLlamar(contact.id)} className="btn btn-primary text-xs">
          Llamar y Registrar
        </button>
      </div>
    </div>
  );
};

export default SuggestedCallCard;