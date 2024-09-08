FROM oven/bun:1

WORKDIR /app

RUN apt-get update && \
    apt-get install -y git

COPY package.json ./
COPY bun.lockb ./
COPY src ./

USER bun

RUN git config --global --add safe.directory /app
