FROM node:12-alpine

# env #
ENV HOME=/app
WORKDIR /app

# basic #
RUN set -ex && \
  adduser node root && \
  chmod g+w /app && \
  apk add --update --no-cache \
  g++ make python \
  openjdk8-jre \
  chromium \
  nss

# application #
COPY package.json package-lock.json /app/
RUN set -ex && \
    npm ci
COPY ./ /app/
RUN set -ex && \
    apk del g++ make python

# runtime #
USER node
EXPOSE 4000
ENTRYPOINT ["npm"]
CMD ["start"]
