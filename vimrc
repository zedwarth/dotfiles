" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'wting/rust.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'elixir-lang/vim-elixir'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"Basic
syntax on
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


"Colors
set background=dark
colorscheme solarized

"Vim-Airline
set laststatus=2
let g:airline_powerline_fonts = 1
