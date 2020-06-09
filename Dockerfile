# base image
FROM node:latest AS build

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

# set working directory
#WORKDIR /opt/ng COPY .npmrc package.json yarn.lock ./
WORKDIR /usr/src/app


# install and cache app dependencies
COPY package.json ./
RUN npm install


# add app
COPY . .
RUN npm run build

FROM nginx
COPY --from=build /usr/src/app/dist/abankusconsultingapp /usr/share/nginx/html

