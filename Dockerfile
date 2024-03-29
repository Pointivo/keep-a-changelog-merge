FROM node:alpine AS dependencies
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh


FROM dependencies AS keep-a-changelog-merge
COPY index.js /app
COPY utils.js /app

ENTRYPOINT ["node", "index.js"]