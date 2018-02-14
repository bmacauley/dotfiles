#=====================
# .zshrc
#=====================


# History
#----------
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=10000                  # big history
SAVEHIST=10000
setopt APPEND_HISTORY  			# zsh sessions will append their history list to the history file
setopt EXTENDED_HISTORY 		# add timestamps to history
setopt HIST_EXPIRE_DUPS_FIRST 	# when history needs to be trimmed, trim duplicates first
setopt HIST_IGNORE_DUPS 		# do not enter commands in history if they are duplicates of the previous command
setopt HIST_IGNORE_SPACE  		# Remove command lines from the history list when the first character on the line is a space
setopt HIST_VERIFY 				# Whenever the user enters a line with history expansion, don’t execute the line directly
setopt INC_APPEND_HISTORY 		# Appends every command to the history file once it is executed
setopt SHARE_HISTORY 			# share history between sessions, reloads the history whenever you use it



# Completion
#------------
setopt COMPLETE_IN_WORD 		# Completion can begin in word

# add custom completion scripts
fpath=(~/.zsh/completion  $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)


autoload -U compinit  			# activate zsh completions
compinit

# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2



# Prompt configuration
#---------------------
autoload -Uz promptinit     	# load the default prompt shell functions
promptinit
setopt PROMPT_SUBST      		# parameter expansion, command substitution and arithmetic expansion are performed in prompts



# Other settings
#setopt CORRECT  				# correct the spelling of commands
setopt IGNORE_EOF  				# Do not exit on end-of-file
setopt EXTENDED_GLOB  			# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation
setopt NUMERIC_GLOB_SORT 		#  sort the filenames numerically rather than lexicographically.
setopt NO_BEEP 					# beeps are annoying
unsetopt HIST_BEEP              # no bell on error in history
unsetopt rm_star_silent         # SAFETY! ask for confirmation for `rm *' or `rm path/*' !!!
setopt RM_STAR_WAIT 			# SAFETY! 10 second wait if you do something that will delete everything!!!
unsetopt HUP  					# SAFETY! disable HUP signal to running jobs when the shell exits!!!
unsetopt bg_nice                # no lower priority for background jobs




# Bind keys
#----------



# Bash default editor
#-------------------
export EDITOR=/usr/bin/vim 		# default terminal editor




# FASD config
#-----------------

eval "$(fasd --init auto)"


# direnv
#------------------------
eval "$(direnv hook zsh)"




#  Python virtualenv
# activate virtualenvwrapper
#-------------------
export WORKON_HOME=$HOME/.virtualenvs

if [ "$(uname)" = "Darwin" ]; then
    source /usr/local/bin/virtualenvwrapper.sh
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    source /usr/bin/virtualenvwrapper.sh
elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
    source /usr/bin/virtualenvwrapper.sh
fi

# pyenv-virtualenv
# activate pyenv-virtualenv for pyenv Python environments
# https://github.com/pyenv/pyenv-virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"




# rbenv
# activate rbenv for ruby environments
#--------------------
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

