#!/usr/bin/env bash

. ./screen.cfg

loop() {
	while true
	do	
		time=`date +%Y-%m-%d_%H-%M-%S`
		import -window $1 "$STORAGE/$1_$screenshot_date.jpg"
		sleep $2  
 	done
}

interval_default="$DUMP_INTERVAL"

for username in ${USERS[@]}; do
	iterval_name="${username}_INTERVAL"
	interval="${!iterval_name}"
	if [[ "$interval" == "" ]]
	then
		interval="$interval_default"
    	fi
    	echo "$interval"
    	loop $username $interval & 	
done

 

 
