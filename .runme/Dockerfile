FROM node:12.16.2
WORKDIR /app
COPY . .
RUN docker-compose build app
ENTRYPOINT npm run start
