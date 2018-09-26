#!/bin/bash
#i=1
#while [ $i -le 10 ];do
#	num=$((RANDOM%1000))
#	let aa[num]=$i
#	let i++
#done
#echo ${aa[*]}
#while [ $i -le 10 ];do
#	num=$((RANDOM%10+1))
#	let aa[i]=$num
#	let i++
#done
#echo ${aa[*]}
for ((i=0;i<10;i++));do
	let arr[i]=i+1
done 
i=0
while :;do
	num=$((RANDOM%10))
	echo -n ${arr[num]}" "
	let i++ && [ $i -eq 10 ] && break 
done
echo
