"pathogen-plugin-managment
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"Basic 
syntax on
filetype indent plugin on
set linebreak
set backspace=indent,eol,start

"Python-File-Formating
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

"Colors
set background=dark
colorscheme solarized

"Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
