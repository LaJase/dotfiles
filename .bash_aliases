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
alias ls='ls --color=auto'
alias ll='ls -lFrt'
alias scp='scp -q'
alias lrt='ls -rt'
alias la='ls -alrt'
alias less='less -R'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ------------------------------------------------------------------------------
# Git aliases
# ------------------------------------------------------------------------------
alias lg1="git fetch --prune && git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) -%C(bold yellow)%d%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias lg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

# ------------------------------------------------------------------------------
# docker aliases
# ------------------------------------------------------------------------------
alias docker-service='sudo service docker'

# ------------------------------------------------------------------------------
# try something with fzf
# ------------------------------------------------------------------------------
alias vimi='vim $(fd --full-path /home/jrichier -H -d 3 | fzf --height 50% -m --layout=reverse)'

# ==============================================================================
# Don't forget to inform this file has been sourced
# ==============================================================================
echo -e ".alias \t\t\tfile from ${USER} loaded"
