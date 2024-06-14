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

# Dar permisos 777 a las carpetas especificadas
RUN chmod -R 777 /var/www/html/uploads/ \
    && chmod -R 777 /var/www/html/view/admin/cache/ \
    && chmod -R 777 /var/www/html/view/front/cache/

# Exponer el puerto 80
EXPOSE 80

# Establecer el comando de inicio del contenedor
CMD ["apache2-foreground"]
