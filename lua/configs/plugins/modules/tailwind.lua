return {

	"laytan/tailwind-sorter.nvim",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
	},

	build = "cd formatter && npm i && npm run build",

	config = function()
		local tailwind_sorter = require("tailwind-sorter")

		tailwind_sorter.setup({
			on_save_enabled = true,
			on_save_pattern = {
				"*.html",
				"*.js",
				"*.jsx",
				"*.tsx",
				"*.twig",
				"*.hbs",
				"*.php",
				"*.heex",
				"*.astro",
			}, -- The file patterns to watch and sort.
			node_path = "node",
		})
	end,
}
