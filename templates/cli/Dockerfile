ARG PHP_VERSION
FROM php:${PHP_VERSION}

# Install PHP extensions for Laravel
RUN docker-php-ext-install mysqli pdo pdo_mysql bcmath
RUN pecl install timezonedb && docker-php-ext-enable timezonedb

# Install git and zip for some composer packages.
RUN apt update && \
    apt install -y git zip

# Install composer.
RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
