#!/bin/bash

echo "create key"
#自动配置免密登录，方便之后的数据同步
#$1 desk ip

export ip=$1
export key_path=/root/.ssh/

/usr/bin/expect <<\EOF
set timeouit 1
spawn ssh-keygen

expect 	"save"
send "\r"

expect {
	"Overwrite" {send "y\r";exp_continue;}
	"passphrase" {send "\r"}
}

expect "*passphrase*"
send "\r"

expect "passphrase"
send "\r"

#加一条指令，等待密钥生成完成
expect {
#	timeout(exit 127)
}

set timeouit 3
spawn ssh-copy-id -i $env(key_path)id_rsa.pub root@$env(ip) -o PubkeyAuthentication=no
expect {
	"continue" {send "yes\r";exp_continue;}
	"password" {send "123456\r"}
}
expect eof

#set timeouit 3
#expect "password" 
#send "123456\r"

EOF
