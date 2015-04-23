#!/bin/sh

filepath=`pwd`

#vim
rm ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $filepath/vimrc ~/.vimrc
rm ~/.ctags
ln -s $filepath/ctags ~/.ctags

#zsh
rm ~/.zshrc
ln -s $filepath/zshrc ~/.zshrc

#git
rm ~/.gitignore_global
ln -s $filepath/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
rm ~/gitconfig
ln -s $filepath/gitconfig ~/.gitconfig
