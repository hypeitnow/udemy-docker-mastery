FROM remote-host

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

RUN                                                                          \
  yum -y install nginx openssl --enablerepo=nginx                         && \
  yum --enablerepo=extras -y install epel-release                         && \
  yum -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm  && \
  yum -y install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-json \
    && yum clean all 

EXPOSE 80 443

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./bin/start.sh /start.sh

COPY ./website/ /usr/share/nginx/html/

COPY ./website/ /var/www/html/

RUN chmod +x /start.sh && usermod -G tty nobody

CMD /start.sh

CMD ["nginx", "-g", "daemon off;"]