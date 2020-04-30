FROM nginx:1.18.0-alpine

ADD vhost.conf /etc/nginx/conf.d/default.conf