#!/bin/bash

set -euo pipefail

function createSymlink {
	if [ -e ~/"$2" ]; then
		if [ -L ~/"$2" ]; then
			echo "~/$2 already exists"
		else
			echo "WARNING: ~/$2 already exists and is no symlink!"
		fi
	else
		if [ -L ~/"$2" ]; then
			echo "WARNING: ~/$2 is a broken symlink!"
		else
			echo "ln -s $(pwd)/$1 -> ~/$2"
			ln -s "$(pwd)/$1" ~/"$2"
		fi
	fi
}

for file in `find ${PWD} -maxdepth 1 -not -name '.*' -not -name README -not -name create_symlinks.sh -not -name bin -not -name config -type f`; do
	filename=`basename "$file"`
	createSymlink $filename .$filename
done


# $1 src $2 target
function setupFolder {
	mkdir -p ~/"$2"/
	for file in `find ${PWD}/${1}/ -maxdepth 1 -not -name '.*' -not -name ${1}`; do
		filename=`basename "$file"`
		createSymlink "$1/$filename" "$2/$filename"
	done
}

setupFolder bin bin
setupFolder config .config
setupFolder weechat .weechat
setupFolder doom.d .doom.d

if [ -e ~/.vim/bundle/Vundle.vim ]; then
    echo "Vundle.vim already exits, updating"
    git -C ~/.vim/bundle/Vundle.vim pull
else
    mkdir -p ~/.vim/bundle/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

mkdir -p ~/projects

if [ -e ~/projects/fonts ]; then
    echo "Powerline fonts already here"
else
    cd ~/projects
    git clone https://github.com/powerline/fonts.git
    cd ~/projects
fi

mkdir -p ~/projects/archpkg/
if [ -e ~/projects/archpkg/yay ]; then
    echo "yay archpkg already here"
else
    (cd ~/projects/archpkg && git clone https://aur.archlinux.org/yay.git)
fi
