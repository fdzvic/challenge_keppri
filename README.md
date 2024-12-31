# challenge_keppri

## Descripción

Este proyecto es una aplicación desarrollada en Flutter utilizando la versión **3.24.3** de Flutter y **3.5.3** de Dart. La arquitectura del proyecto sigue los patrones **MVVM (Model-View-ViewModel)** y **Clean Architecture**, con **Riverpod** como gestor de estados.

## Requisitos

Asegúrate de tener instaladas las siguientes herramientas antes de comenzar:

- Flutter SDK 3.24.3
- Dart SDK 3.5.3 (incluido en Flutter SDK)
- IDE recomendado: [Visual Studio Code](https://code.visualstudio.com/) o [Android Studio](https://developer.android.com/studio)
- [Git](https://git-scm.com/) para clonar el repositorio

## Instalación y configuración

Sigue estos pasos para descargar y correr el proyecto:

1. **Clona el repositorio:**

   ```bash
   git clone https://github.com/fdzvic/challenge_keppri

2. **Accede al directorio del proyecto:**

    ```bash
    cd <NOMBRE_DEL_PROYECTO>

3. **Instala las dependencias:**

    Ejecuta los siguientes comandos para descargar todas las dependencias necesarias:

    ```bash
    flutter clean
    flutter pub get

4. **Ejecuta el proyecto:**

    Conecta un dispositivo físico o inicia un emulador/simulador compatible y corre el siguiente comando:

    ```bash
    flutter run

### Nota

En caso de tener problemas con la ejecución asegúrate de que tu entorno esté configurado correctamente ejecutando:
    ```bash
    flutter doctor

## Estructura del proyecto

El proyecto utiliza una arquitectura basada en **MVVM** y **Clean Architecture**, organizada en las siguientes capas:

- **Domain:** Contiene las entidades, casos de uso y abstracciones.
- **Data:** Incluye los repositorios concretos y las fuentes de datos.
- **Presentation:** Incluye las vistas, view models y controladores de estado.

El estado de la aplicación se gestiona utilizando **Riverpod**, lo que permite un enfoque reactivo, modular y eficiente. La implementación sigue el patrón de diseño **MVVM**, donde cada funcionalidad está organizada en las siguientes estructuras:

- Un archivo `page`, encargado de definir la interfaz de usuario para la pantalla correspondiente.  
- Un `controller`, responsable de manejar las acciones del usuario, procesar la lógica de la aplicación y actualizar las variables del estado de forma reactiva.  
- Un `state`, almacena las variables que se van a utilizar para actualizar la interfaz de usuario.  

Esta organización garantiza un código limpio, fácil de mantener y altamente escalable.

## Contacto

Si tienes alguna pregunta o sugerencia, no dudes en contactarme a través de mi correo electrónico: [ing.vhfernandez@gmail.com](mailto:ing.vhfernandez@gmail.com) o mediante WhatsApp al número: [316 644 9153](https://wa.me/573166449153).
