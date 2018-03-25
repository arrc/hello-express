FROM node:8.0-alpine AS base
RUN apk add --no-cache make gcc g++ python && \
  npm install --production --silent && \
  apk del make gcc g++ python
RUN ls -al -R
WORKDIR /appz
RUN ls -al -R

# ---- Dependencies ----
FROM base AS dependencies
RUN ls -al -R
COPY package*.json .
RUN ls -al -R
RUN apk --no-cache add --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers make python \
  imagemagick graphicsmagick ffmpeg && \
  npm install --quiet node-gyp -g
RUN npm install
# RUN apk del native-deps
RUN cp -R node_modules /tmp/node_modules
RUN ls -al -R

# --- Prod ----
FROM base AS prod
RUN npm install pm2 -g
# COPY --from=dependencies /usr/bin/node /usr/bin/
# COPY --from=dependencies /usr/lib/libgcc* /usr/lib/libstdc* /usr/lib/
COPY --from=dependencies /tmp/node_modules ./node_modules
COPY . .
EXPOSE 3000
CMD ["pm2-runtime", "--json", "process.yml"]
