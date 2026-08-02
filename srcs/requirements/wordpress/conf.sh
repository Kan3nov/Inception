#!/bin/bash

echo "db_host=${db_host}"
echo "db_name=${db_name}"
echo "db_user=${db_user}"
echo "db_pass=${db_pass}"
echo "db_pass=${url}"

if [ ! -f wp-config.php ]; then
      wp core download --allow-root
	wp config create --dbname=${db_name} \
      --dbuser=${db_user} \
      --dbpass=${db_pass} \
      --dbhost=${db_host} \
      --allow-root
      wp core install \
            --url="$url" \
            --title="$wp_title" \
            --admin_user="$admin_user" \
            --admin_password="$admin_pass" \
            --admin_email="$admin_email" \
            --skip-email \
            --allow-root

      wp user create \
            "$wp_user" \
            "$wp_email" \
            --user_pass="$wp_pass" \
            --role=author \
            --allow-root
fi


exec php-fpm8.2 -F