FROM alpine:latest

LABEL maintainer="Tristan Morgan <tristan.morgan@servian.com>"
LABEL Description="Azure-CLI in a minimal container"

ARG AZ_CLI_VERSION=2.7.0
RUN apk upgrade --no-cache \
 && apk add --no-cache --virtual .build-deps gcc openssl libc-dev libffi-dev libxml2-dev python3-dev libxslt-dev linux-headers openssl-dev build-base \
 && apk add --no-cache python3 py-pip \
 && python3 -m pip install wheel --upgrade pip \
 && python3 -m pip install azure-cli==$AZ_CLI_VERSION \
 && apk del --no-cache .build-deps \
 && rm -rf /root/.cache /src

ENV PAGER=more
WORKDIR /work
