#!/bin/bash

docker build --rm --build-arg SHNG_SMARTVISU_BRANCH=develop -t foxi352/smartvisu:develop --file Dockerfile.smartvisu .
