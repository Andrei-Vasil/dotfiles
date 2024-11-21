set relativenumber

" center line on half-window up/down
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" fat cursor on normal mode, slim cursor on insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" set clipboard to use system clipboard
set clipboard=unnamedplus
