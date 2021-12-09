FROM node:17-alpine

COPY index.js package.json package-lock.json /app/

RUN cd /app && npm ci

VOLUME /app

WORKDIR /app

ENTRYPOINT ["node", "/app/index.js"]
