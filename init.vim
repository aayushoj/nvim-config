"Suggestions and future improvements {{{
"}}}

"Python that i use {{{
let g:python3_host_prog='~/Workspace/sdmain/polaris/.buildenv/bin/python'
let g:python2_host_prog='~/Workspace/sdmain/polaris/.buildenv/bin/python2'
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
set background=light
colo gruvbox
"}}}

"edit vimrc/zshrc and load vimrc bindings{{{

nnoremap <leader>ev :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :edit ~/.zshrc<CR>

nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ep :edit ~/.config/nvim/plugins.vim<CR>
nnoremap <leader>ei :edit ~/.i3/config<CR>
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


" Main Keymaps{{{

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
" Open phabricator url from commit
nnoremap <leader>gx :%g/phabricator/normal wwwgx<CR>
" Turn on/off wrapping
nnoremap <F6> :set wrap!<CR>
" Show open buffers and help in quick switching
nnoremap <F5> :Buffers<CR>:buffer<Space>
" w!! force write with sudo even if forgot sudo vim
cmap w!! w !sudo tee > /dev/null %

nnoremap <Left> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Right> <nop>

nnoremap <leader>s yiw:RG<Space><C-r>"<CR>


"}}}

" 'cd' towards the directory in which the current file is edited
" but only change the path for the current window
nnoremap <leader>cd :lcd %:h<CR>
set path+=**/*
set hidden

" Open files located in the same dir in with the current file is edited
nnoremap <leader>ew :e <C-R>=expand("%:.:h") . "/"<CR>

if has('nvim-0.5')
    augroup lsp
      au!
      au FileType scala,sbt lua require('metals').initialize_or_attach({})
    augroup end
endif

" Better autocompletion
inoremap <C-l> <C-x><C-l>
inoremap <C-f> <C-x><C-f>
" inoremap <C-
