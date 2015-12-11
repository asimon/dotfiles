# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

export HISTFILESIZE=9001

find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="⎇ $branch"
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty='✘'
  else
    git_dirty=''
  fi
}

get_return_code() {
    promptstatus=$?
}

PROMPT_COMMAND="get_return_code; find_git_branch; find_git_dirty"

PS1="\[\e[0;40;37m\]\u@\h\[\e[102;30m\]▶\[\e[102;37m\] \$git_branch \[\e[37m\]\$git_dirty \[\e[00m\]\[\e[104;92m\]▶\[\e[104;37m\] \w \$(if [[ \$promptstatus == 0 ]]; then echo \"\[\e[47;94m\]▶\[\e[0;47;36m\] OK \"; else echo \"\[\e[47;94m\]▶\[\e[1;47;31m\] \$promptstatus \"; fi)\[\e[0;0;37m\]▶\[\e[m\] "
PS2='\[\e[1;33;41m\] \342\230\255 \[\e[m\] '
PS1="$PS1\[\a\]"

eval `dircolors -b ~/.dircolors`

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# For i3-sensible-terminal
# Konsole has a bug and doesn't reset the title when exiting a ssh or su session
export TERMINAL=konsole

# For systemd/User
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

