alias ..='cd ..'
alias ...='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'
alias rm='rm -i'
alias mv='mv -i'
alias vi='vim'
alias vim='LD_LIBRARY_PATH=/home/asimon/.rvm/rubies/default/lib:$LD_LIBRARY_PATH vimx'
alias v='vimx'
alias grep='grep --color'
#alias urxvt='urxvt256c'

alias bex='bundle exec'

alias live1='ssh deploy@bs-live-01'
alias live2='ssh deploy@bs-live-02'
alias dev1='ssh deploy@bs-dev-01'
alias dev2='ssh deploy@bs-dev-02'
alias tld1='ssh deploy@bs-tldinfo-01'
alias tld2='ssh deploy@bs-tldinfo-02'

# Set tmux window name for ssh sessions
ssh() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        tmux rename-window "$(echo $* | cut -d . -f 1)"
        command ssh "$@"
        tmux set-window-option automatic-rename "on" 1>/dev/null
    else
        command ssh "$@"
    fi
}

