Using Vim, Pathogen and Git
===========================


Useful references:

Turning Vim into a modern Python IDE
http://sontek.net/turningivim-into-a-modern-python-ide

The Modern Vim Config with Pathogen
http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen

Synchronizing plugins with git submodules and pathogen
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

(1) create a Git repo
cd vimfiles
git init


(2) make an initial commit
git add .
git commit -m "Initial commit"


(3) Add vim plugins as git submodules

cd ~/.vim
mkdir ~/.vim/bundle
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."



(4) Push to Github

git push origin master



(5) Installation:

    git clone git@github.com:bmacauley/dotfiles.git ~/.vim

Create symlinks:

    ln -s ~/.vim/.vimrc ~/.vimrc

Switch to the `~/.vimfiles` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update


(6) update submodules

git submodule foreach git pull origin master

(7) delete submodules

Delete the relevant line from the .gitmodules file.
Delete the relevant section from .git/config.
Run git rm --cached path_to_submodule (no trailing slash).
Commit and delete the now untracked submodule files.

