FROM node:20-alpine AS base

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

ARG UID=1000
ARG GID=1000

WORKDIR /app

RUN corepack enable
ENV COREPACK_ENABLE_DOWNLOAD_PROMPT=0

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git

RUN chown node:node -R /app && \
    git config --global --add safe.directory /app

COPY --chown=node:node package.json pnpm-lock.yaml /app/

USER node

CMD [ "pnpm", "start:dev" ]
