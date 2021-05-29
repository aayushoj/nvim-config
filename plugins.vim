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
Plug 'flazz/vim-colorschemes'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
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

"===============================NerdTree settings============
nnoremap <F2> :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Telescope keybindings
" source telescope config
source ~/.config/nvim/plugin-configs/telescope.vim
nnoremap <leader>ff <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" LSP
source ~/.config/nvim/plugin-configs/lsp.vim
