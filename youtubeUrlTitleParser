#!/bin/bash
#Script to output a list of youtube video with their titles from a txt files full of youtube links

#input=url.txt
#output=outpux.txt

cat url.txt | while read line
do
	results=$(youtube-dl --get-title $line)
	echo "$results - $line"
done > output.txt

sort -o output.txt output.txt
