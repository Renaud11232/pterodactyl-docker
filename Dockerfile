FROM python:3-alpine

MAINTAINER Renaud Gaspard, <gaspardrenaud@hotmail.com>

RUN pip --no-cache-dir install gunicorn gevent \
  && wget -qO- https://raw.githubusercontent.com/CTFd/CTFd/master/requirements.txt | pip --no-cache-dir install -r /dev/stdin \
  && adduser -D -h /home/container container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
