// src/components/common/OfflineIndicator.tsx
import { useSharedStore } from '../../stores/useSharedStore';

const OfflineIndicator = () => {
  const isOffline = useSharedStore(state => state.isOffline);

  if (!isOffline) {
    return null;
  }

  return (
    <div className="bg-yellow-500 text-white text-center py-2 text-sm font-semibold">
      Estás sin conexión. Mostrando datos de la última sincronización.
    </div>
  );
};

export default OfflineIndicator;
