#!/bin/bash

function display_help {
	echo "Requires 2 parameters."
	echo "First: name of log file to process."
	echo "Second: date to make calculations to in format yyyy-mm-dd"
	echo ""
	echo "Example usage: parse_log.sh log.txt 2013-01-20"
}

for parameter in "$@"
do
	if [ "$parameter" == "--help" ]
	then
		echo "Log analyzer"
		display_help
		exit
	fi
done



if [ "$#" != 2 ]
then
	echo "Wrong number of parameters"
	display_help
	exit
fi

file="$1"
date="$2"

response_times=($(grep  "$date\s12.*\/resume.*\s200" "$file"| cut -f 8 | sed -E "s/(.*)ms/\1/" | sort))

total_time=0.0
for time in "${response_times[@]}"
do
	total_time=$(echo $total_time + $time | bc)
done
echo "Overall response time on day $date within time frame from 12:00 to 13:00 is $total_time ms"

num="${#response_times[@]}"

echo "Median response time on $date within time frame from 12:00 to 13:00 is ${response_times[$(($num / 2))]}ms"
echo "Response time's 95th quantile on $date within time frame from 12:00 to 13:00 is ${response_times[$(($num * 95 / 100))]}ms"
echo "Response time's 99th quantile on $date within time frame from 12:00 to 13:00 is ${response_times[$(($num * 99 / 100))]}ms"
