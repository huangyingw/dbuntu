#!/bin/bash
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

imageName=huangyingw/dbuntu
~/loadrc/dockerrc/killContainer.sh "$imageName"
./build.sh "$imageName"
docker run \
  --net=host \
  -v ~/loadrc:/root/loadrc \
  -v ~/loadrc/.bashrc:/root/.bashrc \
  -d "$imageName"

cd -
