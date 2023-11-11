local import = function(module)
	return require("utils.import")(function(parent)
		return parent .. ".configs." .. module
	end, function() end)
end

return {
	"tpope/vim-fugitive",

	dependencies = {
		"lewis6991/gitsigns.nvim",
	},

	config = function()
		import("gitsigns").setup()
	end,
}
