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
    git_branch=" $branch"
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

PS1="\[\e[1;40;36m\]\u@\h\[\e[44;30m\]\[\e[44;30m\] \$git_branch\[\e[37m\]\$git_dirty \[\e[00m\]\$(if [[ \$promptstatus == 0 ]]; then echo \"\[\e[42;34m\]\[\e[1;42;37m\] OK \"; else echo \"\[\e[41;34m\]\[\e[1;37;41m\] [\$promptstatus] \"; fi)\[\e[00m\] \w\[\e[1;34m\]\$\[\e[m\] "
PS2='\[\e[1;33;41m\] \342\230\255 \[\e[m\] '
PS1="$PS1\[\a\]"

eval `dircolors -b ~/.dircolors`

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# For i3-sensible-terminal
# Konsole has a bug and doesn't reset the title when exiting a ssh or su session
export TERMINAL=konsole


