"Suggestions and future improvements {{{
"}}}

"Python that i use {{{
"}}}
source ~/.config/nvim/options.vim

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
source ~/.config/nvim/plugins.vim
"}}}

"set colorscheme{{{
colo gruvbox
"}}}

"edit vimrc/zshrc and load vimrc bindings{{{

nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>

nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ep :vsp ~/.config/nvim/plugins.vim<CR>
nnoremap <leader>ei :vsp ~/.i3/config<CR>
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
"}}}

