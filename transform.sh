#!/bin/bash

[ ! -d "git" ] && mkdir git

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for repo in `ls hg`
do
	echo "Converting repository $script_dir/hg/$repo\n\n"
	mkdir $script_dir/git/$repo
	pushd $script_dir/git/$repo
	git init
	$script_dir/fast-export/hg-fast-export.sh -r $script_dir/hg/$repo --force

	popd

done

