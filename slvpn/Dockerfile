From centos
LABEL maintainer="Gerardo Rosales"

# Base packages & configs
RUN yum install -y \
    tmux \
    freerdp \
    firefox \
    dbus-x11 \
    dnssec-trigger \
    NetworkManager \
    openssh-clients \
    mesa-dri-drivers

# Setup application
COPY  deps /tmp/deps
WORKDIR /tmp/deps/

## MotionPro installation
RUN mv MotionPro_Linux_CentOS*.sh slvpn.sh && \
    sh slvpn.sh && \
    rm slvpn.sh

# dbus-uuidgen: machine-id generated in order to fix firefox
RUN chmod a+x * && \
    mv * /usr/bin/ && \
    dbus-uuidgen > /var/lib/dbus/machine-id && \
    rm -rf /tmp/deps

ENTRYPOINT [ "cloudWork" ]
