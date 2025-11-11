// src/pages/PlaceholderPage.tsx
// Componente genérico para las páginas que aún están en desarrollo.

interface PlaceholderPageProps {
  title: string;
}

const PlaceholderPage = ({ title }: PlaceholderPageProps) => {
  return (
    <div>
      <h1 className="text-3xl font-bold text-text-main mb-6">{title}</h1>
      <div className="p-8 bg-white rounded-2xl shadow-lg">
        <p className="text-center text-text-secondary">
          El módulo de <span className="font-semibold text-text-main">{title}</span> está siendo migrado a la nueva plataforma.
          <br/>
          Pronto estará disponible aquí.
        </p>
      </div>
    </div>
  );
};

export default PlaceholderPage;
