#!/bin/bash
docker container stop musly_1 && docker container rm musly_1

docker run -it \
    --name musly_1 \
    -v /opt/musly/musics/:/data \
    -e PUID=1001 \
    -e PGID=1001 \
    musly
