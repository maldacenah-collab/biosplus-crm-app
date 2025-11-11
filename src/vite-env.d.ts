// Manually define the types for Vite environment variables
// to resolve issues with `import.meta.env` and missing vite/client types.
interface ImportMetaEnv {
  readonly VITE_SUPABASE_URL: string;
  readonly VITE_SUPABASE_ANON_KEY: string;
  readonly VITE_GOOGLE_MAPS_API_KEY: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}

// This declaration file provides basic types for the Google Maps JavaScript API.
// It is not exhaustive but covers the features used in this application,
// such as Places Autocomplete and the Drawing Manager.

interface Window {
  google: typeof google;
}

declare namespace google.maps {
  class LatLng {
    constructor(lat: number, lng: number);
    lat(): number;
    lng(): number;
  }

  class Map {
    constructor(mapDiv: Element, opts?: MapOptions);
    getCenter(): LatLng;
    setCenter(latlng: LatLng | { lat: number, lng: number }): void;
    setZoom(zoom: number): void;
    fitBounds(bounds: LatLngBounds | { south: number, west: number, north: number, east: number }): void;
  }

  interface MapOptions {
    center?: LatLng | { lat: number, lng: number };
    zoom?: number;
    mapTypeId?: string;
    [key: string]: any;
  }

  class LatLngBounds {
    constructor(sw?: LatLng, ne?: LatLng);
    getNorthEast(): LatLng;
    getSouthWest(): LatLng;
    extend(point: LatLng): void;
  }
  
  interface MapsEventListener {
    remove(): void;
  }

  interface PolygonOptions {
    paths?: MVCArray<MVCArray<LatLng>> | MVCArray<LatLng> | LatLng[][] | LatLng[];
    [key: string]: any;
  }
  
  class Polygon {
    constructor(opts?: PolygonOptions);
    getPath(): MVCArray<LatLng>;
    setMap(map: Map | null): void;
    setOptions(options: PolygonOptions): void;
    addListener(eventName: string, handler: (...args: any[]) => void): MapsEventListener;
  }
  
  class MVCArray<T> {
    constructor(array?: T[]);
    getArray(): T[];
    getAt(i: number): T;
    getLength(): number;
    forEach(callback: (elem: T, i: number) => void): void;
  }

  // Fix: Add missing type definitions for google.maps.Geocoder.
  class Geocoder {
    constructor();
    geocode(
      request: GeocoderRequest,
      callback: (results: GeocoderResult[] | null, status: GeocoderStatus) => void
    ): void;
  }

  interface GeocoderRequest {
    address?: string;
    location?: LatLng | { lat: number; lng: number };
  }

  interface GeocoderResult {
    address_components: GeocoderAddressComponent[];
    formatted_address: string;
    geometry: GeocoderGeometry;
  }

  interface GeocoderGeometry {
    location: LatLng;
    location_type: string;
    viewport: LatLngBounds;
  }

  interface GeocoderAddressComponent {
    long_name: string;
    short_name: string;
    types: string[];
  }

  enum GeocoderStatus {
    OK = "OK",
    ZERO_RESULTS = "ZERO_RESULTS",
    OVER_QUERY_LIMIT = "OVER_QUERY_LIMIT",
    REQUEST_DENIED = "REQUEST_DENIED",
    INVALID_REQUEST = "INVALID_REQUEST",
    UNKNOWN_ERROR = "UNKNOWN_ERROR",
  }

  namespace places {
    class Autocomplete {
      constructor(inputField: HTMLInputElement, opts?: AutocompleteOptions);
      addListener(eventName: string, handler: () => void): MapsEventListener;
      getPlace(): PlaceResult;
    }

    interface AutocompleteOptions {
        componentRestrictions?: { country: string | string[] };
        fields?: string[];
        types?: string[];
    }

    interface PlaceResult {
      address_components?: GeocoderAddressComponent[];
      formatted_address?: string;
      geometry?: PlaceGeometry;
      name?: string;
      [key: string]: any;
    }

    interface PlaceGeometry {
        location: LatLng;
        viewport: LatLngBounds;
    }

    interface GeocoderAddressComponent {
        long_name: string;
        short_name: string;
        types: string[];
    }
  }

  namespace drawing {
    class DrawingManager {
      constructor(options?: DrawingManagerOptions);
      setMap(map: Map | null): void;
      setDrawingMode(drawingMode: OverlayType | null): void;
    }

    interface DrawingManagerOptions {
        drawingMode?: OverlayType | null;
        drawingControl?: boolean;
        drawingControlOptions?: DrawingControlOptions;
        polygonOptions?: PolygonOptions;
    }

    interface DrawingControlOptions {
        position?: ControlPosition;
        drawingModes?: OverlayType[];
    }

    enum OverlayType {
      POLYGON = 'polygon',
    }
    
    interface OverlayCompleteEvent {
        type: OverlayType;
        overlay: Polygon;
    }
  }

  enum ControlPosition {
    TOP_CENTER = 1,
  }

  namespace event {
    function addListener(instance: object, eventName: string, handler: Function): MapsEventListener;
    function clearInstanceListeners(instance: object): void;
  }
}
