#!/bin/bash

#设置的文件夹要带/，将路径限制，否在会自动再创建一级目录
src=$1
desk=$2
# m 实时监测 r 递归监测 q仅打印监控事件的信息 e监控事件 format自定义输出格式 %w显示被监控文件的文件名  %f如果监控文件为目录，则显示被监控目录的名字 %xe打印文件变化类型
inotifywait -mrq --format '%Xe %w%f' -e modify,create,close_write,delete,move,attrib $1 |while read file
do
	 echo $file	
#	--delete  参数表示是否需要删除desk中src不存在的文件
#	a 归档压缩模式，递归的方式传输文件并保持所有文件的属性相同
#	z 传输过程中进行压缩
#	v 打印版本号
#	R 使用相对路径信息
#	i 可以设置 从指定文件中读取需要包含的文件  配置需要同步的数据类型
    rsync -azvR --log-file=sync.log --log-file-format=FMT  $src $desk
	date>date
	scp ./date $desk/
done
