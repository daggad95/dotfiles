" Open nerdtree with ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Open nerdtree by default if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close nerdtree if it's the last tab open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

