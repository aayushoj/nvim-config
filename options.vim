"My costumisations {{{
" not compatible with vi
set nocp
" search down into subfolders
set path+=**
set colorcolumn=80 " Highlight column at 80
set softtabstop=4           " number of spaces in tab when editing
set tabstop=4               " number of visual spaces per TAB
set shiftwidth=4
set backspace=indent,eol,start
set expandtab
syntax on                   " syntax highlighting
set ai                      " autoindent
set rnu                     " enable relative number
set nu                      " enable absolute number
" set cursorline              " highlight current line
filetype indent on          " load filetype-specific indent files
set wildmenu                " visual autocomplete for command menu
set vb
" set complete=.,w,b,u,t,i,],kspell
set completeopt=menuone,noinsert,noselect
set nospell
" set omnifunc=syntaxcomplete#Complete
"code folding{{{
set foldenable              " enable folding
set foldlevelstart=10       " close all folds by default
set foldmethod=indent       " fold based on indent level
" }}}
"  Search settings {{{
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set showmatch               " highlight matching [{{{()}}}]
set showcmd                 " show command in bottom bar
"}}}
