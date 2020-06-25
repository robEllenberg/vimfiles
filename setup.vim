set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'motemen/git-vim'
Plugin 'djoshea/vim-matlab-fold'
Plugin 'vim-scripts/doxygen-support.vim'
Plugin 'vim-scripts/cscope.vim' 


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
syntax on
" Standard tab settings at 4 spaces instead of tab chars
set shiftwidth=4 tabstop=4 expandtab

" Boilerplate to enable custom tiletype plugins and such
filetype on
filetype plugin indent on
set autoindent 

" Define the mlint compiler for the make commant
autocmd BufEnter *.m compiler mlint

" Enable syntax based folding (this will require additional plugins for odd
" filetypes
set foldmethod=syntax
"set foldenable
set foldlevelstart=4
"let xml_syntax_folding=1

"Search features
set incsearch
set hlsearch
"Use bash-style tab completion
" Hybrid tab completion at prompt acts like BASH for the first 2 tabs, then
" cycles through the results.
set wildmode=longest,list,full
set wildmenu
set iskeyword+=.

"Python mode keywords
let g:pymode_lint_onfly = 1
let g:pymode_lint_cwindow = 1
let g:pymode_lint_ignore = "E2,E501"
let g:pymode_lint_checker="pyflakes"

let g:pydiction_location = '/home/robert/.vim/bundle/pydiction/complete-dict'

" Load rope plugin
let g:pymode_rope = 0

" Use <localleader>r (by default <\-r>) for renaming
nnoremap <silent> <buffer> <leader>e :call jedi#rename()<cr>
" etc.
"

"Cscove stuff
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>

let g:cscope_silent = 1

nnoremap  <leader>dl :DoxyBlockLong<CR>
nnoremap  <leader>ds :DoxyBlockShort<CR>
nnoremap  <leader>dh :DoxyFILEHeader<CR>

let g:SuperTabDefaultCompletionType = "<c-n>"

