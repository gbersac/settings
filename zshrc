#default 42.zshrc
PATH=$HOME/.brew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin
HISTFILE=~/.zshrc_history
SAVEHIST=5000
HISTSIZE=5000

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

#personal zshrc
autoload -U colors && colors
PS1="%{$fg[cyan]%}%~ %#%{$reset_color%} "
# export PS1='%~ %# '
export EDITOR='vim'
export HIST_IGNORE_ALL_DUPS
setopt autocd

export PATH="~/.brew/bin:$PATH"
export PATH="~/.brew/include:$PATH"
export PATH="~/progs:$PATH"
export PATH="~/.brew/lib:$PATH"
export DYLD_LIBRARY_PATH="~/.brew/lib:$DYLD_LIBRARY_PATH"
export HOMEBREW_CACHE="~/.homebrew/Library/Formula"

# for 42cv project
export CV_DIR="/nfs/zfs-student-3/users/2013/gbersac/project/42cv_repo"
export CV_PATH="/nfs/zfs-student-3/users/2013/gbersac/project/42cv_repo"

export EDITOR=vim

#alias
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl "
alias nasm+="~/.brew/bin/nasm -f macho64"
source ~/.alias.sh

alias la='ls -aG '
alias lla='ls -laG '
alias l='ls -aG '
alias ls='ls -G '
alias ll='ls -lG '
