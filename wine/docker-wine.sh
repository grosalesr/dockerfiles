#!/bin/bash


case "$1" in
    testing)
        TAG="ubuntu"
        IMG="grosalesr/wine:ubuntu"
        ;;
    start)
        IMG=$2
        TAG=$3
        ;;
    *)
        echo "Usage: $0 {start IMAGE TAG|testing}"
        exit 1
esac


## Docker Tag

## Wine Arch

# 32 bits
WINEARCH="win32"


# 64 bits
#WINEARCH="win64"
#IMG="wine64"


docker run --rm -it \
    --user="$(id -u)" \
    --device /dev/dri \
    --device /dev/snd \
    --ipc host \
    --workdir="/home/appuser" \
    -v /etc/group:/etc/group:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/shadow:/etc/shadow:ro \
    -v /etc/sudoers.d/:/etc/sudoers.d:ro \
 	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v /home/$(id -un)/Downloads:/mnt:rw \
 	-e DISPLAY=unix$DISPLAY \
    -e WINEARCH=$WINEARCH \
    $IMG:$TAG
