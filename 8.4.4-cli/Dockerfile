FROM php:8.4.4-cli

RUN apt update

RUN apt install -y git zip

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
