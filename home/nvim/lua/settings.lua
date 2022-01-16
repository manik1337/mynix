local opt = vim.opt
local g = vim.g

-- Hotkeys
local map = vim.api.nvim_set_keymap
options = { noremap = true }
map('n', '<C-p>', ':NvimTreeToggle <CR>', options)
map('n', '<C-f>', ':Telescope find_files <CR>', options)
map('n', '<C-n>', ':Telescope live_grep <CR>', options)

-- Colorscheme
vim.cmd [[ colorscheme gruvbox ]]

-- Indent line
g.indent_blankline_char = '▏'

-- Performance
opt.lazyredraw = true;
opt.shell = "zsh"
opt.shadafile = "NONE"

-- Colors
opt.termguicolors = true

-- Undo files
opt.undofile = true

-- Indentation
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.scrolloff = 3

-- Set clipboard to use system clipboard
opt.clipboard = "unnamedplus"

-- Use mouse
opt.mouse = "a"

-- Nicer UI settings
opt.cursorline = true
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
