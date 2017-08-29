#!/bin/bash

filepath=`pwd`
selected_shell="fish" # support fish and zsh

### define the os type, default is linux
os_type="linux"
is_macos=`echo $OSTYPE | grep -c darwin`
if [[ "$is_macos" -eq "1" ]]; then
	os_type="macos";
fi
echo "Detected OS is $os_type"

### platform specific script
if [[ "$os_type" == "macos" ]]; then
	$filepath/macos.sh
fi
if [[ "$os_type" == "linux" ]]; then
	$filepath/linux.sh
fi

### vim
rm ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $filepath/vimrc ~/.vimrc
rm ~/.ctags
ln -s $filepath/ctags ~/.ctags
vim +PluginInstall +qall now

### shell configuration
if [[ "$selected_shell" == "zsh" ]]; then
	if [[ "$os_type" == "linux" ]]; then
		sudo apt install -y zsh
		chsh -s `which zsh`
	fi
	# install oh my zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

	rm ~/.zshrc
	ln -s $filepath/zsh/zshrc ~/.zshrc
	rm ~/zsh/.alias.sh
	ln -s $filepath/zsh/alias.sh ~/.alias.sh
	chmod 755 ~/.alias.sh
elif [[ "$selected_shell" == "fish" ]]; then
	if [[ "$os_type" == "linux" ]]; then
		sudo apt-add-repository ppa:fish-shell/release-2
		sudo apt-get update
		sudo apt-get install fish
	elif [[ "$os_type" == "macos" ]]; then
		brew install fish
	fi
	curl -L https://get.oh-my.fish | fish

	mkdir ~/.config
	mkdir ~/.config/fish
	mkdir ~/.config/fish/functions
	rm ~/.config/fish/config.fish
	ln -s $filepath/fish/config.fish ~/.config/fish/config.fish
	rm ~/.config/fish/alias.fish
	ln -s $filepath/fish/alias.fish ~/.config/fish/alias.fish
	for f in $filepath/fish/functions/*; do
		rm ~/.config/fish/functions/$f
		ln -s $filepath/fish/functions/$f ~/.config/fish/functions/$f
	done
fi

### git
rm ~/.gitignore_global
ln -s $filepath/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
rm ~/gitconfig
cp $filepath/gitconfig ~/.gitconfig
