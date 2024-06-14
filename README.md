# Instrucciones para Ejecutar la Aplicación con Docker

## Requisitos Previos

- Docker instalado en tu sistema

## Paso 1: Crear el Dockerfile

1. Crea un archivo llamado `Dockerfile` en el directorio raíz de tu proyecto.
2. Copia y pega el siguiente contenido en el archivo `Dockerfile`:

    ```Dockerfile
    # Usar la imagen base de PHP 7.4 con Apache
    FROM maulana08/php7.4

    # Instalar dependencias necesarias
    RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libonig-dev \
        libxml2-dev \
        libicu-dev \
        libmcrypt-dev \
        && docker-php-ext-install -j$(nproc) iconv mbstring mysqli pdo pdo_mysql intl gd \
        && docker-php-ext-configure gd --with-freetype --with-jpeg

    # Habilitar mod_rewrite
    RUN a2enmod rewrite

    # Crear el usuario web
    RUN useradd -ms /bin/bash webuser

    # Copiar el código de la aplicación al contenedor
    COPY . /var/www/html/

    # Cambiar el propietario de los archivos al usuario web
    RUN chown -R webuser:webuser /var/www/html/

    # Exponer el puerto 80
    EXPOSE 80

    # Establecer el comando de inicio del contenedor
    CMD ["apache2-foreground"]
    ```

## Paso 2: Construir la Imagen Docker

1. Abre una terminal y navega hasta el directorio donde se encuentra tu `Dockerfile`.
2. Ejecuta el siguiente comando para construir la imagen Docker:

    ```bash
    docker build -t mma .
    ```   

## Paso 3: Ejecutar el Contenedor Docker

1. Una vez que la imagen se haya construido correctamente, ejecuta el siguiente comando para iniciar un contenedor basado en esa imagen:

    ```bash
    docker run -d -p 80:80 --name mma_cont mma
    ```

## Paso 4: Verificar el Funcionamiento

1. Abre un navegador web y navega a `http://localhost`. Deberías ver tu aplicación en funcionamiento.

## Paso 5: Acceso al Contenedor (Opcional)

Si necesitas acceder al contenedor para realizar tareas de administración o depuración, puedes usar el siguiente comando:

```bash
docker exec -it nombre_de_tu_contenedor /bin/bash


DATABASE
localhost: mmadb
username:usermma
password:passmma
database:dbmma


NOTA FINAL
Si hubo un problema al crear el archivo de configuración, DEBES guardar el archivo config.inc.php en tu PC local y luego subirlo al directorio /lib/ de Membership Manager Pro. Haz clic aquí para ver el contenido del archivo config.ini.php.


Ahora DEBES eliminar por completo el directorio 'setup' de tu servidor. Por favor, por razones de seguridad, cambia los permisos de tu directorio /lib/ a 0755.

Finalmente logueate con admin:pass1234
