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

# $1 git url $2 target
function cloneOrPull {
    target_name=$(basename $2)
    if [ -e "$2" ]; then
        echo "$target_name already exists, updating"
        git -C "$2" pull
    else
        mkdir -p $(dirname $2)
        git clone "$1" "$2"
    fi
}

setupFolder bin bin
setupFolder config .config
setupFolder weechat .weechat
setupFolder doom.d .doom.d

if [ -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "plug.vim alreadys exists"
else
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

cloneOrPull https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cloneOrPull https://github.com/powerline/fonts.git ~/projects/fonts
cloneOrPull http://aur.archlinux.org/yay.git ~/projects/archpkg/yay
cloneOrPull https://github.com/rupa/z.git ~/projects/github/z
cloneOrPull https://github.com/changyuheng/fz.git ~/projects/github/fz
