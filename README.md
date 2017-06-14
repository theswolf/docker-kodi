# docker-kodi

## how to run:

 docker start kodi || docker run -it --cap-add=SYS_ADMIN -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix --name kodi theswolf/docker-kodi kodi 
