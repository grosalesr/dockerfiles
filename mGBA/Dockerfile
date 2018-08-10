From ubuntu:18.04
LABEL maintainer="Gerardo Rosales"

WORKDIR /tmp
COPY mGBA*.tar.xz mgba.tar.xz
COPY init.sh .

RUN apt-get update && apt-get install -y xz-utils && \
    tar xf mgba.tar.xz --strip-components 1  && \
    apt-get install -y ./mgba-* ./libmgba.deb --no-install-recommends && \
    mkdir /opt/mgba && \
    rm -rf /var/lib/apt/lists/*  *.deb *.xz LICENSE && \
    chmod +x init.sh


ENTRYPOINT [ "./init.sh"  ]
