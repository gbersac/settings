#!/bin/bash

filepath=`pwd`

#define the os type, default is linux
os_type="linux"
is_macos=`echo $OSTYPE | grep -c darwin`
if [[ "$is_macos" -eq "1" ]]; then
	os_type="macos";
fi
echo "Detected OS is $os_type"

#vim
rm ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $filepath/vimrc ~/.vimrc
rm ~/.ctags
ln -s $filepath/ctags ~/.ctags
vim +PluginInstall +qall now

#shell configuration
if [[ "$os_type" == "macos" ]]; then
	rm ~/.zshrc
	ln -s $filepath/zshrc ~/.zshrc
elif [[ "$os_type" == "linux" ]]; then
	rm ~/.bashrc
	ln -s $filepath/bashrc ~/.bashrc
fi
rm ~/.alias.sh
ln -s $filepath/alias.sh ~/.alias.sh
chmod 700 ~/.alias.sh

#git
rm ~/.gitignore_global
ln -s $filepath/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
rm ~/gitconfig
ln -s $filepath/gitconfig ~/gitconfig

#homebrew
if [[ "$os_type" == "macos" ]]; then
	mkdir ~/.homebrew && curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C ~/.homebrew
fi
