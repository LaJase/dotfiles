#        _ _____  _____
#       | |  __ \|_   _|
#       | | |__| | | |
#   _   | |  _  /  | |
#  | |__| | | \ \ _| |_
#   \____/|_|  \_\_____|
#
# Default bash profile file. Actually only avai

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# source bashrc file
if [ -f "${HOME}/.bashrc" ]; then
  . "${HOME}/.bashrc"
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ]; then
  PATH="${HOME}/bin:${PATH}"
fi
if [ -d "${HOME}/.local/bin" ]; then
  PATH="${HOME}/.local/bin:${PATH}"
fi

# Path needed fo GO
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go

# init zoxide
eval "$(zoxide init bash --cmd cd)"

# use starship prompt
eval "$(starship init bash)"

# ------------------------------------------------------------------------------
# Setup fzf
# ------------------------------------------------------------------------------
if [[ ! "$PATH" == */home/jrichier/Perso/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/jrichier/Perso/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jrichier/Perso/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/jrichier/Perso/fzf/shell/key-bindings.bash"
# ------------------------------------------------------------------------------
# exports
# ------------------------------------------------------------------------------
export EDITOR=vim

# ------------------------------------------------------------------------------
# Don't forget to inform this file has been sourced
# ------------------------------------------------------------------------------
echo -e ".bash_profile \t ok"
