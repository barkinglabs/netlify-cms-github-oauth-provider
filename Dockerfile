FROM node:12.12

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/
COPY index.js /usr/src/app/

RUN yarn install --production && yarn cache clean --force

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV
ENV PORT 8080

CMD [ "node", "index.js" ]

EXPOSE 8080
