FROM php:7.4-apache

COPY ./apache/* /etc/apache2/sites-available/
#Run Apache
RUN a2enmod rewrite


#Load php extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN apt-get update \
    && apt-get install -y libzip-dev \
    && apt-get install -y zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip

RUN a2dissite 000-default
RUN a2ensite web1.com
RUN a2ensite web2.com
CMD ["apachectl", "-D", "FOREGROUND"]
