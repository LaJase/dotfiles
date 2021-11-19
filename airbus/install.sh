#        _ _____  _____
#       | |  __ \|_   _|
#       | | |__| | | |
#   _   | |  _  /  | |
#  | |__| | | \ \ _| |_
#   \____/|_|  \_\_____|
#
# The install file to have all my professional environment

declare -a DOTFILES=(~/.profile ~/.tmux.conf ~/.vimrc)

for item in "${DOTFILES[@]}"; do
    fileName="${item##*/}"
    echo -e "Handling $fileName file"

    echo -e "\tDeleting..."
    if test -L ${item}; then
        rm ${item}
    else
        echo -e "\tNot symbolic link, deleting can be dangerous (y/n)"
        rm -i ${item}
    fi

    echo -e "\tCeating link for ${fileName}"
    ln -s ~/dotfiles/${fileName} ${item}
done
