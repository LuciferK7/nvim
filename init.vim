let mapleader = " "
call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-abolish'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'mattn/emmet-vim'
Plug 'emi2k01/nvcode-color-schemes.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-eunuch'
Plug 'thaerkh/vim-workspace'
Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'lervag/vimtex'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:NERDTreeUseTCD = 1

autocmd vimenter * NERDTree | wincmd p
"autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd BufReadPost *.rs setlocal filetype=rust

nmap <silent> F <cmd>Files<CR>
nmap <silent> R <cmd>Rg<CR>
nmap <silent> B <cmd>Buffers<CR>
nmap <silent> M <cmd>Marks<CR>
nmap <silent> <leader>h :tabprevious<CR>
nmap <silent> <leader>l :tabnext<CR>
nmap <silent> <leader>tn :tabnew<CR>
nmap <silent> <leader><S-h> :tabmove -1<CR>
nmap <silent> <leader><S-l> :tabmove +1<CR>
nmap <silent> <leader>ne :exec "tcd " . expand("%:p:h")<CR>:exec "NERDTree " . expand("%:p:h")<CR><C-w>p

set shortmess+=c
set completeopt=menuone,noinsert,noselect
set termguicolors
set signcolumn=yes
set hidden
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99
set updatetime=600
set inccommand=split
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
set expandtab
set number
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set completeopt-=preview
set pumheight=20
set cmdheight=1
set hidden
set scrolloff=5
set nowrap
set splitbelow
set splitright
set undodir=~/.config/nvim/.vimhis
set undofile
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines
set ignorecase
set smartcase
set gdefault
set signcolumn=yes
set relativenumber
set number
set colorcolumn=110
set exrc
set secure
set clipboard=unnamed

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> <leader><Esc> <Esc>:nohlsearch<CR><Esc>
nnoremap k gk
nnoremap j gj

set background=dark
colorscheme nord
colorscheme nvnord

source ~/.config/nvim/coc.vim

let g:table_mode_corner='|'
