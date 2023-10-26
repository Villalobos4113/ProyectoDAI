# ProyectoDAI
ProyectoDAI es un proyecto de aplicación web desarrollado en ASP.NET (.NET Framework). Es parte de nuestro trabajo de curso para Desarrollo de Aplicaciones Informáticas.

## Colaboradores
- Regina Rodriguez
- Valeria Maqueda
- Fernando Villalobos

## Links de interés
- [Pitch](https://youtu.be/L9r0cd3uIPs?si=HvP56NkWBndEOW75)
- [GitHub](https://github.com/Villalobos4113/ProyectoDAI)
- [Deployment](https://daiwell.fvb.one)

## Flujo de trabajo en Git

Para garantizar una colaboración fluida y prevenir cualquier conflicto, por favor sigue el flujo de trabajo en Git detallado a continuación:

### Antes de empezar a trabajar

1. **Obtener el código más reciente**: Asegúrate de tener la base de código más reciente antes de empezar a trabajar. Para hacer esto dentro de Visual Studio, primero verifica que te encuentres en la rama `main` desde la barra de herramientas inferior; si no es así, cambia a la rama `main`. Después, ve a la opción 'Git' en la barra superior de herramientas y selecciona 'Pull' para actualizar la rama `main`.

2. **Crear una nueva rama**: Crea una nueva rama con un nombre descriptivo relacionado con la funcionalidad en la que planeas trabajar. Puedes hacer esto en la barra de herramientas inferior seleccionando la rama actual, luego 'New Branch', introduce el nombre de tu rama, asegúrate de que el 'Checkout branch' esté seleccionado y finalmente haz clic en 'Create Branch'.

### Trabajando en una nueva funcionalidad

3. **Implementar tus cambios**: Desarrolla tu funcionalidad en la nueva rama que creaste. Para rastrear tus cambios, ve a la opción 'Git' en la barra superior de herramientas, selecciona 'Commit or Stash', escribe un mensaje que describa tus cambios y finalmente selecciona 'Commit All'.

### Creando un pull request

4. **Subir tus cambios**: Una vez que hayas completado el desarrollo de tu funcionalidad, sincroniza la nueva rama con el repositorio remoto. Para hacer esto, ve a la opción 'Git' en la barra superior de herramientas y selecciona 'Push'.

5. **Crear un pull request**: Inicia sesión en GitHub y crea un nuevo pull request para la nueva rama. En la descripción del pull request, asegúrate de detallar los cambios que has realizado y cualquier información necesaria sobre la funcionalidad que has desarrollado.

**Nota**: Nunca hagas merge de tu propio pull request, el propietario del código (code owner) se encargará de eso.

Al seguir este flujo de trabajo, deberíamos poder evitar conflictos y trabajar juntos de manera más efectiva. ¡Feliz codificación!

## Conectar a la Base de Datos

1. **Copia los archivos de configuración de ejemplo:**: En el directorio del proyecto, encontrarás los archivos `Web.config.example`, `Web.Debug.config.example`, y `Web.Release.config.example`. Crea copias de estos archivos eliminando el sufijo '.example', de modo que se llamen: `Web.config`, `Web.Debug.config`, y `Web.Release.config`.

2. **Modifica el archivo Web.config**: Abre el archivo `Web.config` en un editor de texto o en tu entorno de desarrollo. Dentro del tag `<connectionStrings></connectionStrings>`, encontrarás un elemento `<add>` con el nombre "DefaultConnection." Reemplaza los marcadores de posición en el atributo `connectionString` con los datos correctos proporcionados para la conexión a la base de datos. Asegúrate de mantener el formato correcto.
