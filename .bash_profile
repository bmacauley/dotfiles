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
source /home/bmacauley/.virtualenvs/python2.7/bin/virtualenvwrapper.sh
source /usr/bin/virtualenvwrapper.sh


#activate python2.7 virtualenv
source ~/.virtualenvs/python2.7/bin/activate


#eval 'keychain --eval id_rsa'

