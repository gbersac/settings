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
# setopt prompt_subst
PROMPT='${ret_status} %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'

source ~/.alias.sh
. /Users/gbe/.nix-profile/etc/profile.d/nix.sh
source $HOME/settings/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.yarn/bin:$PATH"
