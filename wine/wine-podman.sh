#!/bin/bash

podman run --rm -it \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v /dev/dri:/dev/dri \
	-v /home/$(id -un)/Downloads:/mnt:rw \
	--workdir="/home/appuser" \
    --security-opt=label=type:container_runtime_t \
    -e DISPLAY \
    localhost/grosalesr/wine:fedora /bin/bash
