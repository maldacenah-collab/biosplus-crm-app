# ====================================================================================
# SCRIPT DE CLONACION DE PRODUCCION A DESARROLLO (POWERSHELL) - V7 (FIX USERNAME DEFINITIVO)
# Origen (PROD): jsbgutbsckwintsnhnno
# Destino (DEV): vddsahzzajehegyvrqxy
# ====================================================================================

# --- FIX PARA PSQL: Anade PostgreSQL al PATH de este script ---
$env:PATH += ";C\Program Files\PostgreSQL\18\bin"

# --- CONFIGURACION ---
$SourceProjectRef = "jsbgutbsckwintsnhnno"
$DestinationProjectRef = "vddsahzzajehegyvrqxy"

# URLs de conexion a las bases de datos
# *** CORRECCION V7: El usuario DEBE ser 'postgres.[ID]' para el pooler ***
$SourceDbUrl = "postgres://postgres.jsbgutbsckwintsnhnno:CrmPrueba2025@aws-0-sa-east-1.pooler.supabase.com:5432/postgres"

# *** CORRECCION V7: El usuario DEBE ser 'postgres.[ID]' y la contrasena se maneja por separado ***
$DestinationDbUrlWithoutPass = "postgres://postgres.vddsahzzajehegyvrqxy@aws-0-sa-east-1.pooler.supabase.com:5432/postgres"
$DestinationPassword = "Nanimal27?" # La contrasena se maneja de forma segura con PGPASSWORD

# Nombres de archivo para esta ejecucion
$SchemaFile = "prod_dump_v7_schema.sql"
$DataFile = "prod_dump_v7_data.sql"
$ChangesFile = "prod_dump_v7_changes.sql"

# --- VERIFICACION DE SEGURIDAD ---
Write-Host "====================== ATENCION ======================" -ForegroundColor Red
Write-Host "Este script clonara la base de datos de PRODUCCION sobre DESARROLLO."
Write-Host ""
Write-Host "ORIGEN (PROD): $SourceProjectRef" -ForegroundColor Green
Write-Host "DESTINO (DEV): $DestinationProjectRef" -ForegroundColor Yellow
Write-Host "La base de datos de destino ($DestinationProjectRef) SERA COMPLETAMENTE BORRADA Y REEMPLAZADA." -ForegroundColor Red
Write-Host ""
Read-Host "Presiona Enter para continuar, o CTRL+C para cancelar..."

# --- INICIO DEL PROCESO ---
Write-Host "Iniciando clonacion de PROD a DEV..."

# Paso 1: Dump de PRODUCCION
Write-Host "Paso 1: Creando copia de la base de datos de produccion..."
supabase db dump --db-url $SourceDbUrl -f $SchemaFile
supabase db dump --db-url $SourceDbUrl --data-only --use-copy -f $DataFile
Write-Host "Paso 1: Copia creada." -ForegroundColor Cyan

# Paso 2: Diferencias de Auth/Storage
Write-Host "Paso 2: Obteniendo diferencias de Auth y Storage..."
supabase link --project-ref $SourceProjectRef
supabase db diff --linked --schema auth,storage > $ChangesFile
Write-Host "Paso 2: Diferencias obtenidas." -ForegroundColor Cyan

# Paso 3: Restaurar en DESARROLLO
Write-Host "Paso 3: Restaurando la copia en el entorno de desarrollo..."
$env:PGPASSWORD = $DestinationPassword
try {
    psql "$DestinationDbUrlWithoutPass" -q -v ON_ERROR_STOP=1 -1 -f $SchemaFile -f $DataFile
    if ($?) { Write-Host "  -> Esquema y datos restaurados con exito." -ForegroundColor Green } 
    else { throw "Error al restaurar $SchemaFile o $DataFile" }

    if ((Test-Path $ChangesFile) -and (Get-Item $ChangesFile).Length -gt 0) {
        Write-Host "Aplicando cambios de Auth y Storage..."
        psql "$DestinationDbUrlWithoutPass" -q -f $ChangesFile
        if (!$?) { throw "Error al aplicar $ChangesFile" }
    }
} catch {
    Write-Host "ERROR: Fallo la restauracion de la base de datos." -ForegroundColor Red
    Write-Host "Verifica la contrasena de la base de datos de DESTINO. Si persiste, contacta a soporte." -ForegroundColor Yellow
    exit 1
} finally {
    if (Test-Path Env:PGPASSWORD) { Remove-Item Env:PGPASSWORD }
}
Write-Host "Paso 3: Restauracion completada." -ForegroundColor Cyan

# Pasos 4 y 5
Write-Host "Paso 4: Enlazando la CLI al proyecto de desarrollo..."
supabase link --project-ref $DestinationProjectRef
Write-Host "Paso 5: Desplegando Edge Functions..."
supabase functions deploy

Write-Host "======================================================" -ForegroundColor Green
Write-Host "CLONACION DE PRODUCCION A DESARROLLO COMPLETADA!" -ForegroundColor Green
Write-Host "======================================================" -ForegroundColor Green