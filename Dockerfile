ARG BUILD_FROM
FROM $BUILD_FROM

ARG \
    BUILD_ARCH \
    YQ_VERSION \
    COSIGN_VERSION

RUN \
    set -x \
    && apk add --no-cache \
        git \
        docker \
        docker-cli-buildx \
        coreutils \
        yq \
    && chmod +x /usr/bin/yq 

COPY builder.sh /usr/bin/

WORKDIR /data
ENTRYPOINT ["/usr/bin/builder.sh"]
