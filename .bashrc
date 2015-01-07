# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

EDITOR=vimx

# User rvm for vim's ruby-dynamic
# Done per alias now
#export LD_LIBRARY_PATH=$HOME/.rvm/rubies/ruby-2.0.0-p247/lib:$LD_LIBRARY_PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

TERM=xterm-256color

