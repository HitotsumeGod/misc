#!/bin/bash

RESET='\e[0m'
BLACK='\e[0;30m'
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
PURPLE='\e[0;35m'
CYAN='\e[0;36m'
WHITE='\e[0;37m'

HBLACK='\e[0;90m'
HRED='\e[0;91m'
HGREEN='\e[0;92m'
HYELLOW='\e[0;93m'
HBLUE='\e[0;94m'
HPURPLE='\e[0;95m'
HCYAN='\e[0;96m'
HWHITE='\e[0;97m'
export EDITOR=/usr/bin/vim
export UBIN=/usr/local/bin
export GOD=$USER

HISTCONTROL=ignoredups

if [ -f ~/.bash_aliases ]; 
then
	. ~/.bash_aliases
fi

ce() {
	builtin cd "$@" && setprompt && ls;
}

setprompt() {
	if [ ! -d .git ];
	then
		PS1="${RED}\u ${HGREEN}in ${HYELLOW}\w ${HRED}$ ${RESET}"
	else
		PS1="${HRED}\u ${HGREEN}in ${HYELLOW}\w ${HGREEN}on ${HBLUE}$(__git_ps1 "(branch %s)") ${RESET} "
	fi
}

if [ -f ~/.bscripts/git-prompt ];
then 
	. ~/.bscripts/git-prompt
fi
setprompt
if [ -f /usr/local/bin/Friend ];
then 
	Friend
fi
