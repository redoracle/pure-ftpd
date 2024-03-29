FROM debian:buster
ENV DEBIAN_FRONTEND noninteractive


RUN set -xe \
    && apt-get update \
    && apt-get install -y pure-ftpd \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd ftpgroup \
    && useradd -g ftpgroup -m ftpuser

EXPOSE 21
VOLUME /home/ftpuser /etc/pure-ftpd

ENTRYPOINT ["pure-ftpd"]
CMD ["/etc/pure-ftpd/pureftpd.conf"]


