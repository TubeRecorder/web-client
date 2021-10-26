FROM tube-recorder/ts-builder:latest as builder

# copy the application code
COPY --chown=builder:builder . ./app

# build and install
RUN \
  (cd app; npm install && npm run build)

FROM tube-recorder/ts-release:latest

# copy installed application
COPY \
  --from=builder \
  /home/builder/app/build/ \
  /usr/share/nginx/html/
