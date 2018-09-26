#!/bin/bash
#UUI(){
#	local arr=({0..9} {a..f}) && local i=$1 
#	 while [ $i -gt 0 ] ;do
#		nums=$[RANDOM%16] && str=${str}${arr[$nums]} && let i--
#	done && str=$str-
#}
#UUI 8 && UUI 4 && UUI 4 && UUI 4 && UUI 12 && echo $str | sed 's/.$//'
#
#
#
#QQ(){
#	s=$1
#	 ! expr $s + 1 &>/dev/null || [ "$s" == "" ] &&	s=1
#	for i in `seq $s`;do
#		local qq=({1..33}) && count=1 
#		while :; do
#			if [ $count -eq 7 ];then
#				 local lq=({1..16})
#				 sj=$[RANDOM%16] 
#				 echo -ne "\033[34m${lq[sj]}\033[0m \n" 
#				 break 
#			else
#				sj=$[RANDOM%33] 
#				 [ "${qq[$sj]}" != "" ]&& echo -ne "\033[31m${qq[sj]}\033[0m\t" && unset qq[$sj] &&	let count++
#			fi
#		done 
#	done
#}
#QQ $1
#

#红球，传入的数值决定红球个数
R(){
	local qq=({1..33}) && count=1 
	while : ;do 
		sj=$[RANDOM%33] 
		 [ "${qq[$sj]}" != "" ]&& echo -ne "\033[31m${qq[sj]}\033[0m\t" && unset qq[$sj] &&	let count++
		[ $count -gt $1 ]&& echo && break
	done
}
#蓝球，根据传入的数值来确定蓝球个数
B(){
	local qq=({1..16}) && count=1 
	while : ;do 
		sj=$[RANDOM%16] 
		 [ "${qq[$sj]}" != "" ]&& echo -ne "\033[34m${qq[sj]}\033[0m\t" && unset qq[$sj] &&	let count++
		[ $count -gt $1 ]&& echo  && break
	done
}
#参数条件判断
[ "$1" == "-h" -o "$1" == "--help" ]&& echo -e "语法 ：\n $0 \n $0 [-b|-r]  Number [-b|-r]  Number\n $0 --help|-h" && exit
[ $# -gt 1 ]&&! expr $2 + 1 &>/dev/null || ! expr $4 + 1&>/dev/null &&	echo "参数错误 $0  [-b|-r]  Number " &&exit		

# 选项判断
if  [ "$1" == "" ] ;then
	R 6 && B 1 
elif   expr $1 + 1 &>/dev/null ;then
	for i in `seq $1`;do	
		R 6 && B 1 
	done
elif  [ "$1" == "-r" -a "$3" == "" ] ;then
	[ $2 -lt 6 -o $2 -gt 33 ] && echo "红球个数 6－33" && exit
	R $2 && B 1 
elif [ "$1" == "-r" -a "$3" == "-b" ];then
	[ $2 -lt 6 -o $2 -gt 33 ] && echo "红球个数 6－20" && exit
	[ $4 -lt 1 -o $4 -gt 16 ] && echo "蓝球个数 1－16" && exit
	R $2 && B $4
elif [ "$1" == "-b" -a "$3" == "-r" ];then
	[ $4 -lt 6 -o $4 -gt 33 ] && echo "红球个数 6－20" && exit
	[ $2 -lt 1 -o $2 -gt 16 ] && echo "蓝球个数 1－16" && exit
	B $2 && R $4
fi



#continue	持续
#break		打破
#exit		退出
#function	函数声明
#array		数组
#declare	声明
#export		出口
#source		来源
