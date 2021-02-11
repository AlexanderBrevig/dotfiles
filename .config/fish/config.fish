# ~/.config/fish/config.fish

starship init fish | source
source ~/.config/fish/functions/fish_theme.fish

set -gx EDITOR vim

theme_gruvbox 'dark'

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

