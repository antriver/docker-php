# This is currently broken.

FROM php:7.0.33-cli

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    dpkg

# Download and install git and zip. Not using apt because that is no longer working on this old version.
RUN wget http://archive.debian.org/debian/pool/main/g/git/git_2.11.0-3+deb9u5_amd64.deb \
    && dpkg -i git_2.11.0-3+deb9u5_amd64.deb \
    && rm git_2.11.0-3+deb9u5_amd64.deb \
    && wget http://archive.debian.org/debian/pool/main/z/zip/zip_3.0-11+deb9u1_amd64.deb \
    && dpkg -i zip_3.0-11+deb9u1_amd64.deb \
    && rm zip_3.0-11+deb9u1_amd64.deb

# Install Composer
RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
