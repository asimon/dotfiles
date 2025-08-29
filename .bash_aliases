alias ..='cd ..'
alias ...='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias ls='eza'
alias ll='ls -l'
alias la='ls -a'
alias rm='rm -i'
alias mv='mv -i'
alias vi='nvim'
alias vim='nvim'
alias grep='grep --color=auto'
alias bex='bundle exec'

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
