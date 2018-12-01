# Description

Wine runtime based on Fedora and Ubuntu. 

The idea is to have a wine(base) image that can be used to containerize specific windows application. 

This process involves:

1. Create a bottle for the application
1. Use winetricks to install the application dependencies(other apps)
1. Using X, test the application 
1. Once the application works, build and ship it.

# Build

* Create a folder
* Place the Dockerfile and the installer inside the folder
* Build it using:
```
docker build -t grosalesr/wine<ubuntu|fedora> -f Dockerfile.<ubuntu|fedora>
```

# Execution

You can execute the application using any of the follwing

## Script

There are two bash script:

1. Docker
1. [Podman](https://fedoramagazine.org/running-containers-with-podman/)

Which basically do the same as the commands you will find below

## Docker

```
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
```

## Podman

# Now what?

Congrats, you're inside the container but it doesn't look that exiting right?

## Creating bottles

## Winetricks

Or installing dependencies

## Testing

## Rinse and Repeat

Yup, now is up to you. A great place to start is [winehqdb](https://appdb.winehq.org/) look for the application you need/want and get informed what is needed to make it run on Wine.

# What worked?

I've been able to run must applications I've needed but those that I find worth to mention are:

* Office2013

