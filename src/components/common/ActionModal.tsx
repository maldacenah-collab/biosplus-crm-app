// src/components/common/ActionModal.tsx
import React from 'react';

export type ButtonVariant = 'primary' | 'secondary' | 'danger';

export interface ActionModalButton {
  label: string;
  onClick: () => void;
  variant?: ButtonVariant;
  disabled?: boolean;
}

export interface ActionModalProps {
  isOpen: boolean;
  title: string;
  message: React.ReactNode;
  buttons: ActionModalButton[];
}

const variantClasses: Record<ButtonVariant, string> = {
  primary: 'btn btn-primary',
  secondary: 'btn btn-secondary',
  danger: 'btn btn-danger',
};

const ActionModal: React.FC<ActionModalProps> = ({ isOpen, title, message, buttons }) => {
  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4">
      <div className="bg-white rounded-lg shadow-xl max-w-md w-full p-6 space-y-4">
        <h4 className="text-lg font-semibold text-gray-800">{title}</h4>
        <div className="text-sm text-gray-600">
          {typeof message === 'string' ? <p>{message}</p> : message}
        </div>
        <div className="flex justify-end gap-2">
          {buttons.map(({ label, onClick, variant = 'primary', disabled }, index) => (
            <button
              key={`${label}-${index}`}
              onClick={onClick}
              className={`${variantClasses[variant]} ${disabled ? 'opacity-50 cursor-not-allowed' : ''}`}
              disabled={disabled}
            >
              {label}
            </button>
          ))}
        </div>
      </div>
    </div>
  );
};

export default ActionModal;
