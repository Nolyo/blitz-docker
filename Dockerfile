FROM node:18

WORKDIR /app

RUN npm install -g blitz

COPY app/ ./

RUN npm install

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["docker-entrypoint.sh"]