#!/bin/bash
# WordPress backup script

timestamp=$(date +"%Y-%m-%d")
backup_dir="/root/backups"
mkdir -p "$backup_dir"

# Backup files
tar -czf "$backup_dir/wordpress-files-$timestamp.tar.gz" /var/www/html

# Backup database
mysqldump -u wp_user -p'YOUR_DB_PASSWORD' wordpress > "$backup_dir/wordpress-db-$timestamp.sql"

echo "Backup complete: $backup_dir"


# Replace 'YOUR_DB_PASSWORD' with your actual database password.


