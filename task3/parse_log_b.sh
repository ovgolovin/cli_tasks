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

response_times=($(grep -E  "$date\s.*\/resume[^s+]id=43.*\s200" "$file" | cut -f 8 | sed -E "s/(.*)ms/\1/" | sort))



total_time=0.0
for time in "${response_times[@]}"
do
	total_time=$(echo $total_time + $time | bc)
done

num="${#response_times[@]}"

average=$(echo "scale=2; $total_time / $num" | bc)
echo "Average response time on $date for resume #43 is $average"
echo "Response time median value on $date for resume #43 is ${response_times[$(($num / 2))]}"

