set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'asciidoc/asciidoc'
"Plugin 'matcatc/vim-asciidoc-folding'
"Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale' " async linter
Plugin '907th/vim-auto-save' " 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
syntax enable
set nu

" from ALE:
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
:map <silent> <F5> :! open -n -a "Google Chrome" --args --profile-directory="Default" file:///%:p<CR>
