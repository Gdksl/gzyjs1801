#!/bin/bash
i=0
until [ $i -eq 10 ] ;do
	let i++
#	if id user$i &>/dev/null ;then
#		echo "user$i,yes"
#		continue
#	fi
	userdel -r user$i
done
