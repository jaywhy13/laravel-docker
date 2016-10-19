FROM php:7.0-cli

RUN apt-get update && apt-get install -y unzip zip zlib1g-dev
RUN pecl install zip && docker-php-ext-enable zip
# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --filename=composer
# Install Laravel
RUN php composer global require "laravel/installer"
# RUN php composer install
# Mv composer and add it to path
RUN mv composer ~/.composer/vendor/bin/
ENV PATH $PATH:~/.composer/vendor/bin/
# Copy our code
COPY . /code
WORKDIR /code

