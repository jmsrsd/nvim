local configure = function(module)
	return require("utils.import")(function(parent)
		return parent .. ".configs." .. module
	end, function() end).setup()
end

return {
	"tpope/vim-fugitive",

	dependencies = {
		"lewis6991/gitsigns.nvim",
	},

	config = function()
		vim.tbl_map(configure, {
			"fugitive",
			"gitsigns",
		})
	end,
}
