FROM my-build/ts-builder:latest as builder

COPY . .

RUN \
  npm install && npm run build

FROM my-build/ts-release:latest

COPY \
  --from=builder \
  /usr/src/app/build/ \
  /usr/share/nginx/html/
