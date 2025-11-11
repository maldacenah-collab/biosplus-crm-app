// src/components/contacts/SalespersonAvatar.tsx
// Componente para renderizar el avatar de un vendedor.

import { Salesperson } from '../../types';

interface SalespersonAvatarProps {
  salesperson?: Salesperson;
}

const salespersonColors = ["#e53935", "#1e88e5", "#43a047", "#f9a825", "#8e24aa", "#d81b60", "#00acc1", "#6d4c41", "#455a64"];

const SalespersonAvatar = ({ salesperson }: SalespersonAvatarProps) => {
  if (!salesperson || !salesperson.perfiles?.nombre) {
    return (
      <div 
        className="w-8 h-8 rounded-full bg-gray-400 flex items-center justify-center text-white text-xs font-bold" 
        title="Sin Asignar"
      >
        ?
      </div>
    );
  }

  const name = salesperson.perfiles.nombre;
  const initials = name.split(' ').map(n => n[0]).join('').toUpperCase();
  const color = salespersonColors[(salesperson.id || 0) % salespersonColors.length];

  return (
    <div 
      className="w-8 h-8 rounded-full flex items-center justify-center text-white text-xs font-bold" 
      style={{ backgroundColor: color }} 
      title={name}
    >
      {initials}
    </div>
  );
};

export default SalespersonAvatar;
