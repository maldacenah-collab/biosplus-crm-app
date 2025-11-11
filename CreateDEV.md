# Ayuda para levantar el proyecto en forma local

## Copiar la base de datos de producción a test.

Para esto se requiere acceso a **supabase producción** y acceso a **supabase dev**.

**Nota:** si docker requiere sudo, todo debe ejecutarse con sudo

primero que nada hay que logearse en supabase desde la linea de comnados, **(loguearse en DEV)**
```
bash$ sudo supabase login
Hello from Supabase! Press Enter to open browser and login automatically.

Here is your login link in case browser did not open https://supabase.com/dashboard/cli/login?session_id=39c815a7-ca32-432c-974c-079df5a2822a&token_name=cli_kike@Q-ThinkPad_1762007632&public_key=0461cf682fb75ee37e9c3af0f441407d2b35d0f65dbda89de97651e74c71c1706d5c548d1d699c1ecef128082d19aa7f3f13c36d650754d450b30a399414ab48ff

Enter your verification code: [THE_CODE_PROVIDED_ON_THE_BROWSER]
Token cli_kike@Q-ThinkPad_1762007632 created successfully.

You are now logged in. Happy coding!
A new version of Supabase CLI is available: v2.54.11 (currently installed v2.52.1)
We recommend updating regularly for new features and bug fixes: https://supabase.com/docs/guides/cli/getting-started#updating-the-supabase-cli
```

Una vez que tenemos el login aceptado, debemos crear el siguiente script para poder ejecutarlo.
Las URL de postgres salen de supabase, del apartado "Connect" -> Method -> Session Pooler y copiar la URL
**Nota:** la password que hay que poner es la de postgress, no la de supabase
```
#!/bin/bash

export PROD_DB_URL='postgresql://postgres.[PROD-ID]:[PASSWORD]@[SERVER]:[PORT]/postgres'
export DEV_DB_URL='postgresql://postgres.[DEV-ID]:[PASSWORD]@[SERVER]:[PORT]/postgres'


echo " 1) Dump"
supabase db dump --db-url "$PROD_DB_URL" -f schema.sql
supabase db dump --db-url "$PROD_DB_URL" --data-only --use-copy -f data.sql

echo " 2) (Opcional) Cambios de auth/storage si los hubiera"
supabase link --project-ref "[PROD-ID]"
supabase db diff --linked --schema auth,storage > changes.sql

echo " 3) Restore"
psql "$DEV_DB_URL" -v ON_ERROR_STOP=1 -1 -f schema.sql -f data.sql
[ -s changes.sql ] && psql "$DEV_DB_URL" -f changes.sql


```

ejecutamos el script:
```
bash$ sudo ./script 
```
**Nota:** puede que pida la clave del CRM de PROD en el paso 2.

## Configurar OAuth
Una vez terminado, todas las tablas estaran en DEV y ademas la info de OAUTH
lo que hay que hacer es agregar en DEV el provider de Google OAUTH
ir a la consola de google https://console.cloud.google.com/apis/credentials?project=crm-test-475317
y configurar en supabase el CLIENT ID y el SECRET (el client id se copia de la consola de google, el secret hay que crear uno nuevo y pegarlo en supabase)
Modificar el callback con lo que dice Supabase

## Modificar datos de contactos para evitar issues
Se deben modificar los datos de los contactos para no tener referencia real al mail
```
UPDATE contactos
SET nombre = concat('Test ', nombre);

UPDATE contactos
SET email = email ||  '.local'
WHERE email NOT  LIKE  '%.local';
```

## Abrir la aplicación
Para evitar errores de CORS es necesario abrir el navegador de la siguiente forma:
``` 
google-chrome --disable-web-security --user-data-dir=~/chrome-dev-data
```

## TODO
Falta copiar las funciones de supabase