FROM php:8.1.0-fpm

RUN apt update

# Install PHP extensions for Laravel 8
RUN docker-php-ext-install mysqli pdo pdo_mysql bcmath && docker-php-ext-enable pdo_mysql bcmath
RUN pecl install timezonedb && docker-php-ext-enable timezonedb

# No git or zip.

# No composer.
