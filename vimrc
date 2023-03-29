set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'igankevich/mesonic'
Plugin 'tikhomirov/vim-glsl'
Plugin 'kergoth/vim-bitbake'

call vundle#end()            " required
filetype plugin indent on    " required

" Ctrl + s - exit interactive mode & save file
" Ctrl + d - save & exit
" Ctrl + q - quit discarding changes
" Need run this command: echo 'stty -ixon' >> ~/.bashrc && exec $SHELL
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq!<cr>
nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>
nnoremap <C-q> :qa!<cr>
nnoremap + :res +5<CR>
nnoremap _ :res -5<CR>

packadd! onedark.vim
syntax enable
set background=dark
colorscheme onedark
set number
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch

" NERDTree show hidden files
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=50

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
	\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" vim-glsl
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" If there's a `meson.build` file, use meson for linting.
autocmd FileType c call ConsiderMesonForLinting()
function ConsiderMesonForLinting()
    if filereadable('meson.build')
        let g:syntastic_c_checkers = ['meson']
    endif
endfunction

