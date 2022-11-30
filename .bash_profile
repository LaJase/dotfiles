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

# Path needed fo GO and so for docker... At least I hope
export PATH=$PATH:/usr/local/go/bin

# ------------------------------------------------------------------------------
#                                Prompt creation
# ------------------------------------------------------------------------------
DULL=0

FG_RED=31
FG_GREEN=32
FG_YELLOW=33
FG_BLUE=34
FG_BLACK=30
FG_WHITE=37
FG_NULL=00

ESC="\033"
NORMAL="\[${ESC}[m\]"
RESET="\[${ESC}[${DULL};${FG_WHITE};${BG_NULL}m\]"

BLACK="\[${ESC}[${DULL};${FG_BLACK}m\]"
RED="\[${ESC}[${DULL};${FG_RED}m\]"
GREEN="\[${ESC}[${DULL};${FG_GREEN}m\]"
BLUE="\[${ESC}[${DULL};${FG_BLUE}m\]"
YELLOW="\[${ESC}[${DULL};${FG_YELLOW}m\]"

#export PS1="\n\t [${RED}\u${RESET}][${YELLOW}\W${RESET}] \$(__git_ps1 '%s'):\$ "
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUPSTREAM="auto"
export PROMPT_COMMAND='__git_ps1 "\n\t [${RED}\u${RESET}][${YELLOW}\w${RESET}]" " "'
# export PS1="\n\A - \w \$(__git_ps1 'branch:%s')\n> "

# ------------------------------------------------------------------------------
# exports
# ------------------------------------------------------------------------------
export EDITOR=vim

# ------------------------------------------------------------------------------
# docker configuration
# ------------------------------------------------------------------------------
export DOCKER_HOST="unix://mnt/wsl/shared-docker/docker.sock"

# ------------------------------------------------------------------------------
# Don't forget to inform this file has been sourced
# ------------------------------------------------------------------------------
echo -e ".bash_profile \t\tfile from ${USER} loaded"

# ------------------------------------------------------------------------------
# Important to inform me if changes occurs in dotfiles managed
# ------------------------------------------------------------------------------
echo ""

if [[ 1 -le $(yadm status -s | wc -l) ]]; then
  RED='\033[0;31m'
  NC='\033[0m' # No Color
  echo -e "${RED}===================================================="
  echo -e "Changes detected in config files :"
  echo -e "====================================================${NC}"
fi
