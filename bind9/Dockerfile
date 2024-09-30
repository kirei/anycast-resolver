FROM docker.io/fedora:40

RUN dnf -y update && dnf -y install bind9-next bind9-next-utils socat

ADD entrypoint.sh /

EXPOSE 53/udp
EXPOSE 53/tcp
EXPOSE 443/tcp
EXPOSE 853/tcp

COPY named.conf /etc/named.conf

RUN install -d -m 750 -o root -g named /etc/named/conf.d
RUN install -d -m 750 -o root -g named /etc/named/local.d

RUN touch /etc/named/conf.d/empty.conf
RUN touch /etc/named/local.d/empty.conf

ENTRYPOINT ["sh", "/entrypoint.sh"]
