# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/bmacauley/.zshrc'

autoload -Uz compinit
compinit




autoload -Uz promptinit
promptinit

# End of lines added by compinstall

Time12a="\$(date +%H:%M:%S)"




# check if root, display /!!!\ warning in prompt


source /usr/local/Cellar/zsh-git-prompt/0.5/zshrc.sh
NEWLINE=$'\n'
CLOCK=$'[%t] '
BATTERY=`battery | sed 's/%/%%/'`
if [[ ${EUID} == 0 ]]; then
  PROMPT='$fg[red]%n $fg[white]at $fg[yellow]%m $fg[white]in $fg[green]%~%b$(git_super_status)${NEWLINE}% $fg[red]/!!!\ # ' 
else
  PROMPT='${CLOCK}${BATTERY}${NEWLINE}$fg[red]%n $fg[white]at $fg[yellow]%m $fg[white]in $fg[green]%~%b$(git_super_status)${NEWLINE}% $ ' RPROMPT=''
fi

