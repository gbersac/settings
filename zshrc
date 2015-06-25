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
MAIL="$USER@student.42.fr"
export MAIL

#personal zshrc
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
	hg root >/dev/null 2>/dev/null && echo '☿' && return
	echo '○'
}
export PS1=$'\e[34m%~ %#\e[0m '
export EDITOR='subl -w'
export HIST_IGNORE_ALL_DUPS
setopt autocd

export PATH="/Volumes/Data/nfs/zfs-student-2/users/2013/gbersac/.brew/bin:$PATH"
export PATH="/Volumes/Data/nfs/zfs-student-2/users/2013/gbersac/.brew/include:$PATH"
export PATH="/Volumes/Data/nfs/zfs-student-2/users/2013/gbersac/progs:$PATH"
export PATH="/nfs/zfs-student-2/users/2013/gbersac/progs/rust-all/bin:$PATH"
export PATH="/nfs/zfs-student-3/users/2013/gbersac/.brew/lib:$PATH"
export DYLD_LIBRARY_PATH="/nfs/zfs-student-3/users/2013/gbersac/.brew/lib:$DYLD_LIBRARY_PATH"
export HOMEBREW_CACHE="~/.homebrew/Library/Formula"

# for 42cv project
export CV_DIR="/nfs/zfs-student-3/users/2013/gbersac/project/42cv_repo"
export CV_PATH="/nfs/zfs-student-3/users/2013/gbersac/project/42cv_repo"

alias la="ls -Ga "
alias lla="ls -Gla "
alias l="ls -Ga "
alias ls="ls -G "
alias ll="ls -Gl "

alias gits="git status "
alias vi="vim"
alias gita="git add -A"
alias gitc="git commit -m "
alias gitac="git add -A; git commit -m "
alias subl="/Applications/Sublime\ Text\ 3.app/Contents/SharedSupport/bin/subl "
alias class="python ~/progs/cpp_class_generator/main.py "
alias nasm+="~/.brew/bin/nasm -f macho64"
