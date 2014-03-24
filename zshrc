# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(github heroku zsh-syntax-highlighting colored-man gem git python ruby rails bower npm rake bundler heroku)


# Customize to your needs...
############################
# OS Specific Setups

if [[ $OSTYPE == "linux-gnu" ]]; then
	typeset -U path
	path=(~/code/git-achievements ~/.gem/ruby/2.0.0/bin $path)
	plugins=(archlinux systemd $plugins)
	source /usr/share/doc/pkgfile/command-not-found.zsh
elif [[ $OSTYPE == "darwin"* ]]; then
	typeset -U path
	path=(~/code/git-achievements $path)
	plugins=(brew osx sublime $plugins)
fi

source $ZSH/oh-my-zsh.sh

alias git="git-achievements"
compdef git-achievements=git
alias cat="lolcat"
command ponysay -q
export EDITOR=vim

