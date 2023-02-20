local opt = vim.opt
local g = vim.g

-- Hotkeys
local map = vim.api.nvim_set_keymap
options = { noremap = true }

g.mapleader = ' '

map('n', '<Leader>pp', ':NvimTreeFindFileToggle <CR>', options)
map('n', '<Leader>ff', ':Telescope find_files<CR>', options)
map('n', '<Leader>fg', ':Telescope live_grep<CR>', options)
map('n', '<Leader>fb', ':Telescope buffers<CR>', options)

-- Colorscheme
vim.cmd [[ colorscheme base16-default-dark ]]

-- Indent line
opt.list = true
-- opt.listchars:append("space:⋅")
-- opt.listchars:append("eol:↴")
-- g.show_end_of_line = true
-- g.space_char_blankline = " "

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
opt.tabstop = 2
opt.shiftwidth = 2
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
