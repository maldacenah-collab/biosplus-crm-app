# Manual de Colaboración con GitHub (Hernán, Kike y Gemini)

Kike, este documento define nuestro nuevo flujo de trabajo para colaborar en el CRM. El objetivo es trabajar de forma segura, ordenada y profesional, evitando sobreescribir el trabajo de otros.

---

### **La Regla de Oro: La Rama `main` es Sagrada**

La rama `main` representa la versión **estable y oficial** de nuestro proyecto. Es el código que está en producción o listo para pasar a producción.

**PROHIBIDO:** Nadie, bajo ninguna circunstancia, debe subir cambios (`push`) directamente a la rama `main`.

---

### **Nuestro Flujo de Trabajo (Ciclo de Desarrollo)**

Este es el proceso que seguiremos para CADA nueva tarea, mejora o corrección.

#### **Paso 1: Crear una Rama de Trabajo (Feature Branch)**

Antes de empezar a escribir código, crea una nueva rama a partir de la versión más reciente de `main`.

Usa una nomenclatura clara para la rama:
*   Para nuevas funcionalidades: `feature/nombre-de-la-funcionalidad` (ej: `feature/reporte-ventas-pdf`)
*   Para correcciones: `fix/descripcion-del-arreglo` (ej: `fix/error-login-google`)

```bash
# 1. Asegúrate de estar en main y tener la última versión
git checkout main
git pull origin main

# 2. Crea tu nueva rama y muévete a ella
git checkout -b feature/nombre-de-la-funcionalidad
```

#### **Paso 2: Desarrollar en tu Rama**

Trabaja con normalidad en tu rama. Haz todos los `commits` que necesites. Tu trabajo está aislado y no afecta a nadie más.

```bash
# ...haces tus cambios...
git add .
git commit -m "Agregado el botón de exportación a PDF"

# ...haces más cambios...
git commit -m "Ajustada la consulta SQL para el reporte"
```

#### **Paso 3: Subir tu Rama y Abrir un Pull Request (PR)**

Cuando hayas terminado tu tarea y la hayas probado, sube tu rama a GitHub.

```bash
git push origin feature/nombre-de-la-funcionalidad
```

Luego, ve a la página del repositorio en GitHub. Verás un botón para **"Compare & pull request"**. Haz clic ahí.

*   **Título del PR:** Escribe un título claro y conciso (ej: "Implementación del Reporte de Ventas en PDF").
*   **Descripción:** Explica brevemente qué hiciste y por qué. Si resuelve un problema, menciónalo.

#### **Paso 4: Revisión y Aprobación (Rol de Hernán)**

Hernán recibirá una notificación. Él revisará los cambios, podrá dejar comentarios o solicitar ajustes directamente en el Pull Request.

**Tú (Kike) no debes fusionar (merge) tu propio PR.** Debes esperar la aprobación de Hernán.

#### **Paso 5: Fusión (Merge)**

Una vez que Hernán apruebe el PR, él (o tú, si él te lo indica) hará clic en el botón **"Merge pull request"**.

¡Listo! Tus cambios ahora forman parte de la rama `main` de forma segura.

#### **Paso 6: Limpieza**

Después de fusionar, puedes borrar tu rama de trabajo para mantener el repositorio limpio. GitHub te dará un botón para hacerlo.

```bash
# Opcional: Borra la rama de tu máquina local
git checkout main
git branch -d feature/nombre-de-la-funcionalidad
```

---

### **Diagrama Visual del Flujo**

```
1. Rama 'main' (Estable)
   |
   +--> 2. Kike crea una rama 'feature/algo-nuevo'
   |     |
   |     +--> 3. Trabaja y hace commits en su rama
   |     |
   |     +--> 4. Abre un Pull Request (PR) hacia 'main'
   |
   +--> 5. Hernán revisa el PR, comenta y lo APRUEBA
   |
   +--> 6. El PR se fusiona (merge) en 'main'
   |
   +--> (El ciclo se repite para la siguiente tarea)
```

Este es el estándar de la industria y nos permitirá escalar el proyecto sin dolores de cabeza.
