# LaJase's dotfiles
Warning : Don’t blindly use my settings unless you know what that entails
To manage it, I use git bare repositories

# How to install it from new machine
I'm not e genius and I found all info here : [Atlassian dotfiles tuto](https://www.atlassian.com/git/tutorials/dotfiles)
```shell
# Clone the git repository
git clone --bare git@github.com:LaJase/dotfiles.git $HOME/.dotfiles

# Define the alias in the current shell scope 
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Checkout the actual content from the bare repository to your home
config checkout
```

At this step you might find this issue
```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

 I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:
 ```shell
 mkdir -p .config-backup && \
 config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
 xargs -I{} mv {} .config-backup/{}

# Then re-run your checkout command
config checkout
```

If you want to avoid untracked files on git status command :
```
config config --local status.showUntrackedFiles no
```

You're done, from now on you can now type config commands to add and update your dotfiles:
```shell
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

An example of installation script could be :
```shell
git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg
function config {
    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@

}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
echo "Checked out config.";
else
echo "Backing up pre-existing dot files.";
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
