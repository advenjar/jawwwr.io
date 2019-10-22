FROM node:10 as installer

WORKDIR /usr/src/

COPY ./app ./app
COPY ./internals ./internals
COPY ./server ./server
COPY .eslintrc.js .
COPY .nvmrc .
COPY *.config.js ./
COPY *.json ./

RUN npm install 2>&1

FROM node:10 as builder
WORKDIR /usr/src/
COPY --from=installer /usr/src/node_modules/ ./node_modules

COPY ./app ./app
COPY ./internals ./internals
COPY ./server ./server
COPY .eslintrc.js .
COPY .nvmrc .
COPY *.config.js ./
COPY *.json ./

RUN npm run build