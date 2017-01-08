#===========
# .bashrc
#===========


# Bash completion
#-----------------
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion


shopt -s nocaseglob;  		# Case-insensitive globbing (used in pathname expansion)
shopt -s cdspell; 			# Autocorrect typos in path names when using `cd`

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;



# Bash history configs
#---------------------
export HISTCONTROL=erasedups 			# erase duplicates in history file
export HISTSIZE='32768'; 				# Increase Bash history size (stored in-memory) during session
export HISTFILESIZE="${HISTSIZE}"; 		# Increase Bash history size (stored in history file)
export HISTCONTROL='ignoreboth'; 		# Omit duplicates and commands that begin with a space from history.
shopt -s histappend						# when a shell session exits, append history to .bash_history




# Bash default editor
#-------------------
export EDITOR=/usr/bin/vim


# FASD config
#-----------------
# https://github.com/clvv/fasd
# command line productivity booster. Quick access to frequently access files and directories

eval "$(fasd --init auto)"
