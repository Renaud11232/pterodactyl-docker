FROM ubuntu:bionic

MAINTAINER Renaud Gaspard, <gaspardrenaud@hotmail.com>

RUN dpkg --add-architecture i386 \
  && apt update -y \
  && apt install -y \
    libstdc++6:i386 \
    libncurses5:i386 \
  && rm -rf /var/lib/apt/lists/* \
  && echo "65.112.87.186  bfvietnam.master.gamespy.com" >> /etc/hosts \
  && echo "65.112.87.186  bfvietnam.available.gamespy.com" >> /etc/hosts \
  && echo "65.112.87.186  bfvietnam.ms0.gamespy.com" >> /etc/hosts \
  && adduser -D -h /home/container container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
