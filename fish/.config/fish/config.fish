# ~/.config/fish/config.fish

starship init fish | source
source ~/.config/fish/functions/fish_theme.fish

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
