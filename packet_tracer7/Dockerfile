From ubuntu:14.04
LABEL maintainer="Gerardo Rosales"


RUN apt-get update && apt-get install -y \ 
    xcb \
    libicu52 \
    libX11-6 \
    libglib2.0 \
    libxslt1.1 \
    libqt5multimedia5 \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY Packet?Tracer*tar.gz /root/pt.tar.gz

RUN mkdir -p /opt/pt && \
    tar zxf /root/pt.tar.gz -C /opt/pt && \ 
    sed 's/III/\/opt\/pt/' /opt/pt/tpl.packettracer > /opt/pt/packettracer && \
    sed 's/III/\/opt\/pt/' /opt/pt/tpl.linguist > /opt/pt/linguist && \
    chmod +x /opt/pt/linguist /opt/pt/packettracer && \
    sh /opt/pt/set_ptenv.sh && \
    sh /opt/pt/set_qtenv.sh && \
    rm -f /root/pt.tar.gz 

    
ENTRYPOINT [ "/opt/pt/packettracer" ]
