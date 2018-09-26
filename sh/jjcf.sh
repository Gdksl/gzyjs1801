#!/bin/bash

for i in {1..9} ;do
  for j in `seq $i`;do
    echo -ne "$j*$i=$[${j}*${i}]\t"
  done
  echo
done
