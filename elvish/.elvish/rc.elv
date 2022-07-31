use github.com/zzamboni/elvish-modules/alias

set paths = [
  $@paths
  /usr/local/ho/bin
  ~/.cargo/bin
  ~/go/bin
  ~/.local/bin
]

eval (starship init elvish)
