FROM ubuntu
# install necessary soft. remove apt cache files to reduce docker image size
RUN apt update && apt install -y nginx haproxy supervisor && rm -rf /var/lib/apt/lists/*
#
RUN mkdir -p /run/haproxy/ && chown -R haproxy:haproxy /var/lib/haproxy

# copy configs to image
COPY config/supervisor/supervisord.conf /etc/supervisor/conf.d/
COPY config/nginx/default /etc/nginx/sites-enabled/
COPY config/haproxy/haproxy.cfg /etc/haproxy/

# copy content to image
COPY config/content/index.html /var/www/html/

EXPOSE 80
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
