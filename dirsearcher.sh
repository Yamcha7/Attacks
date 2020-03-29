
#!/bin/bash

#dirsearcher urllist iteration no.of files wordlist

path=$(pwd)
dirname="$1-dirsearcher"
mkdir $dirname
#counter=0
#url=`cat $1 | wc -l`
#files=`expr $url / $2`
#remain=`expr $url % $2`
#echo $files
#echo $url
#echo $remain


counter_file=1
counter_url=0
filename="file-$counter_file"
touch $path/$dirname/$filename

for i in `cat $1`
do
	echo $i | tee -a $path/$dirname/$filename
	python3 /root/ScoutTower/dirsearch/dirsearch.py  -u $i -e / -w /root/ScoutTower/dirsearch/ak.txt -t 1000 -b | tee -a $path/$dirname/$filename
	
	counter_url=`expr $counter_url + 1`
	#echo $counter_url	
	if [[ $counter_url == $2 ]]
	then 
		#echo "yesy"
		counter_file=`expr $counter_file + 1`
		filename="file-$counter_file"
		touch $path/$dirname/$filename
		counter_url=0
	fi
done
