" Pathogen setup to point to bundle folder and load the pathogen script for
" submodules
let g:SuperTabDefaultCompletionType = "<c-n>"
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

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
