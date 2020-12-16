export SONAR_SCANNER_HOME="/opt/sonar-scanner"
export PATH="${PATH}:${SONAR_SCANNER_HOME}/bin"

source ~/.profile
#source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#if [ /usr/bin/kubectl ]; then source <(kubectl completion zsh); fi

# Aliases for zsh
alias kc=kubectl
alias kx=kubectx
alias kcg=kubectl config get-contexts
alias kcc=kubectl config current-context
alias kcv=kubectl config view
alias vim=nvim
alias dockerstart='sudo systemctl start docker.service && sudo systemctl enable docker.service'
alias pgstart='sudo systemctl enable --now postgresql.service'
alias psql='sudo -i -u postgres psql'

export KUBE_PS1_PREFIX=' '
export KUBE_PS1_SUFFIX=''
export KUBE_PS1_COLOR_SYMBOL="%F{cyan}"
export KUBE_PS1_COLOR_CONTEXT="%F{cyan}"
export KUBE_PS1_COLOR_NS="%F{magenta}"
PROMPT='$(kube_ps1) $(tf_prompt_info) %f'$PROMPT

function kpods {
    if [[ "x" == "x$1" ]] ; then
        kubectl get pods -o wide 
    else
        kubectl get pods -o wide | grep "^$1"
    fi
}

function rgkill {
    kill $(ps aux | rg "$1" | rg -v 'grep' | awk '{print $2}')
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
