# Description

[mGBA](https://mgba.io/) is a Game Boy Advance Emulator packaged in Docker just because.


# Build

* Create a folder
* Place the Dockerfile and the installer inside the folder
* Build it using:
```
docker build -t grosalesr/mgba .
```


# Execution

You can execute the application using:

1. The bash script provided **mgba** or 

1. Executing `docker run` as follows:
```
docker run --rm -d \
        --user="$(id -u):$(id -g)" \
        --device /dev/dri \
        --ipc host \
        -v /etc/group:/etc/group:ro \
        -v /etc/passwd:/etc/passwd:ro \
        -v /etc/shadow:/etc/shadow:ro \
        -v /etc/sudoers.d/:/etc/sudoers.d:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
        -v $HOME/Documents/mGBA:/tmp/$(id -u) \
        -e XDG_RUNTIME_DIR=/tmp/$(id -u) \
        -e DISPLAY=unix$DISPLAY \
        grosalesr/mgba
```

**ATTENTION**: The command above mounts hosts folder `$HOME/Documents/mGBA` folder to containers `/tmp/$USERID`. Be sure to modify this to meet your needs.

# Known Issues

If you run the application manually (read, not using the script provided) the application won't start and you must keep executing `docker run ...` until the app gets started.

The app inside the container is crashing, still don't know why since all the needed parts are there, therefore the script provided `init.sh` will try to launch the application until it succeeds as a workaround.

I've testing it and I haven't had any issues.
