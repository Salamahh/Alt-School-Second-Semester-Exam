#!/usr/bin/env bash


export COMPOSER_ALLOW_SUPERUSER=1
COMPOSER_ALLOW_SUPERUSER=1
sudo apt -y update
sudo apt -y install apache2
sudo apt -y install mysql-server
sudo add-apt-repository -y ppa:ondrej/php
sudo apt install -y php8.3 libapache2-mod-php php-mysql php-xml php-curl php-zip unzip
git clone https://github.com/laravel/laravel.git
sudo rm /var/www/html/index.html
sudo cp -r laravel /var/www/html
cd /var/www/html/laravel
sudo wget https://getcomposer.org/download/2.7.2/composer.phar
sudo chmod u+x composer.phar
sudo mv composer.phar /usr/local/bin/composer
sudo chown vagrant /usr/local/bin/composer
sudo composer update
sudo composer install
sudo chmod -R 755 /var/www/html/*
sudo chown -R vagrant:vagrant /var/www/html/*
echo "APP_KEY=" > .env
php artisan key:generate
sudo mysql -e "CREATE DATABASE IF NOT EXISTS sally;"
sudo mysql -e "CREATE USER IF NOT EXISTS 'salamat'@'%' IDENTIFIED BY 'Sally2020';"
sudo mysql -e "GRANT ALL ON sally.* TO 'salamat'@'%';"
echo "DB_CONNECTION=mysql" >> .env
echo "DB_DATABASE=sally" >> .env
echo "DB_USERNAME=salamat" >> .env
echo "DB_PASSWORD=Sally2020" >> .env
echo "APP_ENV=local" >> .env
php artisan migrate:refresh
sudo sed -i 's+DirectoryIndex index.html+DirectoryIndex /laravel/public/index.php index.html+g' /etc/apache2/mods-enabled/dir.conf
sudo systemctl restart apache2
sudo php /var/www/html/laravel/public/index.php

