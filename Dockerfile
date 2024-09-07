FROM node:20

WORKDIR /app

USER node

RUN git config --global --add safe.directory /app
