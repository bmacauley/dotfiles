#===============
# .bash_profile
#===============

# set PATH
export PATH="$HOME/bin:$PATH";


# load .bashrc
#-------------
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


# Load dotfiles
#---------------
for file in ~/.{bash_prompt,paths,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
