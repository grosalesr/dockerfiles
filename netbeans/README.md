# Description

This will allow you to run NetBeans and Oracle JDK from a container that uses Ubuntu 18.04 and X11 Forwarding Protocol to display the GUI locally on your machine.

# Requirements
* [NetBeans](https://netbeans.org/), the OS independent zip file.
* [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html), the tar.gz file.

# Build

* Create a folder
* Place the Dockerfile and the installer inside the folder
* Build it using:
```
docker build -t grosalesr/netbeans:ubuntu .
```

# Execution

You can execute the application using:

1. The bash script provided **netbeans** or 

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
        grosalesr/netbeans:ubuntu
```

**ATTENTION**: The command above mounts the complete $HOME folder from the host to the container's `/home`.
This is required since NetBeans creates a `.netbeans` folder in the $HOME in order to store its configuration.

**Security**: The `--user` and mounted volumes(group, shadow and sudoers.d) are required to ensure the access to the X server is only for the application user, see `man xhost`.
