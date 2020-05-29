#==================
# .zprofile
#==================

# set PATH
#-------------
export PATH=$PATH:$HOME/bin:/usr/local/sbin


# load .zshrc
#-------------
if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi


# Load dotfiles
#---------------
# for file in ~/.{paths,zsh_prompt,aliases,functions}; do
# 	[ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;



