FROM php:8.1.0-cli

RUN apt update

# Install PHP extensions for Laravel 8
RUN docker-php-ext-install mysqli pdo pdo_mysql bcmath && docker-php-ext-enable pdo_mysql bcmath
RUN pecl install timezonedb && docker-php-ext-enable timezonedb

# Install git and zip for installing Composer packages.
RUN apt install -y git zip

# Install composer.
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
