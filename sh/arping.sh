#!/bin/bash

for i in {1..254};do
	MAC=`arping -c1 -I enp0s25  10.3.140.$i`
	[ $? -eq 0 ] && echo $MAC |sed -nr '/\[/s/(.*\[)(.*)(\].*)/\2/p' 
done
