#!/bin/bash

ip=$1
#路径一定要带/否在会自动创建一级目录
path=/usr/Hseries/bin/Middleware/data/
#建立信任连接，自动创建密钥，并且将密钥发送到desk
./key.sh $ip

./sync.sh $path root@$ip:$path 
