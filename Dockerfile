FROM pritunl/archlinux:latest
LABEL description="Dockerfile to build linux kernel" version="0.0.1"
MAINTAINER Raghavendra Prabhu <me@rdprabhu.com>

ARG VUID=1000

RUN pacman -S --noconfirm base-devel wget  xmlto docbook-xsl kmod inetutils bc libelf python ncurses
RUN usermod -u $VUID -d /home/nobody  -s /bin/bash nobody
RUN install -d -m 0755 -o nobody /home/nobody 

WORKDIR /home/nobody
USER nobody

RUN wget -O - https://git.archlinux.org/svntogit/packages.git/snapshot/packages-packages/linux.tar.gz | tar zxf -
WORKDIR packages-packages/linux/repos/core-x86_64

ADD run.sh /run.sh
ADD config.localmodconfig config.x86_64
ADD PKGBUILD PKGBUILD

VOLUME /deploy

CMD ["/run.sh", "/deploy"]

