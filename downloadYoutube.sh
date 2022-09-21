#/bin/bash
#Script to download youtube videos from a txt files full of youtube links

#input=url.txt

cat url.txt | while read line
do
	youtube-dl $line --format mp4
done
