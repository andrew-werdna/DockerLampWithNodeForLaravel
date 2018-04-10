FROM php:7.1.2-apache

MAINTAINER andrew.brown5717@gmail.com

ADD ./scripts/ready_php7.sh /tmp
ADD ./scripts/install_composer.sh /tmp
ADD ./scripts/install_nvm.sh /tmp

RUN apt-get update -y
RUN apt-get install -y \
  libmcrypt-dev \
  mysql-client \
  libmagickwand-dev \
  curl \
  man \
  git \
  software-properties-common \
  wget \
  dos2unix \
  zip \
  unzip \
  apt-transport-https \
  lsb-release \
  ca-certificates \
  build-essential \
  && pecl install imagick \
  && docker-php-ext-enable imagick

RUN dos2unix /tmp/ready_php7.sh
RUN bash /tmp/ready_php7.sh
RUN rm /tmp/ready_php7.sh

RUN apt-get install -y php7.1-common php7.1-intl php7.1-cli php7.1-mysql php7.1-zip

RUN docker-php-ext-install pdo pdo_mysql

RUN dos2unix /tmp/install_composer.sh
RUN bash /tmp/install_composer.sh
RUN rm /tmp/install_composer.sh

# RUN dos2unix /tmp/symfony_installer.sh
# RUN bash /tmp/symfony_installer.sh
# RUN rm /tmp/symfony_installer.sh

RUN touch ~/.bashrc && chmod 766 ~/.bashrc

RUN dos2unix /tmp/install_nvm.sh
RUN bash /tmp/install_nvm.sh
RUN rm /tmp/install_nvm.sh
RUN . $HOME/.nvm/nvm.sh && nvm install --lts

ADD ./apache-config.conf /etc/apache2/sites-enabled/000-default.conf
RUN cp /etc/php/7.1/cli/php.ini /usr/local/etc/php

RUN a2enmod rewrite
RUN /etc/init.d/apache2 restart

#ENTRYPOINT ["/etc/init.d/apache2", "start"]
CMD /bin/bash
