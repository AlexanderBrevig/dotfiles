unsetopt beep
bindkey -e
zstyle :compinstall filename '/home/dev/.zshrc'

autoload -Uz compinit
compinit

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/dev/.cargo/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$HOME/github.com/neovim/build/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HISTFILE=~/.zsh_history

alias kc=kubectl
alias kx=kubectx
alias kn=kubens
alias bat=batcat
alias ls="exa --sort=type"
alias la="exa -la --sort=type --icons"
alias ip="ip -c=always"
alias grep=rg
alias fd=fdfind
. ~/.config/zsh/.z.sh
source <(kubectl completion zsh)
eval "$(starship init zsh)"
