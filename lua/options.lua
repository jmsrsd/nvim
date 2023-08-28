-- Leader and Local Leader key mappings
--
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Indentation
--
vim.opt.breakindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- Clipboard
--
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

-- Case sensitivity
--
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight search results
--
vim.opt.hlsearch = false

-- Incremental search
--
vim.opt.incsearch = true

-- Disable mouse
--
vim.opt.mouse = ''

-- Cursorline and Signcolumn
--
vim.opt.cursorline = false
vim.wo.signcolumn = 'yes'

-- Enable smooth scrolling
--
vim.opt.scrolloff = 25

-- Highlight current line number
--
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable line wrapping
--
vim.opt.wrap = false

-- Enable column marker
--
vim.opt.colorcolumn = '80'

-- Enable auto-formatting
--
vim.opt.formatoptions = vim.opt.formatoptions + { 'r' }

-- Disable backups and swap files
--
vim.opt.backup = false
vim.opt.swapfile = false

-- File type detection
--
vim.opt.isfname = vim.opt.isfname + { '@-@' }

-- Add ** to search for files in subdirectories
--
vim.opt.path = vim.opt.path + { '**' }

-- Ignore node_modules directory while file navigation
--
vim.opt.wildignore = vim.opt.wildignore + { '*/node_modules/*' }

-- Set PUM (Popup Menu) blend
--
vim.opt.pumblend = 0

-- Enable transparent background for floating windows
--
vim.opt.winblend = 0

-- Enable true color support
--
vim.opt.termguicolors = true

-- Set timeout for key codes (folke/which-key.nvim recommendation)
--
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Decrease update time
--
vim.opt.updatetime = 50

-- Set inccommand for live substitution preview
--
vim.opt.inccommand = 'nosplit'

-- Disable spell-checking
--
vim.o.spell = false
vim.o.spelllang = ''

-- Show hidden symbols
--
vim.opt.list = true

-- Show hidden chars
--
vim.opt.listchars = table.concat(
  {
    'tab:→ ',
    'space:·',
    'nbsp:␣',
    'trail:~',
    'precedes:«',
    'extends:»',
  }, ',' -- comma separated
)

-- Caret
--
vim.opt.guicursor = 'a:block,a:blinkon50'

-- Enable persistent undo
--
local has_persistent_undo = vim.fn.has 'persistent_undo'

if has_persistent_undo == 1 then
  local config_path = vim.fn.stdpath 'config'
  local target_path = config_path .. '/undodir/'

  if vim.fn.isdirectory(target_path) then
    vim.fn.mkdir(target_path, 'p', 0777)
  end

  vim.opt.undodir = target_path
  vim.opt.undofile = true
end

