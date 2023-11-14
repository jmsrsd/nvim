local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=main",
		lazy_path,
	})
end

vim.opt.rtp:prepend(lazy_path)

local path = require("jmsrsd.utils.path")

local lazy = require("lazy")

local lazy_modules = ""

lazy_modules = path.get_relative_module_path("modules", function() end)

lazy_modules = path.to_module(lazy_modules)

local lazy_options = {
	change_detection = {
		notify = false,
	},
}

lazy.setup(lazy_modules, lazy_options)
