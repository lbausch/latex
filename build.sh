#!/usr/bin/env bash
set -e

cd "${0%/*}"

docker build -t lbausch/latex:latest . && \
docker tag lbausch/latex:latest lbausch/latex:latest && \
docker push lbausch/latex:latest
