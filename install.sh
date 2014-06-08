# dotfiles install script
dotfiles="$HOME/.dotfiles"

echo " Installing/updating dotfiles...\n"



function lnif() {
    if [ ! -e $2 ]; then
        ln -s $1 $2
    fi
}



if [ ! -e $dotfiles/.git ]; then
    echo "Cloning dotfiles\n"
    git clone https://github.com/bmacauley/dotfiles.git $dotfiles
else
    echo "Updating dotfiles\n"
    cd $dotfiles && git pull
fi

# bash
echo "Setting up bash...\n"
lnif $dotfiles/.bash_profile $HOME/.bash_profile
lnif $dotfiles/.bashrc $HOME/.bashrc 

# vim
echo "Setting up vim...\n"
lnif $dotfiles/.vimrc $HOME/.bashrc 

# tmux
echo "Setting up tmux..."
lnif $dotfiles/.tmux.conf $HOME/.tmux.conf

#vim modules
echo "Installing vim modules"
git submodule init $dotfiles
git submodule update $dotfiles


