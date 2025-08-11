ARG PHP_VERSION
FROM php:${PHP_VERSION}

# Install git and zip for some composer packages.
RUN apt update && \
    apt install -y git zip

# Install composer.
RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer