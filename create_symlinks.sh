#!/bin/sh

for file in `find ${PWD} -maxdepth 1 -not -name '.*' -not -name README -not -name create_symlinks.sh -not -name bin -not -name config -type f`; do
filename=`basename "$file"`
	echo "ln -s `pwd`/$filename -> ~/.$filename"
	ln -s `pwd`/$filename ~/.$filename
done

mkdir -p ~/bin/
for file in `find ${PWD}/bin/ -maxdepth 1 -not -name '.*' -not -name bin`; do
	filename=`basename "$file"`
	echo "ln -s `pwd`/bin/$filename -> ~/bin/$filename"
	ln -s `pwd`/bin/$filename ~/bin/$filename
done

mkdir -p ~/.config/
for file in `find ${PWD}/config/ -maxdepth 1 -not -name '.*' -not -name config`; do
	filename=`basename "$file"`
	echo "ln -s `pwd`/config/$filename -> ~/.config/$filename"
	ln -s `pwd`/config/$filename ~/.config/$filename
done

