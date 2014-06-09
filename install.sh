# dotfiles install script
dotfiles="$HOME/.dotfiles"

echo " Installing/updating dotfiles..."



function lnif() {
    if [ ! -e $2 ]; then
        ln -s $1 $2
    fi
}



if [ ! -e $dotfiles/.git ]; then
    echo "Cloning dotfiles\n"
    git clone https://github.com/bmacauley/dotfiles.git $dotfiles
else
    echo "Updating dotfilesi"
    cd $dotfiles && git pull
fi

# bash
echo "Setting up bash..."
lnif $dotfiles/.bash_profile $HOME/.bash_profile
lnif $dotfiles/.bashrc $HOME/.bashrc 

# vim
echo "Setting up vim..."
lnif $dotfiles/.vimrc $HOME/.vimrc
lnif $dotfiles/.vim $HOME/.vim

# tmux
echo "Setting up tmux..."
lnif $dotfiles/.tmux.conf $HOME/.tmux.conf

#vim modules
echo "Installing vim modules..."
git submodule init $dotfiles
git submodule update $dotfiles


