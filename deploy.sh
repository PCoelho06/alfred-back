#!/bin/bash

# Variables
SERVER="your-server-ip"
USER="your-username"
DEPLOY_DIR="/var/www/symfony_project"

# Commandes de déploiement
ssh $USER@$SERVER <<EOF
  cd $DEPLOY_DIR
  git pull origin main
  composer install --no-dev --optimize-autoloader
  php bin/console cache:clear --env=prod
  php bin/console doctrine:migrations:migrate --no-interaction
EOF
