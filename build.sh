#!/bin/bash - 
imageName="$1"
docker build -f Dockerfile -t "$imageName" .
