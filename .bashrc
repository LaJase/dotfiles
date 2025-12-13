#        _ _____  _____
#       | |  __ \|_   _|
#       | | |__| | | |
#   _   | |  _  /  | |
#  | |__| | | \ \ _| |_
#   \____/|_|  \_\_____|
#
# Default bashrc file.

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# History
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=10000
shopt -s histappend
shopt -s checkwinsize

PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

# Window title
case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;\u@\h: \w\a\]$PS1"
  ;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# Completion
[ -f /etc/bash_completion ] && source /etc/bash_completion

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# use starship prompt
eval "$(starship init bash)"

echo -e ".bashrc \t ok"
