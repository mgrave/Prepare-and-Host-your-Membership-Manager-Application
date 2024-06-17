# Instrucciones para Ejecutar la Aplicación con Docker

## Requisitos Previos

- Docker instalado en tu sistema, [Opcional] prueba a construir la imagen del Dockerfile docker build -t mma .

## Paso 1: Ejecutar el Contenedor Docker
    
	```bash
    docker-compose up -d
    ```

## Paso 4: Verificar el Funcionamiento

1. Abre un navegador web y navega a `http://localhost:8000/setup`. Deberías ver la pagina de configuracion de tu aplicación, todo deberia ser NEXT.

Nota : Si hubo un problema al crear el archivo de configuración, DEBES guardar el archivo config.inc.php en tu PC local y luego subirlo al directorio /lib/ de Membership Manager Pro. Haz clic aquí para ver el contenido del archivo config.ini.php.

## Paso 5: Inicia sesion

Logueate con admin:pass1234 y cambia la contraseña

## Paso 6: Elimina el directorio Setup

Ahora DEBES eliminar por completo el directorio 'setup' de tu servidor. Por favor, por razones de seguridad, cambia los permisos de tu directorio /lib/ a 0755.

## Paso 7: Acceso al Contenedor (Opcional)

Si necesitas acceder al contenedor para realizar tareas de administración o depuración, puedes usar el siguiente comando:

```bash
docker exec -it nombre_de_tu_contenedor /bin/bash


DATABASE
localhost: mmadb
username:usermma
password:passmma
database:dbmma


NOTA FINAL






