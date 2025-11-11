// src/components/common/Avatar.tsx

interface AvatarProps {
  src?: string | null;
  name?: string | null;
  size?: 'sm' | 'md' | 'lg';
}

const SIZES = {
    sm: 'w-8 h-8 text-xs',
    md: 'w-10 h-10 text-sm',
    lg: 'w-12 h-12 text-base',
}

const salespersonColors = ["#e53935", "#1e88e5", "#43a047", "#f9a825", "#8e24aa", "#d81b60", "#00acc1", "#6d4c41", "#455a64"];

const Avatar = ({ src, name, size = 'md' }: AvatarProps) => {
    if (src) {
        return <img src={src} alt={name || 'Avatar'} className={`${SIZES[size]} rounded-full object-cover bg-gray-200`} />;
    }

    const initials = name
        ? name.split(' ').map(n => n[0]).join('').toUpperCase().substring(0, 2)
        : '?';
    
    const charCodeSum = name ? name.split('').reduce((sum, char) => sum + char.charCodeAt(0), 0) : 0;
    const color = salespersonColors[charCodeSum % salespersonColors.length];

    return (
        <div 
            className={`${SIZES[size]} rounded-full flex items-center justify-center font-bold text-white`}
            style={{ backgroundColor: color }}
            title={name || 'Usuario'}
        >
            {initials}
        </div>
    );
};

export default Avatar;
