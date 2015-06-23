#!/bin/bash

function createSymlink {
	if [ -e ~/$2 ]; then
		if [ -L ~/$2 ]; then
			echo "~/$2 already exists"
		else
			echo "WARNING: ~/$2 already exists and is no symlink!"
		fi
	else
		echo "ln -s `pwd`/$1 -> ~/$2"
		ln -s `pwd`/$1 ~/$2
	fi
}

for file in `find ${PWD} -maxdepth 1 -not -name '.*' -not -name README -not -name create_symlinks.sh -not -name bin -not -name config -type f`; do
filename=`basename "$file"`
	createSymlink $filename .$filename
done


# $1 src $2 target
function setupFolder {
	mkdir -p ~/$2/
	for file in `find ${PWD}/${1}/ -maxdepth 1 -not -name '.*' -not -name ${1}`; do
		filename=`basename "$file"`
		createSymlink "$1/$filename" "$2/$filename"
	done
}

setupFolder bin bin
setupFolder config .config
setupFolder weechat .weechat

