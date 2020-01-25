FROM debian:buster

#mise a jour plus installation des package
RUN apt-get update -y \
	&& apt-get install -y nginx \
        && apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline \
	&& apt-get install -y openssl \
	&& apt-get install -y wget \ 	
	&& apt-get install -y php-mysql \
	&& apt-get install -y default-mysql-server

#telechargement phpmyadmin sur le net on le decompresse avec tar xzvf puis on le mv dans le dossier phpmyadmin 
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz && \
	tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz && \
	mv phpMyAdmin-4.9.0.1-all-languages/ /var/www/html/phpmyadmin

#telechargement wordpress sur le net on le decompresse avec tar xzvf puis on copie l'archive dans le dossier wordpress
RUN wget https://wordpress.org/latest.tar.gz && \
	tar xzvf latest.tar.gz && \
	cp -a wordpress/. /var/www/html/wordpress

#on donne les droit de proprietaire a l'utilisateur du serveur nginx 
RUN chown www-data:www-data /usr/share/nginx/html/ -R

# copie de la configuration utile du server
COPY ./srcs/default /etc/nginx/sites-available/
COPY ./srcs/wp-config.php /var/www/html/wordpress/

#rajout du .sh de lancement dans bin et on donne les droits
ADD srcs/start.sh /usr/bin/start.sh
RUN chmod 755 /usr/bin/start.sh

EXPOSE 80
EXPOSE 443

#lancement du sh
ENTRYPOINT  ["start.sh"]

