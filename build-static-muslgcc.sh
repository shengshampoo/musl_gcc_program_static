
#! /bin/bash

set -e

WORKSPACE=/tmp/workspace
mkdir -p $WORKSPACE
mkdir -p /work/artifact

# musl-cross-make stage-0
cd $WORKSPACE
git clone https://github.com/richfelker/musl-cross-make
cd musl-cross-make
cp /config.mak.3.musl config.mak
make
make install

mv /usr/local/$(uname -m)-linux-musl-cross-stage0/$(uname -m)-linux-musl/lib/libstdc++.so /usr/local/$(uname -m)-linux-musl-cross-stage0/$(uname -m)-linux-musl/lib/libstdc++.so.old
ln -sf /usr/local/$(uname -m)-linux-musl-cross-stage0/$(uname -m)-linux-musl/lib/libstdc++.a /usr/local/$(uname -m)-linux-musl-cross-stage0/$(uname -m)-linux-musl/lib/libstdc++.so
make clean
cp /config.mak.2.musl config.mak
make
make install

cd /usr/local
tar vcJf ./$(uname -m)-linux-musl-cross.tar.xz $(uname -m)-linux-musl-cross

mv ./$(uname -m)-linux-musl-cross.tar.xz /work/artifact/
