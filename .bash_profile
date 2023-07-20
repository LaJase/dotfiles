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
if [ -d "/mnt/c/Users/jrichier/bin" ]; then
	PATH="${PATH}:/mnt/c/Users/jrichier/bin"
fi

# Path needed fo GO
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:${GOPATH}/bin

# init zoxide
eval "$(zoxide init bash --cmd cd)"

# use starship prompt
eval "$(starship init bash)"

# ------------------------------------------------------------------------------
# Setup fzf
# ------------------------------------------------------------------------------
if [[ ! "$PATH" == ${HOME}/perso/fzf/bin ]]; then
	PATH="${PATH:+${PATH}:}${HOME}/perso/fzf/bin"

	# Auto-completion
	[[ $- == *i* ]] && source "/home/jrichier/perso/fzf/shell/completion.bash" 2>/dev/null

	# Key bindings
	source "/home/jrichier/perso/fzf/shell/key-bindings.bash"
fi

# ------------------------------------------------------------------------------
# exports
# ------------------------------------------------------------------------------
export EDITOR=vim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Needed for cargo binaries
. "$HOME/.cargo/env"

# ------------------------------------------------------------------------------
# Don't forget to inform this file has been sourced
# ------------------------------------------------------------------------------
echo -e ".bash_profile \t ok"
