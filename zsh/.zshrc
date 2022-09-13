unsetopt beep
bindkey -e
zstyle :compinstall filename '/home/dev/.zshrc'

autoload -Uz compinit; compinit; _comp_options+=(globdots;)

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:~/.local/bin
export PATH="$HOME/github.com/neovim/build/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias kc=kubectl
alias kx=kubectx
alias kn=kubens
alias ku="kubectl config unset current-context"
alias netshoot="kubectl run -n metrics -i --rm --tty netshoot --image=nicolaka/netshoot  -- /bin/bash"
alias em="emacs -nw"
alias emd="emacs --daemon"
alias emc=emacsclient
alias bat=batcat
alias ls="exa --sort=type --icons"
alias la="exa -la --sort=type --icons"
alias tree="exa --tree"
alias ip="ip -c=always"
alias fd=fdfind

. ~/.z.sh
source <(kubectl completion zsh)
source $HOME/.asdf/asdf.sh

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Peco
# History
# https://github.com/krfl/dotfiles/blob/master/zsh/zshrc
function peco-history() {
  fc -ln 1 | peco | read foo
  if [ -n "$foo" ]
  then
    zle kill-whole-line
    zle -U "$foo"
    zle -R
  fi
}
zle -N peco-history
bindkey '^R' peco-history

# Recent directories
function peco-dirs() {
  z | tac | awk '{print $2}' | peco | read foo
  foo="${foo##* }"
  if [ -n "$foo" ]
  then
    cd "$foo"
    zle -R
  fi
}
zle -N peco-dirs
bindkey '^L' peco-dirs

# Prompt
eval "$(starship init zsh)"
