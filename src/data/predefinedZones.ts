// src/data/predefinedZones.ts

// These are predefined GeoJSON structures for common shipping zones.
// Users can import these as a starting point for their own zones.
// GeoJSON coordinates are in [longitude, latitude] format.

export const predefinedZones = [
  {
    name: 'CABA (Capital Federal)',
    geometry: {
      type: 'Polygon',
      coordinates: [
        [
          [-58.532, -34.536], // North-West corner (approx)
          [-58.337, -34.542], // North-East corner (approx)
          [-58.356, -34.705], // South-East corner (approx)
          [-58.530, -34.694], // South-West corner (approx)
          [-58.532, -34.536], // Close the loop
        ],
      ],
    },
  },
  {
    name: 'GBA Norte',
    geometry: {
      type: 'Polygon',
      coordinates: [
        [
          [-58.64, -34.40],
          [-58.45, -34.35],
          [-58.38, -34.52],
          [-58.55, -34.58],
          [-58.64, -34.40],
        ],
      ],
    },
  },
   {
    name: 'Rosario (Centro)',
    geometry: {
      type: 'Polygon',
      coordinates: [
        [
          [-60.67, -32.93],
          [-60.63, -32.92],
          [-60.62, -32.96],
          [-60.66, -32.97],
          [-60.67, -32.93],
        ],
      ],
    },
  },
];