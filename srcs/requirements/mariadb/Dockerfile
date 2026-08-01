FROM debian:12

WORKDIR /app

RUN apt update && apt install mariadb-server mariadb-client galera-4

RUN echo '\n y root root y y y y' | mysql_secure_installation


RUN mariadb && create user wp@"%" identified by "wp_pass"; grant all on *.* to "wp"@"%"; create user kanana@"%" identified by "kanana_pass"; grant select on *.* to "kanana"@"%";


COPY tools/healtcheck.sh .

CMD ["mariadb"]
