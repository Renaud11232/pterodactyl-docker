FROM node:lts-alpine

MAINTAINER Renaud Gaspard, <gaspardrenaud@hotmail.com>

RUN apk add --no-cache git\
    && adduser -D -h /home/container container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]
