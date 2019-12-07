#!/bin/bash
echo "*********************************************************************"
echo "*************************YAMCHA'S  SPIRIT BALL***********************"
echo "**********************************************************************"

read -p "Enter the domain : " domain
echo "[+] Collecting energy ......"
path=$(pwd)
#Date creation
NOW=$(date +"%F")

echo "[+] Concentrating the energy in a single place....."
#echo "$domain-recon_$NOW"
initial_dir_name="$domain-recon_$NOW"
screenshot_dir_name="$domain-screenshots_$NOW"
echo $initial_dir_name
mkdir $path/$initial_dir_name
mkdir $path/$initial_dir_name/$screenshot_dir_name

echo "[+] Starting the spirit ball"

echo "*************************HTTP PROBE*****************************"
filename="$domain-probe"
#touch $path/$initial_dir_name/$filename
cat $1 | httprobe | tee $path/$initial_dir_name/$filename
echo "************************Screenshots*****************************"
echo "[+] Attack Spirit Ball Attack"
python /root/BugsBount/webscreenshot/webscreenshot.py -i $path/$initial_dir_name/$filename -o $path/$initial_dir_name/$screenshot_dir_name -r chromium -v 
