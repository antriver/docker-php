FROM php:7.0.33-cli

# Install git and zip for some composer packages.
# Use the Debian archive for stretch since 7.0 is no longer supported.
RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y --no-install-recommends --allow-unauthenticated \
    wget \
    dpkg \
    git \
    zip

# Install Composer
RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
