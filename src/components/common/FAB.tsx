// src/components/common/FAB.tsx
import React, { useState, useEffect, useRef, MouseEvent as ReactMouseEvent } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import { useSharedStore } from '../../stores/useSharedStore';
import { can } from '../../utils/permissions';
import { PlusIcon, UserPlusIcon, LightBulbIcon, ArchiveBoxIcon } from '@heroicons/react/24/solid';

const FAB = () => {
    const [isOpen, setIsOpen] = useState(false);
    const location = useLocation();
    const navigate = useNavigate();

    // --- Start of Draggable Logic ---
    const [position, setPosition] = useState(() => {
        try {
            const savedPosition = localStorage.getItem('fabPosition');
            if (savedPosition) {
                const pos = JSON.parse(savedPosition);
                // Clamp position to be within the viewport on initial load
                pos.x = Math.max(16, Math.min(pos.x, window.innerWidth - 80));
                pos.y = Math.max(16, Math.min(pos.y, window.innerHeight - 80));
                return pos;
            }
        } catch (e) { console.error("Failed to parse FAB position from localStorage", e); }
        // Default to bottom right
        return { x: window.innerWidth - 100, y: window.innerHeight - 100 };
    });

    const fabRef = useRef<HTMLDivElement>(null);
    const dragInfo = useRef({
        isDragging: false,
        hasMoved: false,
        startX: 0,
        startY: 0,
        offsetX: 0,
        offsetY: 0
    });

    useEffect(() => {
        localStorage.setItem('fabPosition', JSON.stringify(position));
    }, [position]);

    const handleMouseDown = (e: ReactMouseEvent<HTMLButtonElement>) => {
        e.preventDefault();
        const info = dragInfo.current;
        info.isDragging = true;
        info.hasMoved = false;
        info.startX = e.clientX;
        info.startY = e.clientY;
        if (fabRef.current) {
            const rect = fabRef.current.getBoundingClientRect();
            info.offsetX = e.clientX - rect.left;
            info.offsetY = e.clientY - rect.top;
        }
        document.addEventListener('mousemove', handleMouseMove);
        document.addEventListener('mouseup', handleMouseUp, { once: true });
    };

    const handleMouseMove = (e: MouseEvent) => {
        const info = dragInfo.current;
        if (!info.isDragging || !fabRef.current) return;

        if (!info.hasMoved) {
            const dx = Math.abs(e.clientX - info.startX);
            const dy = Math.abs(e.clientY - info.startY);
            if (dx > 5 || dy > 5) {
                info.hasMoved = true;
                if (isOpen) setIsOpen(false);
            }
        }

        if (info.hasMoved) {
            let newX = e.clientX - info.offsetX;
            let newY = e.clientY - info.offsetY;

            const { offsetWidth, offsetHeight } = fabRef.current;
            newX = Math.max(16, Math.min(newX, window.innerWidth - offsetWidth - 16));
            newY = Math.max(16, Math.min(newY, window.innerHeight - offsetHeight - 16));

            setPosition({ x: newX, y: newY });
        }
    };
    
    const handleMouseUp = () => {
        const info = dragInfo.current;
        info.isDragging = false;
        document.removeEventListener('mousemove', handleMouseMove);
        
        if (!info.hasMoved) {
            setIsOpen(prev => !prev);
        }
    };
    // --- End of Draggable Logic ---

    const canCreateContact = can('contactos:crear');
    const canCreateOpportunity = can('oportunidades:crear');
    const canCreatePedido = can('pedidos:crear');
    
    const allowedPaths = ['dashboard', 'contactos', 'oportunidades', 'pedidos'];
    const currentRoot = location.pathname.split('/')[1] || '';
    const isVisible = allowedPaths.includes(currentRoot) && (canCreateContact || canCreateOpportunity || canCreatePedido);


    if (!isVisible) return null;

    const handleAction = (action: 'contact' | 'opportunity' | 'pedido') => {
        if (action === 'contact') navigate('/contactos/new');
        else if (action === 'opportunity') navigate('/oportunidades/new');
        else if (action === 'pedido') navigate('/pedidos/new');
        setIsOpen(false);
    };

    return (
        <div
            ref={fabRef}
            className="fixed z-40"
            style={{ left: `${position.x}px`, top: `${position.y}px`, cursor: dragInfo.current.isDragging ? 'grabbing' : 'grab' }}
        >
            <div className="relative flex flex-col items-center group">
                {isOpen && (
                    <div 
                        className="absolute bottom-full mb-3 w-48 bg-white rounded-lg shadow-xl py-2 transition-all duration-200 ease-out"
                        style={{ transform: 'scale(1)', opacity: 1 }}
                    >
                        {canCreateContact && (
                            <button onClick={() => handleAction('contact')} className="w-full text-left flex items-center px-4 py-2 text-xs text-gray-700 hover:bg-gray-100">
                                <UserPlusIcon className="w-5 h-5 mr-3 text-primary" />
                                Crear Contacto
                            </button>
                        )}
                        {canCreateOpportunity && (
                            <button onClick={() => handleAction('opportunity')} className="w-full text-left flex items-center px-4 py-2 text-xs text-gray-700 hover:bg-gray-100">
                                <LightBulbIcon className="w-5 h-5 mr-3 text-primary" />
                                Crear Presupuesto
                            </button>
                        )}
                        {canCreatePedido && (
                            <button onClick={() => handleAction('pedido')} className="w-full text-left flex items-center px-4 py-2 text-xs text-gray-700 hover:bg-gray-100">
                                <ArchiveBoxIcon className="w-5 h-5 mr-3 text-primary" />
                                Crear Pedido
                            </button>
                        )}
                    </div>
                )}
                <button
                    onMouseDown={handleMouseDown}
                    className="w-14 h-14 bg-primary rounded-full text-white flex items-center justify-center shadow-xl hover:bg-primary-dark focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary transition-all duration-300"
                    style={{ transform: isOpen ? 'rotate(135deg)' : 'rotate(0)' }}
                    title="Acciones rápidas (Arrastra para mover)"
                >
                    <PlusIcon className="w-6 h-6 pointer-events-none" />
                </button>
            </div>
        </div>
    );
};

export default FAB;