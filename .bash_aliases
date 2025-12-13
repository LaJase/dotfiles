#        _ _____  _____
#       | |  __ \|_   _|
#       | | |__| | | |
#   _   | |  _  /  | |
#  | |__| | | \ \ _| |_
#   \____/|_|  \_\_____|
#
# All my daily aliases.

# ------------------------------------------------------------------------------
# General aliases
# ------------------------------------------------------------------------------
alias ls='eza --icons'
alias ll='eza -l --group-directories-first --icons --sort=modified'
alias tree='eza -l --tree'

alias scp='scp -q'
alias less='less -R'
alias grep='grep --color=auto'

# ------------------------------------------------------------------------------
# try something with fzf
# ------------------------------------------------------------------------------
alias vimi='vim $(fd --full-path ~/ -H -d 3 | fzf --height 50% -m --layout=reverse)'

# ==============================================================================
# Don't forget to inform this file has been sourced
# ==============================================================================
echo -e ".bash_aliases \t ok"
