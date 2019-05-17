#!/bin/bash

podman run --rm -it \
    -e DISPLAY \
    --ipc host \
    -v /dev/dri:/dev/dri \
    --workdir="/home/appuser" \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v /home/$(id -un)/Downloads:/mnt:rw \
    --security-opt=label=type:container_runtime_t \
    localhost/grosalesr/wine /bin/bash
