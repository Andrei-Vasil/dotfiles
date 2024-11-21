vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set clipboard=unnamedplus")
vim.g.mapleader = " "


-- center line on half-window up/down
vim.cmd("nnoremap <C-d> <C-d>zz")
vim.cmd("nnoremap <C-u> <C-u>zz")

-- Tabpages
vim.cmd("nnoremap <leader>c :tabnew<CR>")
vim.cmd("nnoremap <leader>& :tabclose<CR>")
vim.cmd("nnoremap <leader>n :+tabnext<CR>")
vim.cmd("nnoremap <leader>p :-tabnext<CR>")

-- Horizontal Split
vim.cmd("nnoremap <leader>\" :split<CR>")

-- Vertical Split
vim.cmd("nnoremap <leader>% :vsplit<CR>")

-- Resize Splits
vim.cmd("nnoremap <C-Left> <C-w><")
vim.cmd("nnoremap <C-Right> <C-w>>")
vim.cmd("nnoremap <C-Up> <C-w>-")
vim.cmd("nnoremap <C-Down> <C-w>+")

-- Quit & Save Options
vim.cmd("nnoremap <leader>w :w<CR>")
vim.cmd("nnoremap <leader>x :wq<CR>")
vim.cmd("nnoremap <leader>q :wqa<CR>")

