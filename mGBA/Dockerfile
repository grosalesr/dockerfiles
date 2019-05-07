From ubuntu:18.10
LABEL maintainer="Gerardo Rosales"

WORKDIR /tmp
COPY mGBA*.tar.xz mgba.tar.xz
COPY init.sh .

# ---> Dependencies
RUN apt-get update && apt-get install -y \
    xz-utils \
    libavcodec58 \
    libavformat58 \
    libswresample3 \
    libavutil56 \
    libswscale5 \
    libmagickwand-6.q16-6

# mGBA: version=0.7.1 source=https://mgba.io/
RUN tar xf mgba.tar.xz --strip-components 1  && \
    apt-get install -y ./mgba-* ./libmgba.deb --no-install-recommends && \
    mkdir /opt/mgba && \
    rm -rf /var/lib/apt/lists/*  *.deb *.xz LICENSE && \
    chmod +x init.sh

ENTRYPOINT [ "./init.sh"  ]
