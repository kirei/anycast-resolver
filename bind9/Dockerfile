FROM docker.io/fedora:40

RUN dnf -y update && dnf -y install bind9-next bind9-next-utils openssl

ADD entrypoint.sh /

EXPOSE 53/udp
EXPOSE 53/tcp
EXPOSE 443/tcp
EXPOSE 853/tcp

COPY named.conf /etc/named.conf

ENTRYPOINT ["sh", "/entrypoint.sh"]
