if test -d ~/.local/bin
    fish_add_path -g ~/.local/bin
end

if status is-interactive
    abbr -a -- la 'eza -a'
    abbr -a -- ll 'eza -l'
    abbr -a -- ls eza
    abbr -a -- vi nvim
    abbr -a -- vim nvim
    abbr -a -- .. 'cd ..'
    abbr -a -- .2 'cd ../..'
    abbr -a -- .3 'cd ../../..'
    abbr -a -- .4 'cd ../../../..'

    zoxide init fish | source
end
