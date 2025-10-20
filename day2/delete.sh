#!/bin/bash

# This script is for to remove unwanted directoy 

for (( i=$2; i<=$3; i++))
do
	rm -rf "$1$i"
done
