#!/bin/sh
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
if [ ! -d ~/.fonts ]; then
    mkdir ~/.fonts
fi
cp ~/dotfiles/MyricaM.TTC ~/.fonts
if [ ! -d ~/.vim/colors ]; then
    mkdir ~/.vim/colors
    cp ./molokai.vim ~/.vim/colors
fi
cp  ~/dotfiles/.vimrc ~/

