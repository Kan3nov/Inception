FROM debian:12

WORKDIR /app

RUN apt update && apt install mariadb-server mariadb-client galera-4 -y

COPY tools/entry.sh .

RUN chmod +x entry.sh

RUN sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["./entry.sh"]