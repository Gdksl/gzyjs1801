#!/bin/bash
IPAA(){
	if ping -c 1 $1 &>/dev/null ;then
		echo "$1  ok"
	else 
		echo "$1  not ok"
	fi
}
for i in {52..55};do
	IPAA 10.3.140.$i
done
