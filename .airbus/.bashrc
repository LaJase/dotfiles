#        _ _____  _____
#       | |  __ \|_   _|
#       | | |__| | | |
#   _   | |  _  /  | |
#  | |__| | | \ \ _| |_
#   \____/|_|  \_\_____|
#
# My bash config.

# ==============================================================================
#                                Prompt creation
# ==============================================================================
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

# Configs for history management
export HISTFILE=~/.command_history
export HISTCONTROL=ignoreboth
shopt -s histappend

# User specific aliases and functions
export EDITOR=vim

# All needed info for tmux
export LD_LIBRARY_PATH=/nas/devlog/prog/DataCollection/local/lib:$LD_LIBRARY_PATH
export PATH=/nas/devlog/prog/DataCollection/local/bin:$PATH

# permet d'avoir le compile.sh
export PATH=/home/devlog/prog/ng6e836/scripts:$PATH


# ==============================================================================
# Don't forget to inform this file has been sourced
# ==============================================================================
echo -e ".bashrc \t\tfile from $USER loaded"
