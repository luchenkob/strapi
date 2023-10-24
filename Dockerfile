FROM node:18-alpine

# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt/

COPY package.json yarn.lock ./

RUN yarn global add node-gyp
RUN yarn config set network-timeout 600000 -g 
RUN yarn install

# Adding project files
WORKDIR /opt/app
COPY . .

RUN yarn build

# Expose API port to the outside
EXPOSE 1337

# Launch Strapi
CMD ["yarn", "start"]