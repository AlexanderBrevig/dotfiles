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
set E:EDITOR = hx

fn ls {|@_args|  exa --sort=type --icons $@_args }
fn la {|@_args|  exa -la --sort=type --icons $@_args }
fn tree {|@_args|  exa --tree $@_args }

# kubernetes
set edit:command-abbr['kx'] = 'kubectx'
set edit:command-abbr['kc'] = 'kubectl'
set edit:command-abbr['kn'] = 'kubens'
fn kx {|@_args| kubectx $@_args }
fn kn {|@_args| kubens $@_args }
fn ku {|@_args| kubectl config unset current-context $@_args }

# git
fn gd {|@_args| git diff $@_args }
fn gf {|@_args| git fetch $@_args }
fn gp {|@_args| git pull $@_args }
set edit:command-abbr['gd'] = 'git diff'
set edit:command-abbr['gca'] = 'git commit -a'
set edit:command-abbr['gco'] = 'git checkout'

#github
fn ghpr {|@_args| gh pr list --author="@me" $@_args }

fn icat {|@_args|  kitty +kitten icat $@_args }

fn fork_up {|@_args| {
  var branch = (git branch --show-current)
  git checkout $@_args
  git fetch upstream $@_args
  git merge upstream/$@_args
  git checkout $branch
  edit:notify "Synced "$@_args
}}

fn hx_install {|@_args| {
  var cur_pwd = (pwd)
  cd ~/github.com/helix
  var branch = (git branch --show-current)
  fork_up "master"
  git checkout master
  cargo install --path helix-term
  git checkout $branch
  cd $cur_pwd
}}

eval (carapace _carapace|slurp)
eval (starship init elvish)

clear
try { task inbox } catch e { put }
