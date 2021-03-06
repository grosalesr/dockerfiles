#!/bin/bash

if [ ! -d $HOME/Documents/packetTracer ]; then
    mkdir $HOME/Documents/packetTracer
fi

# For RHEL remove '-d' flag
docker run --rm -d \
        --user="$(id -u):$(id -g)" \
        -v /etc/group:/etc/group:ro \
        -v /etc/shadow:/etc/shadow:ro \
        -v /etc/sudoers.d:/etc/sudoers.d:ro \
 	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
 	-v $HOME/Documents/packetTracer:/tmp \
 	-e DISPLAY=unix$DISPLAY \
 	grosalesr/packettracer7

