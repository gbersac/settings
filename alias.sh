alias gita="git add -A"
alias gitc="git commit -m "
alias gitac="git add -A; git commit -m "
alias gitki="git stash --keep-index --include-untracked"
alias gits="git status -sb"

# Commit current work as wip so that I can switch branch
function gitwip {
	git add -A && git commit -m wip
}

# Reset last commit if it is a work in progress
function gitrwip {
   lastCommitMessage=`git log --oneline -n1 | awk '{$1= ""; print $0}'`
   lastCommitMessage=${lastCommitMessage:1:30}
   [ "$lastCommitMessage" = wip ] && git reset HEAD~1 || echo "#$lastCommitMessage#[...]" is not a wip commit
}

alias grep='grep --color=auto --exclude-dir=\.git'
alias fgrep='fgrep --color=auto --exclude-dir=\.git'
alias egrep='egrep --color=auto --exclude-dir=\.git'

alias vi='vim'

alias la='ls -FaG '
alias lla='ls -FlaG '
alias l='ls -FaG '
alias ls='ls -FG '
alias ll='ls -FlG '
