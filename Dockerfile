FROM alpine:3.6

MAINTAINER Leandro Rosa <leandrogr03@gmail.com>

# Update
RUN apk add --update && apk upgrade

# Install NodeJS
RUN apk add --update nodejs nodejs-npm

# Creates the app folder
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Installs app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Installs global nodemon
RUN npm install -g nodemon

# Copy to app
COPY . /usr/src/app

# Expose the door
EXPOSE 3000

# Run the service
CMD ["nodemon", "-L", "/usr/src/app"]


