call plug#begin('~/.local/share/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'numirias/semshi'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'christoomey/vim-conflicted'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
call plug#end()

set number
syntax on
filetype indent on
autocmd BufNewFile,BufRead *.ptest set syntax=json

colorscheme gruvbox

" open new split panes to right and below
set splitbelow
set splitright

" Reload conf
nnoremap confr :source $MYVIMRC<CR>

" Remap escape
imap jk <Esc>
imap kj <Esc>

" Remap split movement
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Search within files using fzf/ag
map <C-f> :Rg<CR>

" Search for files using fzf
map <C-p> :Files<CR>

" Open and close terminal
nnoremap <c-t> :sp term://zsh<CR>i
tnoremap <c-t> <C-\><C-n> :q!<CR>

source nerdtree.vim
source coc.vim
source markdown.vim
source sneak.vim
source black.vim
