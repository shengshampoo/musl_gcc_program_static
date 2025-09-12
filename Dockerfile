FROM alpine:latest

# https://mirrors.alpinelinux.org/
RUN sed -i 's@dl-cdn.alpinelinux.org@ftp.halifax.rwth-aachen.de@g' /etc/apk/repositories

RUN apk update
RUN apk upgrade

# required nginx 
RUN apk add --no-cache \
 gcc make linux-headers musl-dev \
 zlib-dev zlib-static python3-dev \
 curl g++ git screen patch tar \
 lzip xz wget2 gettext-dev rsync bash

COPY build-static-muslgcc.sh build-static-muslgcc.sh
COPY config.mak.2.musl config.mak.2.musl
COPY config.mak.3.musl config.mak.3.musl
RUN chmod +x ./build-static-muslgcc.sh
RUN bash ./build-static-muslgcc.sh
