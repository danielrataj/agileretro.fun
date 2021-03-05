FROM node:15.8.0-alpine3.13
LABEL MAINTAINER="Daniel Rataj <daniel.rataj@centrum.cz>"

ENV RETRO_FILE_URL=""

# set a working directory
WORKDIR /app

# copy source code to WORKDIR
COPY . .

# install quasar globally
RUN yarn global add @quasar/cli@1.1.3

# install dependencies
RUN yarn install

COPY ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

# expose port for Node server
EXPOSE 8080
