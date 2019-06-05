# use multi-stage builds so the final runtime image is small 
# https://cloud.google.com/blog/products/gcp/kubernetes-best-practices-how-and-why-to-build-small-container-images
# https://docs.docker.com/develop/develop-images/multistage-build/

FROM golang:alpine AS build-env
WORKDIR /app
ADD . /app
RUN cd /app && go build -o goapp

FROM alpine
RUN apk update && \
  apk add ca-certificates && \
  update-ca-certificates && \
  rm -rf /var/cache/apk/*
WORKDIR /app
COPY --from=build-env /app/goapp /app
ENTRYPOINT ./goapp
