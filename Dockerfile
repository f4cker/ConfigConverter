FROM keymetrics/pm2:8-alpine
LABEL maintainer="Layoute<reallayoute@gmail.com>"
LABEL description="An image for QuantumultX/Surge rewrite config convert service"

WORKDIR /app

COPY . /app

# umi build for dist
RUN npm i yarn && \
  yarn global add umi && \
  yarn add umi-plugin-react --dev && \
  yarn install && \
  umi build && \
  yarn cache clean && rm -rf node_modules yarn.lock

EXPOSE 8000

CMD [ "pm2-runtime", "./pm2.yaml"]

