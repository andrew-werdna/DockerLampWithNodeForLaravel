FROM php:apache

MAINTAINER andrew.brown5717@gmail.com

# ADD ./scripts/ready_php7.sh /tmp
# Add ./scripts/symfony_install.sh /tmp
ADD ./scripts/install_composer.sh /tmp
ADD ./scripts/install_nvm.sh /tmp
ADD ./scripts/install_node_lts.sh /tmp
ADD ./scripts/laravel_install.sh /tmp
ADD ./.htaccess /tmp

# install dependencies for PHP extensions and nice-to-have's
RUN apt-get update -y
RUN apt-get install -y \
  libmcrypt-dev \
  mysql-client \
  curl \
  man \
  git \
  vim \
  software-properties-common \
  wget \
  dos2unix \
  zip \
  unzip \
  apt-transport-https \
  lsb-release \
  ca-certificates \
  build-essential \
  libfreetype6-dev \
  libicu-dev \
  libxslt1-dev \
  lynx \
  psmisc \
  && apt-get clean

# Just in case we are doing this from a Window's Host
RUN dos2unix /tmp/install_composer.sh
RUN dos2unix /tmp/install_nvm.sh
RUN dos2unix /tmp/install_node_lts.sh
RUN dos2unix /tmp/laravel_install.sh

# add PHP 7 sources so if needed we can apt-get install {{PHP 7 Package}}
# RUN dos2unix /tmp/ready_php7.sh
# RUN bash /tmp/ready_php7.sh
# RUN rm /tmp/ready_php7.sh

RUN docker-php-ext-install \
    intl \
    mbstring \
    pdo \
    pdo_mysql \
    xsl \
    zip \
    xml \
    tokenizer \
    json \
    soap \
    ctype

RUN bash /tmp/install_composer.sh

# RUN dos2unix /tmp/symfony_installer.sh
# RUN bash /tmp/symfony_installer.sh
# RUN rm /tmp/symfony_installer.sh

RUN touch ~/.bashrc && chmod 766 ~/.bashrc

RUN bash /tmp/install_nvm.sh

# install lts node using NVM
RUN bash /tmp/install_node_lts.sh

ADD ./apache-config.conf /etc/apache2/sites-enabled/000-default.conf
ADD ./php.ini /usr/local/etc/php

RUN a2enmod rewrite
RUN /etc/init.d/apache2 restart

WORKDIR /var/www/html

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
