# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

# .bash_history configuration
#erase duplicates
export HISTCONTROL=erasedups
#set history size
export HISTSIZE=10000
#when a shell session exits, apend history to .bash_history
shopt -s histappend

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

# python virtualenv

#activate virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs

if [ "$(uname)"] == "Darwin" ]; then
    source /usr/local/bin/virtualenvwrapper.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    source /usr/bin/virtualenvwrapper.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW32_NT" ]; then
    source /usr/bin/virtualenvwrapper.sh

