FROM debian:stable-slim

# Monero P2P
EXPOSE 18080
# Monero RPC
EXPOSE 18081

ENV CHECKSUM bf09eea27c957e7e2bdd62dac250888b301d4d25abe18d4a5b930fa7477708c7

WORKDIR /monero

RUN apt-get update -q && \
    apt-get install -y curl bzip2 && \
    useradd -m monero && \
    curl -OL https://downloads.getmonero.org/monero.linux.x64.v0-10-1-0.tar.bz2 && \
    [ `sha256sum monero.linux.x64.v0-10-1-0.tar.bz2 | cut -d' ' -f1` = $CHECKSUM ] || \
    (echo 'ERROR: Wrong checksum for Monero' && exit 255) && \
    tar jxf monero.linux.x64.v0-10-1-0.tar.bz2 && \
    rm monero.linux.x64.v0-10-1-0.tar.bz2 && \
    apt-get purge -y curl bzip2 && \
    apt-get autoremove --purge -y && \
    rm -rf /var/tmp/* /tmp/* /var/lib/apt/lists/*

VOLUME /home/monero
COPY entrypoint.sh /

USER monero
ENTRYPOINT ["/entrypoint.sh"]
