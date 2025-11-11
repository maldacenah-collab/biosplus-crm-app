/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'primary': '#0071BC', // BIOSplus Blue Pantone 3005 U
        'primary-dark': '#005a96',
        'primary-light': '#e6f1f8',
        'accent': '#606060', // BIOSplus Gray Pantone 447 U
        'accent-dark': '#4a4a4a',
        'background-light': '#FFFFFF', // Fondo blanco puro
        'background-card': '#FFFFFF',
        'text-main': '#1f2937', // Un gris oscuro para mejor contraste
        'text-secondary': '#606060', // BIOSplus Gray Pantone 447 U
        'success': '#0071BC', // Cambiado a azul primario para consistencia
        'info': '#f59e0b',
        'warning': '#ef4444',
        'danger': '#dc2626',
      },
      borderRadius: {
        'xl': '1rem',
        '2xl': '1.5rem',
      },
      boxShadow: {
        'lg': '0 8px 16px -4px rgba(0, 113, 188, 0.08), 0 4px 6px -4px rgba(0, 113, 188, 0.05)',
        'xl': '0 12px 25px -5px rgba(0, 113, 188, 0.08), 0 8px 10px -6px rgba(0, 113, 188, 0.05)',
        'neumorphic': '6px 6px 12px #e6e6e6, -6px -6px 12px #ffffff',
        'neumorphic-inset': 'inset 6px 6px 12px #e6e6e6, inset -6px -6px 12px #ffffff',
      },
      fontFamily: {
        sans: ['Poppins', 'Inter', 'sans-serif'], // Usando Poppins como principal para un look moderno
      },
    },
  },
  plugins: [],
}