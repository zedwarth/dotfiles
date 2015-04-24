"pathogen-plugin-managment
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"Basic
syntax on
filetype indent plugin on
set linebreak
set backspace=indent,eol,start
set spell nu
set nocompatible

"Auto Formating
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype slim setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd FileType eruby setlocal ts=2 sts=2 sw=2
autocmd FileType python setlocal ts=8 sts=4 sw=4 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


"Colors
set background=dark
colorscheme solarized

"Vim-Airline
let g:airline_powerline_fonts = 1
