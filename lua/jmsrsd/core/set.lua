-- Loaded plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Leader and Local Leader key mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indentation
vim.o.breakindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Case sensitivity
vim.o.ignorecase = true
vim.o.smartcase = true

-- Highlight search results
vim.opt.hlsearch = false

-- Incremental search
vim.opt.incsearch = true

-- Enable mouse
vim.o.mouse = "a"

-- Cursorline and Signcolumn
vim.opt.cursorline = false
vim.wo.signcolumn = "yes"

-- Enable smooth scrolling
vim.opt.scrolloff = 25

-- Highlight current line number
vim.opt.relativenumber = true

-- Enable line wrapping
vim.opt.wrap = false

-- Show 80-character column marker
vim.opt.colorcolumn = ""

-- Enable auto-formatting
vim.opt.formatoptions = vim.opt.formatoptions + { 'r' }

-- Disable backups and swap files
vim.opt.backup = false
vim.opt.swapfile = false

-- Enable persistent undo
vim.opt.undodir = vim.fn.stdpath('config') .. "/undodir/"
vim.opt.undofile = true

-- File type detection
vim.opt.isfname = vim.opt.isfname + { "@-@" }

-- Add ** to search for files in subdirectories
vim.opt.path = vim.opt.path + { '**' }

-- Ignore node_modules directory while file navigation
vim.opt.wildignore = vim.opt.wildignore + { '*/node_modules/*' }

-- Set PUM (Popup Menu) blend
vim.opt.pumblend = 0

-- Enable transparent background for floating windows
vim.opt.winblend = 0

-- Enable true color support
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- Set timeout for key codes
vim.o.timeout = true
vim.o.timeoutlen = 5 * 1000

-- Set inccommand for live substitution preview
vim.opt.inccommand = 'nosplit'
