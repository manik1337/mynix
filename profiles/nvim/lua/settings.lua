local opt = vim.opt
local g = vim.g

g.mapleader = ' '

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', "<M-h>", "<C-w>5<", opts)
vim.api.nvim_set_keymap('n', "<M-j>", "<C-w>2+", opts)
vim.api.nvim_set_keymap('n', "<M-k>", "<C-w>2-", opts)
vim.api.nvim_set_keymap('n', "<M-l>", "<C-w>5>", opts)

-- Colors
opt.termguicolors = true

-- Colorscheme
vim.cmd.colorscheme "gruvbuddy"

-- Transparency
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")

-- Indent line
opt.list = true

-- Performance
opt.lazyredraw = true;
opt.shell = "zsh"
opt.shadafile = "NONE"

-- Undo files
opt.undofile = true

-- Indentation
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.scrolloff = 3

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  command = "setlocal noexpandtab",
})

-- Set clipboard to use system clipboard
opt.clipboard = "unnamedplus"

-- Use mouse
opt.mouse = "a"

-- Nicer UI settings
-- opt.cursorline = true
opt.relativenumber = true
opt.number = true

-- Get rid of annoying viminfo file
opt.viminfo = ""
opt.viminfofile = "NONE"

-- Miscellaneous quality of life
opt.ignorecase = true
opt.ttimeoutlen = 5
opt.compatible = false
opt.hidden = true
opt.shortmess = "atI"
