#!/bin/sh
IO_DEBUG_DEV=gbit  /root/AuxTest  -m 7c80 -s 202 -f 0 -c 1 -i 1 -R 0x418 -w "1"
IO_DEBUG_DEV=gbit  /root/AuxTest  -m 7c80 -s 202 -f 0 -c 1 -i 1 -R 0x418 -w "0"
IO_DEBUG_DEV=gbit  /root/AuxTest  -m 7c80 -s 202 -f 0 -c 100000 -i 1 -R 0x410 -r 4
