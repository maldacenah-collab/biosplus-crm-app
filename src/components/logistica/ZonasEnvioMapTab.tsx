// src/components/logistica/ZonasEnvioMapTab.tsx
import React, { useEffect, useState, useRef, useCallback } from 'react';
import { useZonasEnvioStore } from '../../stores/useZonasEnvioStore';
import { ZonaEnvio } from '../../types';
import { predefinedZones } from '../../data/predefinedZones';

// NEW: Error component for missing API Key
const ApiKeyErrorDisplay = () => (
    <div className="absolute inset-0 bg-red-50 flex flex-col items-center justify-center p-8 text-center">
        <h3 className="text-2xl font-bold text-red-700">Error de Configuración</h3>
        <p className="mt-4 text-red-600">
            No se ha encontrado una clave de API válida para Google Maps. Sin esta clave, no es posible cargar el mapa de zonas.
        </p>
        <div className="mt-6 text-left bg-red-100 p-4 rounded-lg border border-red-200 text-sm w-full max-w-lg">
            <p className="font-semibold">Para solucionarlo:</p>
            <ol className="list-decimal list-inside mt-2 space-y-1">
                <li>Busca o crea un archivo llamado <code className="font-mono bg-red-200 px-1 rounded">.env</code> en la carpeta principal del proyecto.</li>
                <li>Asegúrate de que contenga la siguiente línea:</li>
                <li className="pl-4"><code className="font-mono bg-red-200 px-2 py-1 rounded">VITE_GOOGLE_MAPS_API_KEY="TU_CLAVE_AQUI"</code></li>
                <li>Reemplaza <code className="font-mono bg-red-200 px-1 rounded">"TU_CLAVE_AQUI"</code> con tu clave de API de Google Maps.</li>
                <li>Guarda el archivo y **reinicia el servidor de desarrollo** para que los cambios tomen efecto.</li>
            </ol>
        </div>
    </div>
);


