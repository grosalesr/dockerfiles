# Description

This will allow you to run Packet Tracer 7.1.1 from a container that uses Ubuntu 14.04 and X11 Forwarding Protocol to display the GUI locally on your machine.

# Requirements
* Packet Tracer 7.1.1 for Linux 64 bit.tar.gz that you can get from [netacad](https://www.netacad.com/courses/packet-tracer)

# Build

* Create a folder
* Place the Dockerfile and the installer inside the folder
* Build it using:
```
docker build -t grosalesr/packerttracer7 .
```

# Execution

You can execute the application using:

1. The bash script provided **packetTracer7** or 

1. Executing `docker run` as follows:
```
docker run --rm -d \
        --user="$(id -u):$(id -g)" \
        -v /etc/group:/etc/group:ro \
        -v /etc/shadow:/etc/shadow:ro \
        -v /etc/sudoers.d:/etc/sudoers.d:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
        -v $HOME/Documents/packetTracer:/tmp \
        -e DISPLAY=unix$DISPLAY \
        grosalesr/packettracer7
```

**ATTENTION**: The command above mounts hosts folder `$HOME/Documents/packetTracer` folder to containers `/tmp`. Be sure to modify this to meet your needs.


**Security**: The `--user` and mounted volumes(group, shadow and sudoers.d) are required to ensure the access to the X server is only for the application user, see `man xhost`.

# Tested

* Fedora 28
* RHEL 7
    * When the application starts sometimes it's displayed as a black window. Resizing the will fix it.
    * It works with the shipped docker version (no need to install docker-ce); just use either `--rm` or `-d` not both.

# Thanks to:

* [Jessie Frazelle](https://blog.jessfraz.com/post/docker-containers-on-the-desktop/)
* [somatorio](https://github.com/somatorio/docker-packet-tracer)
