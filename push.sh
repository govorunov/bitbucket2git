#!/bin/bash

if [[ $# -eq 0 ]]
then
	echo "Error - required positional argument Prefix not given"
	exit 1
fi

[ ! -d "git" ] && mkdir git

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for repo in `ls git`
do
	echo "Pushing repository $script_dir/git/$repo\n\n"
	pushd $script_dir/git/$repo
    git remote add origin git@gitlab.com:$1/$repo.git
	git push --all origin

	popd

done
