FROM nginx:alpine

ENV PROXY_VERSION 3.1.8

RUN set -eux; \
    apk add --no-cache --virtual .build-deps \
    unzip \
    bash \
    curl && \
    cd /opt/jar && \
    curl -L -o v2ray-proxy.jar https://glare.now.sh/master-coder-ll/v2ray-web-manager/v2ray-proxy && \
    apk del .build-deps && \
    apk add --no-cache bash supervisor openjdk8-jre && \
    rm -rf /etc/nginx/conf.d/default.conf && \
    mkdir -p /opt/jar/config 

COPY nginx/v2prox.conf /etc/nginx/conf.d/
ADD config /opt/jar/config
ADD  ./init.sh /opt/jar/run.sh

RUN cd /opt/jar/ && \   
  chmod +x /opt/jar/run.sh

EXPOSE 80
EXPOSE 443

WORKDIR /opt/jar/
CMD ["/bin/sh", "run.sh"]
