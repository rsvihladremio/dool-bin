#!/bin/bash
docker run --platform=linux/amd64 -v $(pwd):/mnt -it ubuntu /mnt/out/dool
