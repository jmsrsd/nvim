--- Installation
---
local datapath = vim.fn.stdpath("data")
local lazypath = datapath .. "/lazy/lazy.nvim"
local lazy_installed = vim.fn.filereadable(lazypath) == 1

if not lazy_installed then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

--- Setup
---
local lazy = require("lazy")
local use = require("plugins.util").use

lazy.setup({
	-- use("poimandres"), -- Unused
	use("vscode"),
	use("transparent"),
	use("oil"),
	use("comment"),
	use("treesitter"),
	use("treesitter_context"),
	use("conform"),
	use("notify"),
	use("telescope"),
	use("fidget"),
	use("autopairs"),
	use("cmp"),
	use("trouble"),
	use("lspconfig"),
	use("dressing"),
	use("flutter"),
	use("close_buffers"),
	use("gitsigns"),
	use("which_key"),
	use("lualine"),
	use("blankline"),
})
