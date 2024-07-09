local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"

	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local context = require("jmsrsd.commons.context").new({
	target = function() end,
})

local spec = function(name)
	return context.import("./specs/" .. name)
end

local spec_names = {
	"catppuccin",
	"oil",
	"treesitter",
	"autopairs",
	"fidget",
	"which_key",
	"telescope",
	"comment",
	"fugitive",
	"barbecue",
	"dressing",
	"lualine",
	"tmux_navigator",
	"cmp",
	"mason",
	"lspconfig",
	"mason_conform",
	"trim",
}

local specs = {}

for index, name in ipairs(spec_names) do
	local s = spec(name)

	s.priority = 1000 - index

	table.insert(specs, s)
end

require("lazy").setup({
	ui = {
		border = "rounded",
	},

	change_detection = {
		notify = false,
	},

	spec = specs,
})
