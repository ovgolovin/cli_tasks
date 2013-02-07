#!/usr/bin/env bash

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
		echo "Log plotter"
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


grep  "$date\s12.*\/resume" "$file"| cut -f 1,2,8 | sed -E "s/(.*)ms/\1/"|  awk '{print $1 " " $2 " =resume " $3}' >plot_data~
grep  "$date\s12.*\/vacancy" "$file"| cut -f 1,2,8 | sed -E "s/(.*)ms/\1/"|  awk '{print $1 " " $2 " =vacancy " $3}' >>plot_data~
grep  "$date\s12.*\/user" "$file"| cut -f 1,2,8 | sed -E "s/(.*)ms/\1/"|   awk '{print $1 " " $2 " =user " $3}' >>plot_data~

tplot -if plot_data~ -or 1280x1024 -of png -o quantile_plot_95.png -dk 'within[-] quantile 600 0.95'

rm plot_data~



