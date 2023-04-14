set -Ux SHELL fish 
set -Ux EDITOR hx 
set -Ux USE_GKE_GCLOUD_AUTH_PLUGIN True
set -Ux KUBE_CONFIG_PATH ~/.kube/config
set -Ux KUBECONFIG ~/.kube/config

fish_add_path ~/.cargo/bin
fish_add_path ~/github.com/picotool/build
fish_add_path ~/tools/cloud-sql-proxy/
fish_add_path ~/.asdf/shims

function fish_greeting
end

function page
    cat $argv | gum format -t markdown | gum pager
end

# Abbreviations
abbr --add --global -- kc 'kubectl'
abbr --add --global -- kx 'kubectx'
abbr --add --global -- kn 'kubens'

# Aliases
alias ku 'kubectl config unset current-context'
alias la 'exa --sort=type --icons --long --all --links --git'
alias ls 'exa --sort=type --icons'
alias netshoot 'kubectl run -n default -i --rm --tty netshoot --image=nicolaka/netshoot  -- /bin/bash'

bind \co '__zoxide_zi; commandline -f repaint'

set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

source /opt/asdf-vm/asdf.fish
source '/home/alexander/tools/google-cloud-sdk/path.fish.inc'

zoxide init fish  | source

starship init fish | source


