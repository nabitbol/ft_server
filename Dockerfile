FROM debian:buster

/*image utiliser pour le container debian buster voir le sujet */


/*installation des paquets */
RUN apt-get update \
    && ap-get install -y \
	nginx

/*recherche et installation de nginx */


Copy nginx.conf /etc/nginx/nginx.conf

/*copy des configurations et scripts du systeme hote vers l'image */
