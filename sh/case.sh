#!/bin/bash
read -p "yes/no:" s
case "$s" in
yes)
	echo "yes" ;;
no)
	echo "no" ;;
*)
	echo "...." ;;
esac
