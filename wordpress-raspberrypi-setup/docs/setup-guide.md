# Full Setup Guide: WordPress on Raspberry Pi

## 1. Install Ubuntu Server

Flash Ubuntu Server using Raspberry Pi Imager.

Update and upgrade:
```bash
sudo apt update && sudo apt upgrade -y

## 2. install LAMB Stack

sudo apt install apache2 mariadb-server php php-mysql libapache2-mod-php php-cli unzip curl -y


## Enable services:

sudo systemctl enable apache2
sudo systemctl enable mariadb

## 3. Create WordPress Database

sudo mysql -u root -p

CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;

# 🌐 4. Configure Apache
## Copy the sample virtual host config:

sudo cp config/apache-vhost.conf /etc/apache2/sites-available/wordpress.conf
sudo a2ensite wordpress
sudo systemctl reload apache2


# 📦 5. Deploy WordPress

## 4. Extract WordPress Archive

sudo tar -xzvf wordpress-clean-setup.tar.gz -C /var/www/html --strip-components=1

## 5. Set Permissions

sudo chown -R www-data:www-data /var/www/html
sudo find /var/www/html -type d -exec chmod 755 {} \;
sudo find /var/www/html -type f -exec chmod 644 {} \;

## 6. Enable SSL (Optional)

sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache

## 7. Backup
### Use config/backup-script.sh to back up files and database.


Then `Ctrl + O`, `Enter`, `Ctrl + X`.

---

### 📁 4. Create the `config` folder

```bash
mkdir -p config


# 📄 5. Create config/wp-config-sample.php

<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'wp_user' );
define( 'DB_PASSWORD', 'your_password' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

$table_prefix = 'wp_';
define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';

