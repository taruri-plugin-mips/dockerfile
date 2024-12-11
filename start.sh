#!/bin/bash

# 将 /root/code 设置为代码仓库 也就是运行docker时 -v 的目录
mkdir -p /root/code

# 判断当前目录下是否有 docker.images.txt
if [ ! -f ./docker.images.txt ]; then
    echo "ERROR: No docker.images.txt found in current directory"
    exit
fi

# 获取当前目录下的 docker.images.txt 的内容
images=$(cat ./docker.images.txt)

# 循环 images，在docker中后台运行
for image in $images; do
    echo "TIP: Running Docker image: $image"
    docker run -d -v /root/code:/root/code --name $image_container $image tail -f /dev/null
done
