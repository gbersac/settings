export PS1="%~ %# "
export EDITOR='subl -w'
export HIST_IGNORE_ALL_DUPS
setopt autocd

export PATH="/Volumes/Data/nfs/zfs-student-2/users/2013/gbersac/.brew/bin:$PATH"
export PATH="/Volumes/Data/nfs/zfs-student-2/users/2013/gbersac/.brew/include:$PATH"
export PATH="/Volumes/Data/nfs/zfs-student-2/users/2013/gbersac/progs:$PATH"
export PATH="/nfs/zfs-student-2/users/2013/gbersac/progs/rustc-all/bin:$PATH"
export DYLD_LIBRARY_PATH="/nfs/zfs-student-2/users/2013/gbersac/progs/rustc-all/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/nfs/zfs-student-2/users/2013/gbersac/.brew/lib:$DYLD_LIBRARY_PATH"

alias la="ls -Ga "
alias l="ls -Ga "
alias ls="ls -G "
alias ll="ls -Gl "

alias gits="git status "
alias vi="vim"
alias gita="git add -A"
alias gitc="git commit -m "
alias subl="~/progs/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias class="python ~/progs/cpp_class_generator/main.py "
alias nasm+="~/.brew/bin/nasm -f macho64"
