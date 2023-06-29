vim.opt.guicursor = "a:block-blinkwait150-blinkon150-blinkoff150"
vim.opt.cursorline = true
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
vim.opt.winblend = 0
vim.opt.pumblend = 0

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.autoindent = true -- Auto-indent
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.wrap = false
vim.opt.backspace = 'start,eol,indent'

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath('config') .. "/undodir/"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.path:append { '**' } -- Search down into subfolders when finding files
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.inccommand = 'nosplit'

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.scrolloff = 25
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help "clipboard"`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 50

vim.o.timeout = true
vim.o.timeoutlen = 5 * 1000

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
