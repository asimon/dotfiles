# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

export HISTFILESIZE=9001

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
PS1="\[\e[1m\]\u@\h\[\e[m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] $(promptstatus=$?; if [[ $promptstatus == 0 ]]; then echo "\[\e[1;37;42m\] OK "; else echo "\[\e[1;37;41m\] [$promptstatus] "; fi; unset promptstatus)\[\e[00m\] \w\[\e[1;34m\]\$\[\e[m\] "
PS2='\[\e[1;33;41m\] \342\230\255 \[\e[m\] '
PS1="$PS1\[\a\]"

eval `dircolors -b ~/.dircolors`

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# For i3-sensible-terminal
# Konsole has a bug and doesn't reset the title when exiting a ssh or su session
export TERMINAL=gnome-terminal


