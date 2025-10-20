#!/bin/bash

# This is for and while loops
<<comment
1 is argument 1 which is folder name
2 is start range
3 is end range
comment

for ((i=$2; i<=$3; i++))
do
mkdir  "$1$i"
done

echo "here are your 5 directory which created with for loop"
