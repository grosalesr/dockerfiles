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

Use the bash script provided **packetTracer7** or run the followings commands:

* If you're using any of the Fedora family (RHEL, CentOS, etc) and SELinux is in Enforcing mode, it would be necessary set it to permissive in runtime.
```
sudo setenforce 0
```

* Enable connections to X server for the root user
```
xhost +SI:localuser:root
```

* Run the application
```
docker run --rm -d -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/PT:/root/pt -e DISPLAY=unix$DISPLAY grosales/packettracer7 "$@"
```

# Tested

* Fedora 28
* RHEL 7
    * When the application starts sometimes it gets displayed as a black window. Resizing the will fix it.
    * It works with the shipped docker version (no need to install docker-ce); just use either `--rm` or `-d` not both.

Thanks to:

* [Jessie Frazelle](https://blog.jessfraz.com/post/docker-containers-on-the-desktop/)
* [somatorio](https://github.com/somatorio/docker-packet-tracer)
