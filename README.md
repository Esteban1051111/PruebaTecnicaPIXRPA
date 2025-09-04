
# Proyecto PIX RPA - Gestión de Productos y Formularios

## Descripción del proyecto
Este proyecto está desarrollado en **PIX RPA** y tiene como objetivo automatizar la gestión de productos y la interacción con un formulario web.  

Las principales funcionalidades son:  
- Gestión de productos en base de datos **MS SQL Server**.
- Subida de archivos **JSON** y **Excel** a **OneDrive** mediante HTTP.
- Registro de la actividad de subida de archivos en la tabla de logs.
- Uso de **procedimientos almacenados** para insertar productos con validación de duplicidad y registrar archivos subidos.
- Automatización de llenado de formularios web y captura de pantalla.
- Integración con **OpenAI** para generar información básica para el formulario web.

El proyecto contiene tres scripts principales:  
1. **Consulta y subida de productos**: consulta productos, sube JSON a OneDrive e inserta los datos en la base de datos.  
2. **Generación de Excel y subida**: consulta la base de datos, genera el Excel y lo sube a OneDrive.  
3. **Llenado de formulario web**: llena automáticamente el formulario y captura pantallas.  

## Requisitos y dependencias
- **PIX RPA** instalado.
- **MS SQL Server** para la base de datos.
- Acceso a **OneDrive** mediante HTTP.
- Llave de **OpenAI** válida para el script de llenado de formularios.
- Scripts y querys de creación de tablas y procedimientos almacenados incluidos en el repositorio.

## Pasos para ejecución
1. Clonar el repositorio desde Git.
2. Instalar la base de datos en **MS SQL Server**.
3. Ejecutar el query incluido para crear las tablas y los procedimientos almacenados.
4. Modificar el string de conexión en cada script de PIX RPA para apuntar a la base de datos local.
5. Colocar la **nueva llave de OpenAI** en el script de llenado de formularios.
6. Ejecutar los scripts según el flujo requerido:
   - Script de productos → JSON → Base de datos.
   - Script de Excel → Generación de Excel → OneDrive.
   - Script de formulario → Llenado automático y captura de pantalla.

## Enlace del formulario
[Formulario web utilizado](https://forms.gle/iDP1frioaAma4x626)
