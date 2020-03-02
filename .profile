export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/code
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/chromium

xset -b
setxkbmap no
alias dockerstart='sudo systemctl start docker.service && sudo systemctl enable docker.service'
alias pgstart='sudo systemctl enable --now postgresql.service'
alias psql='sudo -i -u postgres psql'
alias kc=kubectl
alias kx=kubectx
xmodmap ~/.Xmodmap