FROM node:16-alpine

RUN apk add --no-cache libc6-compat openssl

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/package.json
COPY yarn.lock /usr/src/app/yarn.lock
RUN yarn install  --pure-lockfile

RUN echo $(cat /etc/os-release)

COPY . /usr/src/app

CMD ["sh", "scripts/run-prisma.sh"]
