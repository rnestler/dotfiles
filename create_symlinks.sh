#!/bin/sh

for file in `find ${PWD} -maxdepth 1 -not -name '.*' -not -name README -not -name create_symlinks.sh -not -name bin -not -name config -type f`; do
filename=`basename "$file"`
	if [ -e ~/.$filename ]; then
		if [ -L ~/.$filename ]; then
			echo "~/.$filename already exists"
		else
			echo "WARNING: ~/.$filename already exists and is no symlink!"
		fi
	else
		echo "ln -s `pwd`/$filename -> ~/.$filename"
		ln -s `pwd`/$filename ~/.$filename
	fi
done

# $1 src $2 target
function setupFolder {
	mkdir -p ~/$2/
	for file in `find ${PWD}/${1}/ -maxdepth 1 -not -name '.*' -not -name ${1}`; do
		filename=`basename "$file"`
		if [ -e ~/$2/$filename ]; then
			if [ -L ~/$2/$filename ]; then
				echo "~/$2/$filename already exists"
			else
				echo "WARNING: ~/$2/$filename already exists and is no symlink!"
			fi
		else
			echo "ln -s `pwd`/$1/$filename -> ~/$2/$filename"
			ln -s `pwd`/$1/$filename ~/$2/$filename
		fi
	done
}

setupFolder bin bin
setupFolder config .config

