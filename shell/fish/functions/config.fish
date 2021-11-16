set USER (/usr/bin/whoami)
export USER
set GROUP (/usr/bin/id -gn $user)
export GROUP
set MAIL "bersac_1@hotmail.fr"
export MAIL

source ~/.config/fish/alias.fish
source ~/.config/fish/local.fish
