FROM node:12-alpine
ARG AWS_CDK_VERSION

ENV TZ=UTC

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone \
    && apk --update --no-cache add \
        ca-certificates \
        tzdata \
        unzip \
        git \
        curl \
    && npm install -g aws-cdk@${AWS_CDK_VERSION} \
    && rm -rf \
        ~/.npm \
        /usr/include/* \
        /var/cache/apk/* \
        /var/tmp/*

RUN deluser node \
    && addgroup -S -g 1000 sandbox \
    && adduser -D -S -G sandbox -u 1000 sandbox

COPY docker-entrypoint /docker-entrypoint

ENTRYPOINT ["/docker-entrypoint"]
CMD ["cdk", "-h"]
