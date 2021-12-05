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
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

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
NORMAL="\[$ESC[m\]"
RESET="\[$ESC[${DULL};${FG_WHITE};${BG_NULL}m\]"

BLACK="\[$ESC[${DULL};${FG_BLACK}m\]"
RED="\[$ESC[${DULL};${FG_RED}m\]"
GREEN="\[$ESC[${DULL};${FG_GREEN}m\]"
BLUE="\[$ESC[${DULL};${FG_BLUE}m\]"
YELLOW="\[$ESC[${DULL};${FG_YELLOW}m\]"

export PS1="[${RED}\u${RESET}@${GREEN}\h${RESET}][${YELLOW}\W${RESET}]:\$ "

# ------------------------------------------------------------------------------
# exports
# ------------------------------------------------------------------------------
export EDITOR=nvim
