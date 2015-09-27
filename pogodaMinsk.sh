#!/bin/bash
# shows forecast for Minsk each 5 seconds

. ./config.ini
URL=https://pogoda.yandex.by/
while true
do
	wget $URL -q index.html
	grep -E -o '<div class="current-weather__thermometer current-weather__thermometer_type_now">[+-][0-9]{1,}' index.html > temp.txt
	RESULT=$(grep -E -o '[+-][0-9]{1,}' temp.txt)
	echo $RESULT
	rm temp.txt
	rm index.html
	sleep $time
done

