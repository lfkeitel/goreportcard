FROM alpine:3.5

RUN apk update && \
    apk add git mercurial ca-certificates && \
    rm -rf /var/cache/apk/*

ENV GOPATH=/app/repos

COPY goreportcard /app/goreportcard
COPY templates /app/templates
COPY assets /app/assets
COPY build-tmp/* /usr/local/sbin/
COPY docker-shim.sh /usr/local/sbin/go

WORKDIR /app

EXPOSE 8000

ENTRYPOINT ["/app/goreportcard"]
