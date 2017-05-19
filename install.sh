#!/bin/bash

filepath=`pwd`

# define the os type, default is linux
os_type="linux"
is_macos=`echo $OSTYPE | grep -c darwin`
if [[ "$is_macos" -eq "1" ]]; then
	os_type="macos";
fi
echo "Detected OS is $os_type"

# vim
rm ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $filepath/vimrc ~/.vimrc
rm ~/.ctags
ln -s $filepath/ctags ~/.ctags
vim +PluginInstall +qall now

# shell configuration
if [[ "$os_type" == "linux" ]]; then
	sudo apt install -y zsh
	chsh -s `which zsh`
fi
# install oh my zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

rm ~/.zshrc
ln -s $filepath/zshrc ~/.zshrc
rm ~/.alias.sh
ln -s $filepath/alias.sh ~/.alias.sh
chmod 755 ~/.alias.sh

# platform specific script
if [[ "$os_type" == "macos" ]]; then
	$filepath/macos.sh
fi
if [[ "$os_type" == "linux" ]]; then
	$filepath/linux.sh
fi

# git
rm ~/.gitignore_global
ln -s $filepath/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
rm ~/gitconfig
cp $filepath/gitconfig ~/.gitconfig

