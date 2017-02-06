FROM armhf/debian:latest
MAINTAINER BrainGamer
LABEL com.resilio.version="2.4.4"

ADD https://download-cdn.resilio.com/stable/linux-armhf/resilio-sync_armhf.tar.gz /tmp/sync.tar.gz
RUN tar -xf /tmp/sync.tar.gz -C /usr/bin rslsync && rm -f /tmp/sync.tgz

COPY sync.conf.default /etc/
COPY run_sync /usr/bin/

EXPOSE 8888
EXPOSE 55555

VOLUME /mnt/sync

ENTRYPOINT ["run_sync"]
CMD ["--config", "/mnt/sync/sync.conf"]
