From ubuntu:18.04
LABEL maintainer="Gerardo Rosales"

RUN apt-get update && apt-get install -y libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    unzip
    
# Setting up Oracle JDK
ENV JAVA_HOME=/opt/java/current
ENV PATH=$PATH:$JAVA_HOME/bin

WORKDIR /opt/java

COPY jdk-*-linux-x64.tar.gz oracle-jdk.tar.gz

# Uncompress and install Oracle JDK then removes installer
RUN tar -zxf oracle-jdk.tar.gz && \
    rm oracle-jdk.tar.gz && \
    ln -s /opt/java/jdk* /opt/java/current

# Setting up Netbeans IDE
WORKDIR /tmp
COPY netbeans-8.2-*-javase.zip netbeans.zip

RUN unzip -q netbeans.zip -d /opt/ && \
    rm netbeans.zip

ENTRYPOINT [ "/opt/netbeans/bin/netbeans" ]
