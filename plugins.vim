set nocompatible              " be iMproved, required
if has('nvim')
    let s:editor_root=expand('~/.config/nvim')
else
    let s:editor_root=expand('~/.vim')
endif
"set rtp+= s:editor_root.'/bundle/Vundle.vim'
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall | source $MYVIMRC
" endif
source /home/aayush/.config/nvim/autoload/plug.vim
"call plug#rc( '/home/aayush/.config/nvim/plugged')
call plug#begin('/home/aayush/.config/nvim/plugins')
Plug 'airblade/vim-gitgutter', {'do': 'GitGutterEnable' }
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
" Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
" Configuration for vim-plug
" Plug 'derekwyatt/vim-scala'
Plug 'jodosha/vim-godebug' " Debugger integration via delve
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()            " required
autocmd QuickFixCmdPost *grep* cwindow

" Airline
set laststatus=2
let g:airline_encoding = "utf-8"
let g:airline_theme = "gruvbox"
let g:airline_powerline_fonts = 1
if isdirectory(expand(s:editor_root."/bundle/vim-airline/"))
            if !exists('g:airline_powerline_fonts')
                " Use the default set of separators with a few customizations
                echo "why?"
                let g:airline_left_sep='>'  " Slightly fancier than '>'
                let g:airline_right_sep='<' " Slightly fancier than '<'
            endif
        endif


"===========================Vim-Go===================
let g:go_list_type = "quickfix"
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_test_timeout = '1000s'
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR><Paste>
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_generate_tags = 1

"===============================NerdTree settings============
nnoremap <F2> :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>r  :<C-u>CocListResume<CR>
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" ale settings for gopls lang-server
let g:ale_linters = {
	\ 'go': ['gopls'],
	\}

" FZF settings
" =========================================
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'ctrl-x'
" Make Ag search in directory
function! s:ag_in(...)
  call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, fzf#vim#with_preview()))
endfunction
" Make Rg search in directory
function! s:rg_in(...)
  call fzf#vim#rg(join(a:000[1:], ' '), extend({'dir': a:1}, fzf#vim#with_preview()))
endfunction

command! -nargs=+ -complete=dir AgIn call s:ag_in(<f-args>)
command! -nargs=+ -complete=dir RgIn call s:rg_in(<f-args>)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
nnoremap <C-p> :GFiles<Enter>
nnoremap <C-f> yiw:Rg<SPACE><C-r>"<CR>
nnoremap <M-f> yiw:RgIn<SPACE><SPACE><C-r>"<C-Left><Left>

" floating fzf
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --layout=reverse'
  let $FZF_PREVIEW_COMMAND = ' bat --color=always --style=numbers -H 3 {}'

    function! FloatingFZF() abort
        let width = min([&columns - 4, max([80, &columns - 20])])
        let height = min([&lines - 4, max([20, &lines - 10])])
        let top = ((&lines - height) / 2) - 1
        let left = (&columns - width) / 2
        let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

        let top = '╭' . repeat('─', width - 2) . '╮'
        let mid = '│' . repeat(' ', width - 2) . '│'
        let bot = '╰' . repeat('─', width - 2) . '╯'
        let lines = [top] + repeat([mid], height - 2) + [bot]
        let s:b_buf = nvim_create_buf(v:false, v:true)
        call nvim_buf_set_lines(s:b_buf, 0, -1, v:true, lines)
        call nvim_open_win(s:b_buf, v:true, opts)
        set winhl=Normal:Floating
        let opts.row += 1
        let opts.height -= 2
        let opts.col += 2
        let opts.width -= 4
        let s:f_buf = nvim_create_buf(v:false, v:true)
        call nvim_open_win(s:f_buf, v:true, opts)
        setlocal nocursorcolumn
        augroup fzf_preview_floating_window
            autocmd WinLeave <buffer> silent! execute 'bwipeout! ' . s:f_buf . ' ' . s:b_buf
        augroup END
    endfunction
    let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

" Treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {"javascript"},  -- list of language that will be disabled
  },
}
EOF
augroup treesitter_enable
    autocmd BufNewFile, BufRead * TSBufEnable
augroup END

" Telescope config
" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    mappings = {
      i = {
          ["<C-x>"] = false,
          ["<C-q>"] = actions.send_to_qflist,
      },
      n = {
        ["<esc>"] = actions.close,
        ["<C-i>"] = my_cool_custom_action,
      },
    },
  }
}
EOF
