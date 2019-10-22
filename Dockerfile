# Pull
FROM node:latest as builder

RUN mkdir -p /frontend/internals
WORKDIR /frontend

COPY .eslintrc.js .
COPY .nvmrc .
COPY *.config.js ./
COPY *.json ./

ADD ./internals/mocks ./internals/mocks
ADD ./internals/scripts ./internals/scripts
ADD ./internals/testing ./internals/testing
ADD ./internals/webpack ./internals/webpack
RUN ls -all ./internals

ADD ./app ./app
ADD ./server ./server
RUN npm install
RUN npm run build


# Pull from nginx container
FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /frontend/build /usr/share/nginx/html