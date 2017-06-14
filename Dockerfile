FROM buildpack-deps:xenial
MAINTAINER chris.geymo<at>gmail.com

RUN apt-get update && apt-get install software-properties-common -y && \
    add-apt-repository ppa:team-xbmc/ppa -y && \
    apt-get update && apt-get install kodi -y && \
    apt-get install lxde-core lxterminal -y && \
    rm -rf /var/lib/apt/lists/*