FROM node:20-alpine AS base

ARG UID=1000
ARG GID=1000

WORKDIR /app

RUN corepack enable
ENV COREPACK_ENABLE_DOWNLOAD_PROMPT=0

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git && \
    chown node:node -R /app

RUN git config --global --add safe.directory /app

COPY --chown=node:node package.json pnpm-lock.yaml /app/

USER node

CMD [ "pnpm", "start:dev" ]
