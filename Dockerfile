FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y curl unzip xdg-user-dirs && \
    curl -s https://storage.googleapis.com/battalion_public/BattalionLinuxServer_10849.zip > /tmp/linuxserver.zip && \
    unzip /tmp/linuxserver.zip && \
    rm /tmp/linuxserver.zip; \
    apt-get purge -y unzip && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/

COPY entrypoint.sh /LinuxServer/entrypoint.sh
RUN chmod +x /LinuxServer/Battalion/Binaries/Linux/BattalionServer && \
    chmod +x /LinuxServer/entrypoint.sh

WORKDIR /LinuxServer
ENTRYPOINT /LinuxServer/entrypoint.sh
