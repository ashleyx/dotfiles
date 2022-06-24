
" SETTINGS --------------------------


:set number
:set relativenumber
:set autoindent noexpandtab tabstop=4 shiftwidth=4
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set mouse=a
:set cursorline
:set ignorecase
:set noswapfile
:set splitbelow
:set splitright
:set scrolloff=3
:set encoding=UTF-8
:set clipboard=unnamedplus
:set completeopt-=preview " For No Previews
:set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:␣

" enable below to always show hidden chars
" :set list

" VIM SLIME settings to direct lines to right pane
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.cache/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "Local:1.2"}
let g:slime_dont_ask_default = 1

" air-line
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_symbols.branch=''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr=''



" KEYBINDS --------------------------


" remapping leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" Nerdtree keys
nnoremap <C-f> :NERDTreeToggle %<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" Tagbar toggle
nmap <F8> :TagbarToggle<CR>

" Find files using Telescope 
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" custon telescope commands
nnoremap <leader>FF <cmd>Telescope find_files hidden=true<cr>



" PLUGINS --------------------------


call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'scrooloose/nerdcommenter' " leader c for commenting
Plug 'https://github.com/airblade/vim-gitgutter' " git info in files
Plug 'nvim-lua/plenary.nvim' " req for telescope
Plug 'nvim-telescope/telescope.nvim' " filename and content search
Plug 'jpalardy/vim-slime' " send lines or selection to another pane

call plug#end()


:colorscheme onedark

" enabling transparency should come after color settings
:highlight Normal ctermbg=none
