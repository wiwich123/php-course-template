#!/bin/bash

# Установка vim
apt-get update && apt-get install -y vim

# Создание структуры папок
mkdir -p /workspaces/php-course-template/sites/skuit/www

# Настройка прав доступа
chown -R www-data:www-data /workspaces/php-course-template/sites/skuit
chmod -R 777 /workspaces/php-course-template/sites/skuit

# Копирование конфигурации Apache
cp /workspaces/php-course-template/.devcontainer/skuit.conf /etc/apache2/sites-available/

# Настройка Apache
a2dissite 000-default
a2ensite skuit
a2enmod rewrite

# Перезапуск Apache
service apache2 restart