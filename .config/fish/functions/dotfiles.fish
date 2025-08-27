if status is-interactive
    if type -q bat
        function dotfiles --wraps=git --description 'git alias for convinient dotfiles handling'
            git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" $argv
        end
    end
end
