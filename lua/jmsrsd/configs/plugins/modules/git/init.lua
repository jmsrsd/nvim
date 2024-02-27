local configure = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		return parent .. "/configs/" .. module
	end, function() end).setup()
end

return {
	"tpope/vim-fugitive",

	event = "VeryLazy",

	dependencies = {
		{ "lewis6991/gitsigns.nvim", event = "VeryLazy" },
	},

	config = function()
		vim.tbl_map(configure, {
			"fugitive",
			"gitsigns",
		})
	end,
}
