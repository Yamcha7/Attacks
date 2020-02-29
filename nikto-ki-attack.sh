#!/bin/bash

path=$(pwd)
read -p "Enter a name " dir
#initial_dir='$2'
mkdir $path/$dir
for i in `cat $1`
do 
	echo $i
	filename=$(echo "$i" | cut -d '/' -f 3) 
	echo $filename
	nikto -h $i | tee $path/$dir/$filename
done 
#rm filename
