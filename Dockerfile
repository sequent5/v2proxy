FROM alpine:latest

ENV PROXY_VERSION 3.1.8

RUN set -eux; \
    apk add --no-cache --virtual .build-deps \
    unzip \
    bash \
    curl && \
    mkdir -p /opt/jar && \
    cd /opt/jar && \
    curl -L -o v2ray-proxy.jar https://glare.now.sh/master-coder-ll/v2ray-web-manager/v2ray-proxy && \
    apk del .build-deps && \
    apk add --no-cache bash supervisor openjdk8-jre && \
    mkdir -p /opt/jar/config 

ADD  config /opt/jar/config
ADD  ./init.sh /opt/jar/init.sh

RUN chmod +x /opt/jar/init.sh

WORKDIR /opt/jar/
CMD ["/bin/sh", "init.sh"]
