FROM debian:buster

# mise a jour et instllation despackage
RUN apt-get update -y \
	&& apt-get install -y nginx \
        && apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline \
	&& apt-get install -y openssl \
	&& apt-get install -y wget \

# copie de la configuration utile du server
COPY ./srcs/defaults /etc/nginx/sites-available/

#rajout du .sh de lancement dans bin et on donne les droits
ADD srcs/start.sh /usr/bin/start.sh
RUN chmod 755 /usr/bin/start.sh

EXPOSE 80
EXPOSE 443

#lancement du sh
ENTRYPOINT  ["start.sh"]

