FROM tube-recorder/ts-builder:latest as builder

COPY . .

RUN \
  npm install && npm run build

FROM tube-recorder/ts-release:latest

COPY \
  --from=builder \
  /usr/src/app/build/ \
  /usr/share/nginx/html/
