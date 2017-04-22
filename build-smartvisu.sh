#!/bin/bash

if [[ -z "$1" ]]; then
    VERSION=2.8
else
    VERSION=$1
fi

docker build --rm --build-arg SHNG_SMARTVISU_BRANCH=v$VERSION -t foxi352/smartvisu:$VERSION --file Dockerfile.smartvisu .
