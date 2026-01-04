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
alias ll='eza -l -a --group-directories-first --icons --sort=name'
alias tree='eza -l --tree'

alias scp='scp -q'
alias less='less -R'
alias grep='grep --color=auto'

# Let's give a try to bat
alias bat='batcat'
alias bathelp='bat --plain --language=help'
help() {
  "$@" --help 2>&1 | bathelp
}

# ------------------------------------------------------------------------------
# Everything needed for ollama
# ------------------------------------------------------------------------------
# This a function for ollama systemctl management
alias om-start='systemctl --user start ollama.service'
alias om-stop='systemctl --user stop ollama.service'
alias om-restart='systemctl --user restart ollama.service'
alias om-status='systemctl --user status ollama.service'
alias om-enable='systemctl --user enable ollama.service'
alias om-disable='systemctl --user disable ollama.service'
alias om-logs='journalctl --user -u ollama.service -f'

# ------------------------------------------------------------------------------
# For docker
# ------------------------------------------------------------------------------
sysdock() {
  if [ "$1" = "start" ]; then
    echo "Starting docker ..."
    sudo systemctl start docker.socket docker.service
    echo "Docker started"
  elif [ "$1" = "stop" ]; then
    echo "Stopping docker ..."
    sudo systemctl stop docker.socket docker.service
    echo "Docker stopped"
  elif [ "$1" = "status" ]; then
    sudo systemctl status docker.socket docker.service --no-pager
  else
    echo "Usage: sysdock start|stop|status"
  fi
}

# ------------------------------------------------------------------------------
# try something with fzf
# ------------------------------------------------------------------------------
alias vimi='vim $(fd --full-path ~/ -H -d 3 | fzf --height 50% -m --layout=reverse)'

# ==============================================================================
# Don't forget to inform this file has been sourced
# ==============================================================================
echo -e ".bash_aliases \t ok"
