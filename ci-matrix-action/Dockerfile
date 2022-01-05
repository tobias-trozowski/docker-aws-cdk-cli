FROM node:17-alpine

ENV TZ=UTC

COPY index.js package.json package-lock.json /app/

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone \
    && apk --update --no-cache add \
        ca-certificates \
        tzdata \
        unzip \
        git \
        curl \
    && cd /app && npm ci \
    && rm -rf \
        ~/.npm \
        /usr/include/* \
        /var/cache/apk/* \
        /var/tmp/*

VOLUME /app

WORKDIR /app

ENTRYPOINT ["node", "/app/index.js"]
