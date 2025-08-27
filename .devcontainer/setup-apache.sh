#!/bin/bash

# Определяем имя рабочей папки (оно динамическое в Codespaces)
WORKSPACE_FOLDER=$(ls /workspaces | head -n1)
WORKSPACE_PATH="/workspaces/$WORKSPACE_FOLDER"

# Копируем и настраиваем конфиг Apache
sudo cp .devcontainer/000-default.conf /etc/apache2/sites-available/
sudo sed -i "s|@@WORKSPACE_FOLDER@@|$WORKSPACE_FOLDER|g" /etc/apache2/sites-available/000-default.conf

# Включаем модули и перезапускаем Apache
sudo a2enmod rewrite
sudo service apache2 restart