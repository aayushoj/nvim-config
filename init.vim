"Suggestions and future improvements {{{
"}}}

"Python that i use {{{
"}}}

"  Mapping Leader and other issues----------{{{
"  These things are there as they are needed for plugin configurations or so i
"  believe
"set termencoding=utf-8
"set t_Co=256
"let mapleader="\" "suits me as i have been working with touch typing
map <space> <leader>
map <space><space> <leader><leader>
" enable filetype plugin built-in with vim
filetype plugin indent on
" not compatible with vi
set nocp
" search down into subfolders
set path+=**
set cc=80 " Highlight column at 80
" set backspace=indent,eol,start
"}}}

"  Vundle Initialization {{{
" This loads all the plugins specified in ~/.vim/plugins.vim
" Use Vundle plugin to manage all other plugins
if has('nvim')
    if filereadable(expand("~/.config/nvim/plugins.vim"))
      source ~/.config/nvim/plugins.vim
    endif
else
    if filereadable(expand("~/.vim/plugins.vim"))
      source ~/.vim/plugins.vim
    endif
endif
" }}}

"set colorscheme{{{
"set background=dark
colo Tomorrow-Night-Eighties
highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931
"}}}

"edit vimrc/zshrc and load vimrc bindings{{{

if has('nvim')
    nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
else
    nnoremap <leader>ev :vsp ~/.vimrc<CR>
endif
nnoremap <leader>ez :vsp ~/.zshrc<CR>

if has('nvim')
    nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
else
    nnoremap <leader>sv :source ~/.vimrc<CR>
endif
if has('nvim')
    nnoremap <leader>ep :vsp ~/.config/nvim/plugins.vim<CR>
else
    nnoremap <leader>ep :vsp ~/.config/nvim/plugins.vim<CR>
endif
nnoremap <leader>ei :vsp ~/.i3/config<CR>
"}}}

"move backup to /tmp{{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"}}}

"Functions {{{
"toggle between number and relativenumber{{{
function! ToggleNumber()
    if(&relativenumber==  1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
"Changed mapping from F2 to F4 as now i use F2 to toggle menubar of terminal
nnoremap <F4> :call ToggleNumber()<CR>
"}}}

" strips trailing whitespace at the end of files.{{{
function! StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
"I have chosen a far key as it won't be used too often
nnoremap <F3> :call StripTrailingWhitespaces()<CR>

"}}}

"}}}

"My costumisations {{{
"I won't enable mouse for a good practice of vim motion commands
set shiftwidth=4
set expandtab
syntax on                   " syntax highlighting
set ai                      " autoindent not that AI(lol)
set softtabstop=4           " number of spaces in tab when editing
set tabstop=4               " number of visual spaces per TAB
set rnu
set cursorline              " highlight current line
filetype indent on          " load filetype-specific indent files
set wildmenu                " visual autocomplete for command menu
set vb
set complete=.,w,b,u,t,i,],kspell
set nospell
set tags=~/Polaris/tags
set omnifunc=syntaxcomplete#Complete
set number
hi Search ctermbg=DarkMagenta
"code folding{{{
set foldenable              " enable folding
set foldlevelstart=10        " close all folds by default
set foldmethod=indent       " fold based on indent level
" }}}

"  Search settings {{{

set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set showmatch               " highlight matching [{{{()}}}]
set showcmd                 " show command in bottom bar

"}}}

"}}}

"Keymaps {{{

" Main Keymaps{{{

nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-l> <C-w><C-l>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>x "+x
nnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap > >gv
vnoremap < <gv
nnoremap <leader>o o<esc>k

"                        "---------------------------OPERATOR-PENDING---------------------------"
" Operate inside next block
onoremap in( :<c-u>normal! f(vi(<CR>
onoremap in{ :<c-u>normal! f{vi{<CR>
onoremap in" :<c-u>normal! f"vi"<CR>
onoremap in' :<c-u>normal! f'vi'<CR>
onoremap in` :<c-u>normal! f`vi`<CR>
" Operate inside previous block
onoremap ip( :<c-u>normal! F)vi(<CR>
onoremap ip{ :<c-u>normal! F}vi{<CR>
onoremap ip" :<c-u>normal! F"vi"<CR>
onoremap ip' :<c-u>normal! F'vi'<CR>
onoremap ip` :<c-u>normal! F`vi`<CR>
" Operate around next block
onoremap an( :<c-u>normal! f(va(<CR>
onoremap an{ :<c-u>normal! f{va{<CR>
onoremap an" :<c-u>normal! f"va"<CR>
onoremap an' :<c-u>normal! f'va'<CR>
onoremap an` :<c-u>normal! f`va`<CR>
" Operate around previous block
onoremap ap( :<c-u>normal! F)va(<CR>
onoremap ap{ :<c-u>normal! F}va{<CR>
onoremap ap" :<c-u>normal! F"va"<CR>
onoremap ap' :<c-u>normal! F'va'<CR>
onoremap ap` :<c-u>normal! F`va`<CR>
"
"
" Turn on/off wrapping
nnoremap <F6> :set wrap!<CR>
" Show open buffers and help in quick switching
nnoremap <F5> :buffers<CR>:buffer<Space>
" w!! force write with sudo even if forgot sudo vim
cmap w!! w !sudo tee > /dev/null %

nnoremap <Left> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Right> <nop>


"}}}

" File specific settings {{{

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal  foldmethod=marker
    autocmd FileType vim setlocal  foldlevel=0
augroup END
" }}}

" Python configuration {{{
augroup filetype_python
    autocmd!
    autocmd FileType python set sw=4
    autocmd FileType python set ts=4
    autocmd FileType python set sts=4
augroup END
"}}}


"}}}

