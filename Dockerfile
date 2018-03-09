FROM php:5-alpine
RUN mkdir -p /opt/hello-php /run/apache2 
COPY assets /opt/hello-php/htdocs
RUN \
    # Upgrade old packages.
    apk --update upgrade && \
    # Ensure we have ca-certs installed.
    apk add --no-cache ca-certificates && \
    # Apache and PHP packages
    apk add apache2 php5-apache2

COPY httpd.conf /opt/hello-php/
COPY local.ini /etc/php5/conf.d/

CMD /usr/sbin/httpd -f /opt/hello-php/httpd.conf -D FOREGROUND

