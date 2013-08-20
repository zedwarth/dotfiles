#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Set Prompt
#[user@host working-directory](git-branch)$

source /usr/share/git/completion/git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

##History
HISTSIZE=5000

#Enviromental Variables

#PATH additions
PATH="${PATH}:/home/zedwarth/.gem/ruby/2.0.0/bin"
PATH="${PATH}:/home/zedwarth/code/git-achievements"

alias git="git-achievements"

export EDITOR=vim
#
source /usr/share/doc/pkgfile/command-not-found.bash

alias less='/usr/share/vim/vim73/macros/less.sh'
alias trans=' transmission-remote'

#Colored Man Pages

man() {
    env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

##Colorded grep

alias grep='grep --color=auto' 

##Colored ls

alias ls='ls --color=auto'

##Rainbowed cat

alias cat='lolcat'

##The Mods are ASLEEP!
##POST PONIES!!!!
#command ponysay $(fortune -a)
command ponysay -q

