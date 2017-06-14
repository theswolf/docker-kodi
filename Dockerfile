FROM buildpack-deps:xenial
MAINTAINER chris.geymo<at>gmail.com

RUN apt-get update && apt-get install software-properties-common -y && \
    add-apt-repository ppa:team-xbmc/ppa -y && \
    apt-get update && apt-get install kodi -y && \
    apt-get install lxde-core lxterminal -y && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y sudo && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y firefox && rm -rf /var/lib/apt/lists/*

RUN echo 'deb http://repo.acestream.org/ubuntu/ trusty main' | sudo tee /etc/apt/sources.list.d/acestream.list && \
    wget -O - http://repo.acestream.org/keys/acestream.public.key | sudo apt-key add - && \
    apt-get update && \
    apt-get install acestream-engine -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/developer && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown developer:developer -R /home/developer && \
    chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo


USER developer
ENV HOME /home/developer
WORKDIR /home/developer
