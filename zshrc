plugins=(git)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="robbyrussell"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# History
HISTFILE=~/.zshrc_history
SAVEHIST=5000
HISTSIZE=5000
export HIST_IGNORE_ALL_DUPS
setopt inc_append_history
setopt share_history

if [[ -f ~/.myzshrc ]]; then
  source ~/.myzshrc
fi

USER=`/usr/bin/whoami`
export USER
GROUP=`/usr/bin/id -gn $user`
export GROUP
MAIL="bersac_1@hotmail.fr"
export MAIL

# to have the ability to change directory without typing `cd`
setopt autocd

# prompt
function prompt_git_branch() {
	echo `git status 2> /dev/null | grep "On branch" | cut -c 11-`
}

function prompt_git_has_changes() {
	if [[ `git status --porcelain 2> /dev/null | grep -v 'fatal: Not a git repository'` ]]; then
	  echo 1
	else
	  echo 0
	fi
}

function prompt_git_has_changes_str() {
	if [[ $(prompt_git_has_changes) == 1 ]]; then
	  echo "∆"
	else
	  echo ""
	fi
}

function prompt_get_pwd() {
  echo "${PWD/$HOME/~}"
}

function prompt_put_spacing() {
	# calculate blanck space
	local pwd_length=`prompt_get_pwd | wc -m | tr -d ' '`
	# echo pwd_length $pwd_length
	local branch_length=`prompt_git_branch | wc -m | tr -d ' '`
	# echo branch_length $branch_length
	local termwidth=`expr $COLUMNS - $pwd_length - $branch_length - 21 - $(prompt_git_has_changes)`
	# echo $termwidth
	local spacing=""
	for i in {1..$termwidth}; do
		spacing="${spacing} "
	done
	echo $spacing
}

PROMPT='$BG[236]%(?:%{$fg_bold[green]%}● :%{$fg_bold[red]%}● ) $FG[003]%D{%d/%m/%Y %H:%M} %{$fg[cyan]%}$(prompt_get_pwd) $(prompt_put_spacing) $FG[010]$(prompt_git_has_changes_str) $FG[001]$(prompt_git_branch)
$BG[236]$FG[005]➤  $reset_color'

source ~/.alias.sh
. /Users/gbe/.nix-profile/etc/profile.d/nix.sh
source $HOME/settings/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.yarn/bin:$PATH"
