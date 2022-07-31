use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/builtins
use github.com/zzamboni/elvish-completions/git

set paths = [
  $@paths
  /usr/local/ho/bin
  ~/.cargo/bin
  ~/go/bin
  ~/.local/bin
]

fn ls {|@_args|  exa --sort=type --icons $@_args }
fn la {|@_args|  exa -la --sort=type --icons $@_args }
fn tree {|@_args|  exa --tree $@_args }
fn bat {|@_args|  batcat $@_args }
fn kx {|@_args|  kubectx $@_args }
fn kc {|@_args|  kubectl $@_args }
fn kn {|@_args|  kubens $@_args }
fn ku {|@_args|  kubectl config unset current-context $@_args }

eval (starship init elvish)
