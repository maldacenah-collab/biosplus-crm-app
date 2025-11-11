// Archivo a Modificar: aprobar-descuento-loader.js

const SUPABASE_URL = 'https://jsbgutbsckwintsnhnno.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930';

(async function() {
    const root = document.getElementById('root');
    const urlParams = new URLSearchParams(window.location.search);
    const token = urlParams.get('token');
    
    if (!token) {
        root.innerHTML = '<div class="main-card"><h1>Error</h1><p>Token no proporcionado o inválido.</p></div>';
        return;
    }

    try {
        // Se llama a la Edge Function, que es un intermediario seguro.
        const response = await fetch(`${SUPABASE_URL}/functions/v1/aprobar-descuento`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${SUPABASE_KEY}`
            },
            body: JSON.stringify({ token: token })
        });

        if (!response.ok) {
            const errorData = await response.json();
            throw new Error(errorData.error || 'No se pudo cargar la información de la solicitud.');
        }
        
        const data = await response.json();
        
        // Inyectamos las variables necesarias para el siguiente paso
        data.supabaseUrl = SUPABASE_URL;
        data.supabaseKey = SUPABASE_KEY;
        data.token = token;

        // Renderiza la tarjeta principal con los datos obtenidos
        root.innerHTML = `
            <div id="main-card" class="main-card">
                <div class="text-center">
                    <h1>Solicitud de Aprobación</h1>
                    <p>Presupuesto N° ${data.numero_propuesta}</p>
                </div>
                <div class="details-container">
                    <div><span>Vendedor:</span> <span>${data.vendedor_nombre}</span></div>
                    <div><span>Cliente:</span> <span>${data.cliente_nombre}</span></div>
                    <div class="product-box">
                        <p><strong>${data.producto_nombre}</strong></p>
                        <div><span>Precio Original:</span> <span class="price-original">$${data.precio_original.toLocaleString('es-AR')}</span></div>
                        <div><span>Precio Solicitado:</span> <span class="price-solicitado">$${data.precio_solicitado.toLocaleString('es-AR')}</span></div>
                    </div>
                    <div>
                        <p><strong>Justificación del Vendedor:</strong></p>
                        <p class="justification-box">"${data.justificacion}"</p>
                    </div>
                </div>
                <div class="commission-box">
                    <h2>Negociación de Comisión (Opcional)</h2>
                    <div class="commission-grid">
                        <div>
                            <label for="comision-input">Comisión Vendedor (%):</label>
                            <input type="number" id="comision-input" class="input-field" value="${data.comision_original}" step="0.1">
                        </div>
                        <div id="impacto-container"></div>
                    </div>
                </div>
                <div class="actions-container">
                    <button id="btn-reject" class="btn btn-reject">Rechazar</button>
                    <button id="btn-approve" class="btn btn-approve">Aprobar</button>
                </div>
            </div>
            <div id="result-card" class="result-card" style="display: none;">
                <h1 id="result-title"></h1>
                <p id="result-message"></p>
            </div>
        `;

        // --- Lógica de la página ---
        const comisionInput = document.getElementById('comision-input');
        const impactoContainer = document.getElementById('impacto-container');

        function formatCurrency(value) {
            return new Intl.NumberFormat('es-AR', { style: 'currency', currency: 'ARS' }).format(value);
        }

        function calcularImpacto() {
            const comisionActual = parseFloat(comisionInput.value) || 0;
            const descuentoTotal = (data.precio_original - data.precio_solicitado) * data.cantidad;
            const comisionOriginalAbs = data.precio_original * (data.comision_original / 100) * data.cantidad;
            const comisionNuevaAbs = data.precio_solicitado * (comisionActual / 100) * data.cantidad;
            const esfuerzoVendedor = comisionOriginalAbs - comisionNuevaAbs;
            const esfuerzoEmpresa = descuentoTotal - esfuerzoVendedor;

            impactoContainer.innerHTML = `
                <p>Esfuerzo Vendedor: <strong class="text-red">-${formatCurrency(esfuerzoVendedor)}</strong></p>
                <p>Esfuerzo Empresa: <strong class="text-red">-${formatCurrency(esfuerzoEmpresa)}</strong></p>
            `;
        }

        async function enviarDecision(aprobado) {
            const comisionFinal = parseFloat(comisionInput.value);
            document.getElementById('btn-approve').disabled = true;
            document.getElementById('btn-reject').disabled = true;

            try {
                const response = await fetch(`${data.supabaseUrl}/functions/v1/resolver-solicitud`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': 'Bearer ' + data.supabaseKey
                    },
                    body: JSON.stringify({
                        p_token: data.token,
                        p_aprobado: aprobado,
                        p_comision_modificada: comisionFinal !== data.comision_original ? comisionFinal : null
                    })
                });

                if (!response.ok) {
                    const error = await response.json();
                    throw new Error(error.message || 'Error en el servidor');
                }
                
                document.getElementById('main-card').style.display = 'none';
                document.getElementById('result-card').style.display = 'block';
                document.getElementById('result-title').textContent = aprobado ? '¡Aprobado!' : 'Rechazado';
                document.getElementById('result-message').textContent = 'La solicitud ha sido procesada exitosamente. Ya puedes cerrar esta ventana.';

            } catch (error) {
                alert('Error al procesar la solicitud: ' + error.message);
                document.getElementById('btn-approve').disabled = false;
                document.getElementById('btn-reject').disabled = false;
            }
        }

        comisionInput.addEventListener('input', calcularImpacto);
        document.getElementById('btn-approve').addEventListener('click', () => enviarDecision(true));
        document.getElementById('btn-reject').addEventListener('click', () => enviarDecision(false));

        calcularImpacto();

    } catch (error) {
        root.innerHTML = `<div class="main-card"><h1>Error</h1><p>${error.message}</p></div>`;
    }
})();