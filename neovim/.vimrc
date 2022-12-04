" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" Status bar
set laststatus=2

" Encoding
set encoding=utf-8

" auto wrap text that extends beyond the screen length
set wrap

" indent when moving to the next line while writing code
set autoindent
filetype indent on

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
"set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all python syntax highlighting features
let python_highlight_all = 1

" autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" use skeleton code for *new* python projects
au BufNewFile *.py 0r ~/.vim/skeleton.py

" Call the vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif


