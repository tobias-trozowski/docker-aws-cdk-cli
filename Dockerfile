FROM node:20-alpine
ARG AWS_CDK_VERSION

ENV TZ=UTC

RUN set -eux; \
    \
    ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone; \
    apk --update --no-cache add \
        ca-certificates \
        tzdata \
        unzip \
        git \
        curl \
    ; \
    \
    npm install -g aws-cdk@${AWS_CDK_VERSION}; \
    \
    rm -rf \
        ~/.npm \
        /usr/include/* \
        /var/cache/apk/* \
        /var/tmp/* \
    ;

VOLUME /root/.aws

VOLUME /app

ENTRYPOINT ["cdk"]

CMD ["-h"]
