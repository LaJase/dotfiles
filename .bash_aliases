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
alias ll='ls -alF'
alias scp='scp -q'
alias lrt='ls -rt'
alias la='ls -alrt'
alias less='less -R'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ------------------------------------------------------------------------------
# alias pour git
# ------------------------------------------------------------------------------
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotadd='config add'
alias dotcommit='config commit -m'
alias dotfetch='config fetch'
alias dotpull='config pull origin'
alias dotpush='config push origin'
alias dotstatus='config status -s'
alias dotlog="config fetch --prune && config log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) -%C(bold yellow)%d%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias gs='git status -s'
alias lg1="git fetch --prune && git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) -%C(bold yellow)%d%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias lg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"


# ==============================================================================
# Don't forget to inform this file has been sourced
# ==============================================================================
echo -e ".alias \t\t\tfile from $USER loaded"
