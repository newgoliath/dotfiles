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
Plugin 'tpope/vim-tbone'
Plugin 'asciidoc/asciidoc'
Plugin 'matcatc/vim-asciidoc-folding'
"Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale' " async linter
Plugin '907th/vim-auto-save' " 
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'fholgado/minibufexpl.vim'
"Plugin 'sjl/vitality.vim'
"Plugin 'benmills/vimux'

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

set tabstop=2
set shiftwidth=2
set expandtab
set number
set relativenumber

" Open file in Chrome
:map <silent> <F5> :! open -n -a "Google Chrome" --args --profile-directory="Default" file:///%:p<CR>
:map <F6> vat<Esc>`<df>`>F<df>

" Start NERDTree on startup
autocmd vimenter * NERDTree
" For mouse click in NERDTree
:set mouse=a
let g:NERDTreeMouseMode=3

let g:NERDTreeShowGitStatus = 1

" don't fold when opening files - fold them with zc
set nofoldenable

"tbone.vim
"Basic tmux support for Vim.
":Tmux lets you call any old tmux command (with really good tab complete).
":Tyank and :Tput give you direct access to tmux buffers.
":Twrite sends a chunk of text to another pane. Give an argument like windowtitle.2, top-right, or last, or let it default to the previously given argument.
":Tattach lets you use a specific tmux session from outside of it.

iab _source [source,bash]<CR>----<CR><CR>----<CR>+<CR>Expect output to look similar to this:<CR>+<CR>[source,text]<CR>----<CR><CR>----<CR>
