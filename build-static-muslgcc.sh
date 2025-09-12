
#! /bin/bash

set -e

WORKSPACE=/tmp/workspace2
mkdir -p $WORKSPACE
mkdir -p /work/artifact

# musl-cross-make stage-0
cd $WORKSPACE
git clone https://github.com/richfelker/musl-cross-make
cd musl-cross-make
mv ../config.mak.3.musl config.mak
make
make install
