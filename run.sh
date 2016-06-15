#!/bin/bash
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

imageName=huangyingw/dbuntu
for CONTAINERID in $(docker ps|grep "$imageName"|awk '{print $1}' )
do
  docker stop "$CONTAINERID"
  docker rm "$CONTAINERID"
done
docker build -f Dockerfile -t "$imageName" .
docker run \
  --net=host \
  -v ~/Dropbox/loadrc:/root/loadrc \
  -v ~/Dropbox/loadrc/.bashrc:/root/.bashrc \
  -d "$imageName" /bin/sh -c "while true; do ping 8.8.8.8; done"

cd -
