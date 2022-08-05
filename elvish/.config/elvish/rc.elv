use asdf _asdf; var asdf~ = $_asdf:asdf~

set paths = [
  $@paths
  /usr/local/ho/bin
  ~/.cargo/bin
  ~/go/bin
  ~/.local/bin
  ~/.roswell/bin
  /opt/asdf-vm/bin
]

set E:KUBE_CONFIG_PATH = ~/.kube/config

fn ls {|@_args|  exa --sort=type --icons $@_args }
fn la {|@_args|  exa -la --sort=type --icons $@_args }
fn tree {|@_args|  exa --tree $@_args }
fn kx {|@_args|  kubectx $@_args }
fn kc {|@_args|  kubectl $@_args }
fn kn {|@_args|  kubens $@_args }
fn ku {|@_args|  kubectl config unset current-context $@_args }
fn icat {|@_args|  kitty +kitten icat $@_args }

fn fork_up {|@_args| {
  git checkout $@_args
  git fetch upstream $@_args
  git merge upstream/$@_args
}}

eval (carapace _carapace|slurp)
eval (starship init elvish)

clear
script --flush --quiet --return /tmp/tw-output.txt --command "task next"
