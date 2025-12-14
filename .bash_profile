#        _ _____  _____
#       | |  __ \|_   _|
#       | | |__| | | |
#   _   | |  _  /  | |
#  | |__| | | \ \ _| |_
#   \____/|_|  \_\_____|
#
# Default bash profile file.

# source bashrc file
if [ -f "${HOME}/.bashrc" ]; then
  source "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ]; then
  PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${HOME}/.local/bin" ]; then
  PATH="${HOME}/.local/bin:${PATH}"
fi

source "$HOME/.cargo/env"

# ------------------------------------------------------------------------------
# Don't forget to inform this file has been sourced
# ------------------------------------------------------------------------------
echo -e ".bash_profile \t ok"
