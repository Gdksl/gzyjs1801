#!/bin/bash
#mkdir /haowan &>/dev/null
cd /haowan
#chh=({0..9} {A..Z} {a..z})
#for i in {1..10};do
#	sj=$[RANDOM%62]
#	str=${str}${chh[sj]}
#done
#touch ${str}.html

#for i in `ls`;do
#	str=`echo $i | awk -F "." '{print $1}'`
#	mv $i ${str}.HTML
#done


zone_str=`awk -F "e" '{list[$0]=$0}END{for(i in list){print list[i]}}' zone.list`
for i in $zone_str;do
#	[ ${count_list[$i]} -eq $i ]&>/dev/null && continue
#	count_list[$i]=$i
	sed 's/100/'$i'/g'  <temp.conf   >>master.conf
done
