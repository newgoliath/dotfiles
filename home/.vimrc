set nocompatible              " be iMproved, required
filetype off                  " required
"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

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
"Plugin 'severin-lemaignan/vim-minimap'  "a sublime text minimap - useless
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-tbone'
"Plugin 'asciidoc/asciidoc'
Plugin 'dagwieers/asciidoc-vim'
Plugin 'matcatc/vim-asciidoc-folding'
"Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale' " async linter
Plugin '907th/vim-auto-save'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'fholgado/minibufexpl.vim'
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
:map <silent> <F6> vat<Esc>`<df>`>F<df>

" mac clipboard
set clipboard=unnamed

" Start NERDTree on startup
autocmd vimenter * NERDTree
" Jump to the main window.
autocmd VimEnter * wincmd p
" For mouse click in NERDTree
:set mouse=a
"let g:NERDTreeMouseMode=3

" plugin nerdtree-git
let g:NERDTreeShowGitStatus = 1

" don't fold when opening files - fold them with zc, unfold with zr
set nofoldenable

""""""""""""""""""""""""""""""""""
"tbone.vim
"Basic tmux support for Vim.
":Tmux lets you call any old tmux command (with really good tab complete).
":Tyank and :Tput give you direct access to tmux buffers.
":Twrite sends a chunk of text to another pane. Give an argument like windowtitle.2, top-right, or last, or let it default to the previously given argument.
":Tattach lets you use a specific tmux session from outside of it.

""""""""""""""""""""""""""""""""""
" mappings for asciidoc text mgmnt

"iab _source [source,bash]<CR>----<CR><CR>----<CR>+<CR>Expect output to look similar to this:<CR>+<CR>[source,text]<CR>----<CR><CR>----<CR>

" Wrap vselect with [source,bash]
:vmap sb "zdI[source,bash]<CR>----<CR><C-R>z----<CR><Esc>
" Wrap vselect with text and [source,text]
:vmap st "zdI<CR>+<CR>Expect the output to look similar to this:<CR>+<CR>[source,text]<CR>----<CR><C-R>z----<CR><Esc>
" Wrap vselect with [source,ini]
:vmap si "zdI+<CR>[source,ini]<CR>----<CR><C-R>z----<CR>+<CR><Esc>

" New Slide maps
:map nsl i<CR>:scrollbar:<CR>:data-uri:<CR>:noaudio:<CR>== SLIDE TITLE<CR><CR><CR>ifdef::showscript[]<CR>Transcript:<CR><CR>endif::showscript[]<CR><CR>
" New Slide by name
:map nsn ^"zd$i<CR>:scrollbar:<CR>:data-uri:<CR>:noaudio:<CR>== <Esc>"zpa<CR><CR><CR>ifdef::showscript[]<CR>Transcript:<CR><CR><CR>endif::showscript[]<CR><CR> 
" New Slide: visual in transcript
:vmap nst "zdI<CR>:scrollbar:<CR>:data-uri:<CR>:noaudio:<CR>== SLIDE TITLE<CR><CR><CR>ifdef::showscript[]<CR>Transcript:<CR><CR><C-R>z<CR>endif::showscript[]<CR><CR> 
" wrap text in transcript
:vmap trans "zdI<CR>ifdef::showscript[]<CR><CR>Transcript:<CR><CR><C-R>z<CR><CR>endif::showscript[]<CR><CR><Esc> 

" moving between slides - move up/down and put title at home
:map <C-j> zjztzo
:map <C-k> kzkjztzo

" delete text before [ ] and preservetext in [ ]
:map spp <Esc>d\[di[va[p " remove everything up to [ ] and preserve insides
:map sap d/[<CR>di[va[p

" find next ==
:map <silent> <F1> <Esc>/^==\s<CR>z.



" asciidoc-folding
let g:asciidoc_fold_style = 'nested'

" nerdtree ignore - everything but _Lab_
"let NERDTreeIgnore=['
"
" Fix some mouse reporting for big terminals
"if has('mouse_sgr')
" set ttymouse=sgr
"ndif
