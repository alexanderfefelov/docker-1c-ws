#!/bin/sh

docker run --name 1c-ws \
  --net host \
  --detach \
  --volume 1c-ws-data:/data \
  --volume 1c-ws-httpd-conf:/usr/local/apache2/conf \
  --volume /etc/localtime:/etc/localtime:ro \
  alexanderfefelov/1c-ws
