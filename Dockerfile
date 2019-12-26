FROM debian:buster

/*image utiliser pour le container debian buster voir le sujet */


/*installation des paquets */
RUN apt-get update \
	&& ap-get install -y \
	wget

/*recherche et installation de wget */

RUN apt-get update \
	&& ap-get install -y \
	nginx

COPY 
/*recherche et installation de nginx */

RUN apt-get update \
	&& apt-get install -y \
	mariadb-server

/*recherche et installation de mysql*/

RUN apt-get -y install php-fpm php-common php-mysql php-cli \
				php-mbstring php-gd php-xml php-intl php-zip php-curl

RUN service php7.3-fpm start

/*installation service php*/

EXPOSE 80

/*exposition du port 80:80*/
