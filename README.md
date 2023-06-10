# dotfiles

## Just another dotfile repo

This repo sat stagnate for a number of years, but a combination of curiosity and several new computers lead me to do some research and try some new tools.

### How it Works

GNU Stow is used to create links into my home directory. The configurations for different tools are broken up into their own top level directories so to make it easier to link and unlink files in a modular way.

As an example `git` contains two files, `git/.gitconfig` and `git/.gitignore_global`. To install these to my home directory I can run `stow -t $HOME git` and a symbolic link will be created at `~/.gitconfig` and `~/.gitignore_global`.

### Dependencies 

Git and stow are obviously required to be installed, but I'm also leveraging [NvChad](https://nvchad.com) and [ZSH Quickstart Kit](https://github.com/unixorn/zsh-quickstart-kit#customizing-with-zshrcd) to get a baseline configuration for NeoVim and ZSH. These all get installed on their own though a combination of brew, pacman, yay, and git.
