#############################################################################
###
###   .profile
###
#############################################################################
#
# Execution du .profile general
#
#
. /devt/conf/.profile
# Execution du .profile commun au service
#
#
#export PATH=$CDTNG_BIN:$PATH
. $DIR_GROUP/.profile

#export SHELL=/bin/ksh
#export SSHELL=/bin/ksh
export PATH=$CDTNG_BIN:$PATH
#################################### fin ####################################

# environment
dotfileFolder=~/dotfiles

source ${dotfileFolder}/.bashrc
source ${dotfileFolder}/.alias
source ${dotfileFolder}/.custom_functions
