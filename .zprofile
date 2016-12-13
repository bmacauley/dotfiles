# Get the aliases and functions
if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,zsh_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;



# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/usr/local/sbin

export PATH

# .bash_history configuration
#erase duplicates
export HISTCONTROL=erasedups
#set history size
export HISTSIZE=10000
#when a shell session exits, append history to .bash_history
setopt  histappend

 #Postgresql environment
#export PGLIB=/usr/pgsql-9.2/lib
#export PGDATA=/var/lib/pgsql/9.2/data
#PATH=$PATH:/usr/pgsql-9.2/bin

#EDITOR
export EDITOR=/usr/bin/vim

# Mysql environment

# Oracle environment
#export TNS_ADMIN=/etc
#export ORACLE_HOME=/usr/lib/oracle/11.2
#export LD_LIBRARY_PATH=$ORACLE_HOME/client64/lib
#PATH=$PATH:$HOME/bin:/sbin:$ORACLE_HOME/client64/bin

# Go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
#gvm - GO
#[[ -s "/Users/bmacauley/.gvm/scripts/gvm" ]] && source "/Users/bmacauley/.gvm/scripts/gvm"

# ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


#python
# python virtualenv

#activate virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs

if [ `uname` = "Darwin" ]; then
    source /usr/local/bin/virtualenvwrapper.sh
elif [ "$(expr substr `uname -s` 1 5)" = "Linux" ]; then
    source /usr/bin/virtualenvwrapper.sh
elif [ "$(expr substr `uname -s` 1 10)" = "MINGW32_NT" ]; then
    source /usr/bin/virtualenvwrapper.sh
fi

# Brew
export PATH=/usr/local/sbin:$PATH

# Tmuxinator
#source ~/.bin/tmuxinator.bash