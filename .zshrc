# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/hamdi/.zshrc'

autoload -Uz compinit promptinit
promptinit 
prompt redhat
compinit

# Autocompletion arrow keys
zstyle ':completion:*' menu select

#Ansi Colors in iTerm2
export CLICOLOR=1
#Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color


