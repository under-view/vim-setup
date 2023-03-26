set nocompatible              " be iMproved, required
filetype off                  " required

syntax enable
set number
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required

" autocmd VimEnter * NERDTree | wincmd p
