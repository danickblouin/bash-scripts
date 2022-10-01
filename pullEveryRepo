#!/bin/sh

for d in */ ; do
	echo "$d"
	
	cd $d
	if [ -d .git ]; then
		echo "Pulling...";
		git pull
	else
		for i in */ ; do
			echo "$d $i"
			cd $i
			if [ -d .git ]; then
				echo "Pulling...";
				git pull
			else
				echo "Not a git directory"
			fi
			cd ..
		done
	fi

	cd ..
done
