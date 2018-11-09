#!/bin/bash

workingDIR="/var/www/html";

cd $workingDIR;

echo -e "\n\nInstalling Laravel\n\n"

# initial install of Laravel
composer.phar create-project --prefer-dist laravel/laravel .
wait

# install some requested packages (extra goodies)
echo -e "\n\nInstalling Laravel extra suggested packages\n\n"

composer.phar require --prefer-stable \
    guzzlehttp/guzzle \
    symfony/config \
    symfony/yaml \
    symfony/dependency-injection \
    symfony/browser-kit \
    symfony/lock \
    php-console/php-console \
    doctrine/dbal
wait

echo -e "\n\nAdding .htaccess so we don't have to go to <local-app>/public\n\n"

cp /tmp/.htaccess $workingDIR

echo -e "\n\nInstallation completed\n\n"
