#!/bin/bash
set -e

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql

    mariadbd --user=mysql &
    pid="$!"

    until mariadb-admin ping >/dev/null 2>&1; do
        sleep 1
    done

    mariadb <<EOF

CREATE DATABASE IF NOT EXISTS \`${db_name}\`;

CREATE USER IF NOT EXISTS '${usr1}'@'%' IDENTIFIED BY '${usr1_pass}';
GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO '${usr1}'@'%';

CREATE USER IF NOT EXISTS '${usr2}'@'%' IDENTIFIED BY '${usr2_pass}';
GRANT SELECT ON \`${db_name}\`.* TO '${usr2}'@'%';

FLUSH PRIVILEGES;
EOF

    mariadb-admin shutdown
fi

exec mariadbd --user=mysql