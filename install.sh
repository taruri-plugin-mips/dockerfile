#!/bin/bash

# check if the system is x86_64
if [ "$(uname -m)" != "x86_64" ]; then
    echo "Error: The system is not x86_64"
    exit
fi

# install qemu
apt update && apt install -y --no-install-recommends binfmt-support qemu-user-static

# run multiarch/qemu-user-static open qemu function
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

# remove docker.images.txt
rm -f docker.images.txt

# create docker.images.txt
touch docker.images.txt

# build images
for dir in */; do
    clean_name=$(echo "${dir%%/}" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -cd '[:alnum:]_-')

    if [ -f "$dir/Dockerfile" ]; then
        echo "TIP: Building Docker image for directory: $dir"
        docker build -t tuari-debian:"$clean_name" "$dir" || {
            echo "ERROR: Failed to build image for $dir"
            continue
        }
        echo tuari-debian:"$clean_name" >> ./docker.images.txt
    else
        echo "WARNING: No Dockerfile found in $dir. Skipping..."
    fi
done
