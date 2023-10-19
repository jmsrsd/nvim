--- Leader
---
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- Indentation
---
vim.opt.breakindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

--- Folding
---
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

--- Clipboard
---
vim.opt.clipboard:append({
	"unnamed",
	"unnamedplus",
})

--- Search
---
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

--- Mouse
---
vim.opt.mouse = ""

--- Cursor
---
vim.opt.guicursor = "a:block,a:blinkon50"
vim.opt.cursorline = false
vim.wo.signcolumn = "yes"

--- Split
---
vim.opt.splitright = true

--- Scroll
---
vim.opt.scrolloff = 25

--- Line Number
---
vim.opt.number = true
vim.opt.relativenumber = true

--- Wrap
---
vim.opt.wrap = false

--- Color Column
---
vim.opt.colorcolumn = "80"

--- Format
---
vim.opt.formatoptions = vim.opt.formatoptions + { "r" }

--- Backup & Swapfile
---
vim.opt.backup = false
vim.opt.swapfile = false

--- File Name
---
vim.opt.isfname = vim.opt.isfname + { "@-@" }

--- Path
---
vim.opt.path = vim.opt.path + { "**" }

--- Wildignore
---
vim.opt.wildignore = vim.opt.wildignore + { "*/node_modules/*" }

--- Popup Menu
---
vim.opt.pumblend = 0
vim.opt.winblend = 0

--- Color
---
vim.opt.termguicolors = true

--- Timeout
---
vim.opt.timeout = true
vim.opt.timeoutlen = 300

--- Update
---
vim.opt.updatetime = 50

--- Incremental Command
---
vim.opt.inccommand = "nosplit"

--- Spell Check
---
vim.o.spell = false
vim.o.spelllang = ""

--- List
---
vim.opt.list = true
vim.opt.listchars = table.concat({
	"tab:→ ",
	"space:·",
	"nbsp:␣",
	"trail:~",
	"precedes:«",
	"extends:»",
}, ",")

--- Undo
---
if vim.fn.has("persistent_undo") == 1 then
	local config_path = vim.fn.stdpath("config")
	local target_path = config_path .. "/undodir/"

	if vim.fn.isdirectory(target_path) then
		vim.fn.mkdir(target_path, "p", 0777)
	end

	vim.opt.undodir = target_path
	vim.opt.undofile = true
end
