FROM node:14

MAINTAINER Renaud Gaspard, <gaspardrenaud@hotmail.com>

RUN useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
