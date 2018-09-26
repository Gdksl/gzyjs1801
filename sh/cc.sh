#!/bin/bash
ra=$((RANDOM%100+1))
count=6
echo "猜数字游戏"
while [ $count -gt 0 ];do
		read -p "请输入数字(${count}次)： " Nb
	if ! expr 1 + $Nb&>/dev/null ||  [ "$Nb" == "" ];then
		echo "请输入匹配数字"
		exit
	elif [ $Nb -gt 100 -o $Nb -lt 0 ];then
		echo "不能大于100，小于0"
		exit
	elif [ $Nb -eq $ra ];then
		echo "答对了，又怎样？"
		exit
	elif [ $Nb -gt $ra ];then
		echo "大了"
	elif [ $Nb -lt $ra ];then
		echo "小了"
	fi
	let count--
done
