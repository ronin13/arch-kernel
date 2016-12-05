FROM pritunl/archlinux:latest
LABEL description="Dockerfile to build linux kernel" version="0.0.1"
MAINTAINER Raghavendra Prabhu <me@rdprabhu.com>

RUN pacman -S --noconfirm base-devel wget  xmlto docbook-xsl kmod inetutils bc libelf abs
RUN usermod -d /home/nobody  -s /bin/bash nobody
RUN install -d -m 0755 -o nobody /home/nobody 
RUN abs 

WORKDIR /home/nobody
USER nobody

RUN cp -a /var/abs/core/linux .
WORKDIR linux 

RUN makepkg --skippgpcheck --nosign --skipchecksums

