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
" Add maktaba and bazel to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'psliwka/vim-smoothie'
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
Plug 'mhinz/vim-signify'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
" Plug 'nvim-lua/completion-nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
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

"===============================FileBrowser settings============
nnoremap <F2> :Explore<Enter>

" Telescope keybindings
" source telescope config
source ~/.config/nvim/plugin-configs/telescope.vim
nnoremap <leader>ff <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" LSP
source ~/.config/nvim/plugin-configs/lsp.vim

" Vim Signify - Git Gutter
" default updatetime 4000ms is not good for async update
set updatetime=100

" FZF
" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading -g "{*.go,*.py,*.scala}" --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif
nnoremap <C-n> :GitFiles<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-F> :RG<CR>

