# Description

Wine runtime

# Build

* Create a folder
* Place the Dockerfile and the installer inside the folder
* Build it using:
```
docker build -t grosalesr/wine -f Dockerfile.<ubuntu|fedora>
```

# Execution

You can execute the application using:

1. The bash script provided or 

1. Executing `docker run` as follows:
```
docker run --rm -d \
        --user="$(id -u)" \
        --workdir="/home/$(id -un)" \
        -v /home/$(id -un):/home/$(id -un):rw\
        -v /etc/group:/etc/group:ro \
        -v /etc/passwd:/etc/passwd:ro \
        -v /etc/shadow:/etc/shadow:ro \
        -v /etc/sudoers.d/:/etc/sudoers.d:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
        -e DISPLAY=unix$DISPLAY \
        grosalesr/wine
```
