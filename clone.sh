#!/bin/bash

if [[ $# -eq 0 ]]
then
	echo "Error - required positional argument Prefix not given"
	exit 1
fi

[[ ! -d "hg" ]] && mkdir hg
while read -r repo
do
	echo "Cloning ssh://hg@bitbucket.org/$1/$repo\n\n"
	hg clone "ssh://hg@bitbucket.org/$1/$repo" "hg/$repo"

done < "repositories.txt"

#popd
