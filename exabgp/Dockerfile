FROM python:3-slim

ARG USERNAME=exabgp

RUN apt-get update \
    && apt-get install -y iproute2 dumb-init \
    && apt-get clean

RUN pip install --upgrade pip

RUN useradd -r ${USERNAME} \
    && mkdir /etc/exabgp \
    && mkfifo /run/exabgp.in \
    && mkfifo /run/exabgp.out \
    && chown ${USERNAME} /run/exabgp.in \
    && chown ${USERNAME} /run/exabgp.out \
    && chmod 600 /run/exabgp.in \
    && chmod 600 /run/exabgp.out

RUN echo "[exabgp.daemon]" > /etc/exabgp/exabgp.env
RUN echo "user = '${USERNAME}'" >> /etc/exabgp/exabgp.env

RUN pip install exabgp

WORKDIR /etc/exabgp

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/usr/local/bin/exabgp", "exabgp.conf"]
