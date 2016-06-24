#!/bin/bash
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

imageName=huangyingw/dbuntu
~/loadrc/dockerrc/killContainer.sh "$imageName"
docker build -f Dockerfile -t "$imageName" .
docker run \
  --net=host \
  -v ~/Dropbox/loadrc:/root/loadrc \
  -v ~/Dropbox/loadrc/.bashrc:/root/.bashrc \
  -d "$imageName"

cd -
