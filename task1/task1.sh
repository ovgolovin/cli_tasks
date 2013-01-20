#!/bin/bash

function readAndDisplay {
	IFS=$'\n'
	files=($(find . -maxdepth 1 -name "*.txt"))
	IFS=$OIFS
	length=${#files[@]}

	if [ "$length" == "0" ]
	then
		echo "There are no *.txt file in the directory specified. Terminating."
		exit
	fi
	
	echo ""
	echo "File list:"
	i=0
	for file in "${files[@]}"
	do
		let i++
		echo "$i. `basename $file`"
	done

}

function displayHelp {
	echo "Run this program to list *.txt files in the current directory."
	echo "Then this script will ask to chose the file to display first ten lines of".
	echo "It all will be in interactive manner. Just try! You won't regret!"
}

for parameter in "$@"
do
	if [ "$parameter" == '--help' ]
	then
		displayHelp
		exit
	fi
done


while true
do
	readAndDisplay

	echo ""	
	echo "Input the number of file 10 first lines of which to display. To exit input 'q'"
	read input

	if [ "$input" == "q" ]
	then
		exit
	elif [[ "$input" =~ ^[0-9]+$ ]]  && [ "$input" -gt 0 ] && [ "$input" -le $length ]
	then
		let idx=input-1
		echo `head "${files[$idx]}" -n10`
	else
		echo "Wrong input. Try again."
	fi
	
done