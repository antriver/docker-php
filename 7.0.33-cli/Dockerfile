FROM php:7.0.33-cli

# Install git, zip, and system dependencies for PHP extensions
# Use the Debian archive for stretch since 7.0 is no longer supported.
RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y --no-install-recommends --allow-unauthenticated \
    wget \
    dpkg \
    git \
    zip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libicu-dev \
    libzip-dev \
    zlib1g-dev

# Configure GD extension with JPEG and FreeType support
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

# Install PHP extensions
RUN docker-php-ext-install \
    mysqli \
    pdo_mysql \
    bcmath \
    gd \
    soap \
    intl \
    zip

# Install APCu extension via PECL
RUN pecl install apcu-5.1.23 && docker-php-ext-enable apcu

# Install Composer
RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
