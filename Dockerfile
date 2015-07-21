FROM tutum/apache-php:latest
MAINTAINER li xinxing  <admin@lxx1.com>

ENV WORDPRESS_VER 4.2.2
WORKDIR /
RUN apt-get update && \
    apt-get -yq install mysql-client curl && \
    rm -rf /app && \
    curl -0L http://wordpress.org/wordpress-4.2.2.tar.gz | tar zxv && \
    mv /wordpress /app && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
RUN a2enmod rewrite
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 80
CMD ["/run.sh"]
