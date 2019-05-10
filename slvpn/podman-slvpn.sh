#!/bin/bash

#--network="bridge" \
#    --network="host" \
#--network="bridge" \
#    -p 443:443 \
#    -p 1080:1080 \
#    --security-opt=label=type:container_runtime_t \
#    --security-opt=label=disable \
#    --security-opt label=type:slvpn.process \


podman run --rm -it \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v /dev/dri:/dev/dri \
    --security-opt=label=type:container_runtime_t \
    --ipc=host \
    -e DISPLAY \
    localhost/grosalesr/slvpn
