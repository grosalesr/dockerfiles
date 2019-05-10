#!/bin/bash


#
# --add-host=HOST:IP
# adds entries in /etc/resolv.conf, one entry per add-host
# https://github.com/moby/moby/issues/10324 
#	-p 443:443 \ not needed since it is using host network mode
# $HOME/slvpn --> slvpn can be any folder, the idea is to have persisten data

docker run -it --rm \
	--ipc host \
    --net=host \
    --privileged \
    --workdir="$HOME" \
	--device /dev/dri \
    --user="$(id -u):$(id -g)" \
    --add-host=$HOST:$IP \
    -e DISPLAY=unix$DISPLAY \
    -v /etc/group:/etc/group:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/shadow:/etc/shadow:ro \
    -v /etc/sudoers.d/:/etc/sudoers.d:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v $HOME/slvpn:$HOME:rw \
    grosalesr/slvpn