FROM debian:12

WORKDIR /app

RUN apt update && apt install nginx -y && apt install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/selfsigned-nginx.key -out /etc/ssl/certs/selfsigned-nginx.crt \
     -subj "/C=JO/ST=Irbid/L=Irbid/O=42/CN=klafi.42.fr" 

COPY conf /etc/nginx/nginx.conf
COPY index.html /var/www/html/index.html

expose 443

CMD ["nginx", "-g", "daemon off;"]
