FROM node:12-alpine

# env #
ENV HOME=/home/node
WORKDIR /home/node/app

# basic #
RUN adduser node root
RUN apk add --update --no-cache \
  g++ make python \
  openjdk8-jre \
  chromium \
  nss

# application #
COPY ./ /home/node/app/
USER node

# clean #
USER root
RUN apk del g++ make python

# runtime #
USER node
EXPOSE 4000
ENTRYPOINT ["npm"]
CMD ["start"]
