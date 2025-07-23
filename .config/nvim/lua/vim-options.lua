vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set number")
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
vim.cmd('nnoremap <leader>" :split<CR>')

-- Vertical Split
vim.cmd("nnoremap <leader>% :vsplit<CR>")

-- Resize Splits
vim.cmd("nnoremap <C-Left> <C-w><")
vim.cmd("nnoremap <C-Right> <C-w>>")
vim.cmd("nnoremap <C-Up> <C-w>-")
vim.cmd("nnoremap <C-Down> <C-w>+")

-- Quickfix options
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Oil.nvim
vim.keymap.set("n", "-", "<cmd>Oil<CR>")

-- Quit & Save Options
vim.cmd("nnoremap <leader>w :w<CR>")
vim.cmd("nnoremap <leader>x :wq<CR>")
vim.cmd("nnoremap <leader>q :wqa<CR>")

-- Switch camelCase and snake_case
local switch_case = require("utils.switch-case").switch_case
vim.keymap.set('n', '<leader>sc', switch_case, { noremap = true, silent = true })

-- Reset search
vim.cmd('nnoremap <leader>rs :let @/ = ""<CR>')
