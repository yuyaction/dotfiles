#!/bin/sh
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi
if [ ! -d ~/.vim/colors ]; then
    mkdir ~/.vim/colors
    cp ./molokai.vim ~/.vim/colors
fi
ln -sf ~/dotfiles/.vimrc ~/.vimrc

