# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

EDITOR=nvim

# User specific aliases and functions
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
if [ -f ~/.bash_aliases.local ]; then
  . ~/.bash_aliases.local
fi
