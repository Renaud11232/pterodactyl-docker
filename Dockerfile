FROM ubuntu:bionic

MAINTAINER Renaud Gaspard, <gaspardrenaud@hotmail.com>

RUN apt update -y \
  && apt install -y \
    build-essential \
    python-dev \
    python-pip \
    libffi-dev \
    gunicorn \
  && wget -qO- https://raw.githubusercontent.com/CTFd/CTFd/master/requirements.txt | pip install -r /dev/stdin \
  && rm -rf /var/lib/apt/lists/* \
  && adduser -D -h /home/container container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
