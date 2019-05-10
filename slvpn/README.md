# Description

MotionPro is the VPN app used to access IBM's cloud.

when used and the host is already connected to a VPN it will shut the active VPN connection and then establish a connection to SL.
Containerize the application will isolate it and make it work with another VPNs

**Requirements**
1. [MotionPro](https://cloud.ibm.com/docs/infrastructure/iaas-vpn?topic=VPN-standalone-vpn-clients)

# Building

1. Download `MotionPro` software for **CentOS**, url in the *requirements* section, place the installer inside the `deps` folder.
1. Build for `docker` or `podman`


## docker

```
docker build -t grosalesr/slvpn .
```

## podman

```
podman build -t localhost/grosalesr/slvpn .
```

# Bundle Scripts

Wrapper scripts are provided to simplify the applications management.

## Start up

### Docker

See the `docker-slvpn.sh` script, this scripts uses:

1. Privileged Mode
1. IPC host

**Before** running this script you will need to either fill or remove the following line on the script `--add-host=$HOST:$IP \`.

This parameter adds an entry to the resolver file, `/etc/resolv.conf`, therefore if you need more than one entry it is necessary to copy this line to match your requirements otherwise delete it from the script.


### Podman

**WIP**

[slirp4netns](https://github.com/containers/libpod/issues/2356), rootless network support is not there yet.


## Helpers

### cloudWork

Entrypoint for the container, starts up a `tmux` session with predefined set of panes.


### jobDone

Kills the `tmux` session effectively shutting down the container.

### winRDP

**WIP**

Wrapper for `xfreerdp` that simplifies its usage.

# Usage

This container uses [tmux](https://github.com/tmux/tmux/wiki), [here](https://www.tmuxcheatsheet.com/) is a cheat sheet in case you need it.


1. Create a directory, eg: slvp, this will be mounted as the home for your user and provides data persistency
1. Modify the appropiate startup script `docker-slvpn.sh`, `podman-slvpn`, see *Bundle Scripts*.
1. To stop the container execute: `jobDone` from the CLI