// Helper to load Google Maps script
const loadGoogleMapsScript = (apiKey: string, callback: () => void, onError: () => void) => {
  if (window.google && window.google.maps) {
    callback();
    return;
  }
  const existingScript = document.querySelector('script[src*="maps.googleapis.com"]');
  if (existingScript) {
    existingScript.addEventListener('load', callback);
    return;
  }
  const script = document.createElement('script');
  script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}&libraries=drawing,geometry`;
  script.async = true;
  script.defer = true;
  script.onload = callback;
  script.onerror = onError;
  document.head.appendChild(script);
};

const ZonasEnvioMapTab = () => {
    const { zonas, isLoading, fetchZonas, saveZona, deleteZona } = useZonasEnvioStore();
    const mapRef = useRef<HTMLDivElement>(null);
    const [map, setMap] = useState<google.maps.Map | null>(null);
    const [drawingManager, setDrawingManager] = useState<google.maps.drawing.DrawingManager | null>(null);
    const [selectedZone, setSelectedZone] = useState<Partial<ZonaEnvio> | null>(null);
    const polygonsRef = useRef<Map<number, google.maps.Polygon>>(new Map());
    const [apiKeyError, setApiKeyError] = useState(false);

    const initMap = useCallback(() => {
        if (mapRef.current && !map) {
            const newMap = new window.google.maps.Map(mapRef.current, {
                center: { lat: -34.6037, lng: -58.3816 }, // Buenos Aires
                zoom: 10,
            });
            setMap(newMap);

            const newDrawingManager = new window.google.maps.drawing.DrawingManager({
                drawingMode: null,
                drawingControl: true,
                drawingControlOptions: {
                    position: window.google.maps.ControlPosition.TOP_CENTER,
                    drawingModes: [google.maps.drawing.OverlayType.POLYGON],
                },
                polygonOptions: {
                    fillColor: '#0071BC',
                    fillOpacity: 0.3,
                    strokeWeight: 2,
                    strokeColor: '#0071BC',
                    clickable: false,
                    editable: true,
                    zIndex: 1,
                },
            });
            newDrawingManager.setMap(newMap);
            setDrawingManager(newDrawingManager);
        }
    }, [map]);

    useEffect(() => {
        let apiKey = import.meta.env.VITE_GOOGLE_MAPS_API_KEY;
        if (!apiKey || apiKey.length < 30) {
            console.error("Google Maps API Key is missing, invalid, or is a placeholder.");
            setApiKeyError(true);
            return;
        }
        if (apiKey.includes('TU_CLAVE_DE_API_DE_GOOGLE_MAPS')) {
            apiKey = "";
        }
        
        loadGoogleMapsScript(apiKey, initMap, () => setApiKeyError(true));
        fetchZonas();
    }, [initMap, fetchZonas]);

    const polygonToGeoJSON = (polygon: google.maps.Polygon): any => {
        const path = polygon.getPath();
        const coordinates: number[][] = [];
        path.forEach((latLng) => {
            coordinates.push([latLng.lng(), latLng.lat()]);
        });
        // Close the loop for GeoJSON format
        const firstPoint = path.getAt(0);
        coordinates.push([firstPoint.lng(), firstPoint.lat()]);
        
        return {
            type: 'Polygon',
            coordinates: [coordinates],
        };
    };
    
    const geoJSONToPolygonPaths = (geometry: any | undefined): google.maps.LatLng[] => {
      if (!geometry || geometry.type !== 'Polygon' || !geometry.coordinates) return [];
      try {
        const coords = geometry.coordinates[0];
        return coords.map((pair: number[]) => new google.maps.LatLng(pair[1], pair[0]));
      } catch (e) {
        console.error("Error parsing GeoJSON:", e);
        return [];
      }
    };

    useEffect(() => {
        if (map && drawingManager) {
            const listener = google.maps.event.addListener(
                drawingManager,
                'overlaycomplete',
                (event: google.maps.drawing.OverlayCompleteEvent) => {
                    if (event.type === google.maps.drawing.OverlayType.POLYGON) {
                        const newPolygon = event.overlay as google.maps.Polygon;
                        drawingManager.setDrawingMode(null);
                        
                        const newZone = {
                            nombre: 'Nueva Zona',
                            costo: 0,
                            monto_minimo_bonificacion: 0,
                            geometria: polygonToGeoJSON(newPolygon)
                        };

                        saveZona(newZone).then(() => {
                           event.overlay?.setMap(null);
                        });
                    }
                }
            );
            return () => listener.remove();
        }
    }, [map, drawingManager, saveZona]);

    useEffect(() => {
      if (!map) return;
  
      polygonsRef.current.forEach(poly => {
        google.maps.event.clearInstanceListeners(poly);
        poly.setMap(null);
      });
      polygonsRef.current.clear();
  
      zonas.forEach(zona => {
          if (!zona.geometria) return;
          
          const polygonPaths = geoJSONToPolygonPaths(zona.geometria);
          const isSelected = selectedZone?.id === zona.id;

          const polygon = new google.maps.Polygon({
              paths: polygonPaths,
              strokeColor: isSelected ? '#ef4444' : '#0071BC',
              strokeOpacity: 0.8,
              strokeWeight: isSelected ? 3 : 2,
              fillColor: isSelected ? '#ef4444' : '#0071BC',
              fillOpacity: isSelected ? 0.4 : 0.2,
              editable: isSelected,
              map: map,
          });

          polygon.addListener('click', () => {
              setSelectedZone(zona);
          });
          
          if(isSelected){
            const path = polygon.getPath();
            google.maps.event.addListener(path, 'set_at', () => handlePolygonEdit(zona.id, polygon));
            google.maps.event.addListener(path, 'insert_at', () => handlePolygonEdit(zona.id, polygon));
          }

          polygonsRef.current.set(zona.id, polygon);
      });

    }, [map, zonas, selectedZone]);

    const handlePolygonEdit = (zoneId: number, polygon: google.maps.Polygon) => {
        const editedZone = zonas.find(z => z.id === zoneId);
        if(editedZone) {
            const updatedZone = { ...editedZone, geometria: polygonToGeoJSON(polygon) };
            setSelectedZone(updatedZone);
        }
    };
    
    const handleSaveChanges = async () => {
        if (!selectedZone) return;
        await saveZona(selectedZone);
        setSelectedZone(null);
    };

    const handleDelete = async () => {
      if (selectedZone && selectedZone.id && window.confirm(`¿Seguro que desea eliminar "${selectedZone.nombre}"?`)) {
        await deleteZona(selectedZone.id);
        setSelectedZone(null);
      }
    };

    const importPredefined = async (zoneData: any) => {
        await saveZona({
            nombre: zoneData.name,
            costo: 0,
            geometria: zoneData.geometry
        });
    }

    return (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 h-[80vh]">
            <div className="lg:col-span-2 h-full rounded-lg overflow-hidden relative shadow-md">
                {apiKeyError ? (
                    <ApiKeyErrorDisplay />
                ) : (
                    <>
                        <div ref={mapRef} className="w-full h-full" />
                        {isLoading && <div className="absolute inset-0 bg-white/50 flex items-center justify-center">Cargando Zonas...</div>}
                         <div className="absolute top-16 left-2 bg-white p-2 rounded shadow">
                            <h3 className="text-xs font-bold mb-1">Zonas Predefinidas</h3>
                            <div className="flex flex-col gap-1">
                                {predefinedZones.map(z => <button key={z.name} onClick={() => importPredefined(z)} className="btn btn-secondary text-xs">{z.name}</button>)}
                            </div>
                         </div>
                    </>
                )}
            </div>
            <div className="bg-white p-6 rounded-lg shadow-md overflow-y-auto">
                <h2 className="text-xl font-semibold mb-4">Detalles de Zona</h2>
                {!selectedZone ? (
                    <div className="text-center text-gray-500 py-10">
                        <p>Selecciona una zona en el mapa para ver sus detalles o dibuja una nueva.</p>
                    </div>
                ) : (
                    <div className="space-y-4">
                        <div><label className="form-label">Nombre</label><input type="text" value={selectedZone.nombre || ''} onChange={e => setSelectedZone(z => ({ ...z, nombre: e.target.value }))} className="form-input" /></div>
                        <div><label className="form-label">Costo de Envío</label><input type="number" value={selectedZone.costo || 0} onChange={e => setSelectedZone(z => ({ ...z, costo: parseFloat(e.target.value) || 0 }))} className="form-input" /></div>
                        <div><label className="form-label">Monto para Bonificación</label><input type="number" value={selectedZone.monto_minimo_bonificacion || ''} onChange={e => setSelectedZone(z => ({ ...z, monto_minimo_bonificacion: parseFloat(e.target.value) || undefined }))} className="form-input" /></div>
                        <div className="flex justify-between items-center pt-4 border-t">
                            <button onClick={handleDelete} className="btn text-red-600 hover:bg-red-50">Eliminar</button>
                            <div className="flex gap-2">
                                <button onClick={() => setSelectedZone(null)} className="btn btn-secondary">Cancelar</button>
                                <button onClick={handleSaveChanges} className="btn btn-primary">Guardar Cambios</button>
                            </div>
                        </div>
                    </div>
                )}
            </div>
        </div>
    );
};

export default ZonasEnvioMapTab;