#!/bin/bash

#设置的文件夹要带/，将路径限制，否在会自动再创建一级目录
src=$1
desk=$2

inotifywait -mrq -e create,close_write,delete $1 |while read file
do
#	--delete  参数表示是否需要删除desk中src不存在的文件
#    rsync -azvi --delete $src $desk
    rsync -azvi $src $desk
	date>date
	scp ./date $desk/
done
