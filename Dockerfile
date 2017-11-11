FROM php:7.0-apache

MAINTAINER Sören Rohweder <s.rohweder@blage.net>

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    unzip libmcrypt-dev mysql-client\
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mysqli

ARG KIMAI_VERSION=1.1.0
ARG KIMAI_SHA256=3484b3f30f95b5866cf3dfa1e52bbff5ef85f19da9f9620f6458a26b8cc30e81

COPY ./libpcre3_8.38-3.1_amd64.deb /root/libpcre3_8.38-3.1_amd64.deb
RUN dpkg -i /root/libpcre3_8.38-3.1_amd64.deb
RUN a2enmod rewrite \
    && rm /root/libpcre3_8.38-3.1_amd64.deb

RUN curl -L -o kimai.zip https://github.com/kimai/kimai/releases/download/${KIMAI_VERSION}/kimai_${KIMAI_VERSION}.zip \
  && echo "${KIMAI_SHA256} kimai.zip" | sha256sum -c \
  && mkdir -p /var/www/html \
  && unzip kimai.zip -d /var/www/html/ \
  && chown -R www-data:www-data /var/www/html/ \
  && rm *.zip
COPY kimai_dump.sql /root
COPY setup.php /var/www/html
COPY ./wait-for-it.sh ./docker-php-entrypoint /usr/local/bin/
