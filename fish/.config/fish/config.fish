# ~/.config/fish/config.fish

starship init fish | source
source ~/.config/fish/functions/fish_theme.fish
source ~/.asdf/asdf.fish

fish_add_path ~/go/bin
fish_add_path ~/bin
fish_add_path ~/.emacs.d/bin

set -gx EDITOR nvim
base16-gruvbox-dark-medium

function autopython --on-variable PWD
    if test -d $PWD/.venv
        source $PWD/.venv/bin/activate.fish &
    end
end

function autoenv --on-variable PWD
    if test -d $PWD/.env
        source $PWD/.env
    end
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/alexander/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/home/alexander/Downloads/google-cloud-sdk/path.fish.inc'; end
