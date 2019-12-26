FROM debian:buster

/*image utiliser pour le container debian buster voir le sujet */
/*mise a jour*/
RUN apt-get update


/*installation des paquets */
RUN ap-get install -y \
	wget

/*recherche et installation de wget */

RUN apt-get install -y \
	nginx

/*recherche et installation de nginx */

RUN apt-get install -y \
	mariadb-server

/*recherche et installation de mysql*/

/*installation service php*/
RUN apt-get -y install php-fpm php-common php-mysql php-cli \
				php-mbstring php-gd php-xml php-intl php-zip php-curl

RUN service php7.3-fpm start


/*exposition du port 80:80*/
EXPOSE 80

