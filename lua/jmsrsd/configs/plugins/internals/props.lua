--- @class PluginProps
--- @field import ContextImport
--- @field specs string[]

--- @param context Context
--- @return PluginProps
return function(context)
	return {
		import = context.import,
		specs = {
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
		},
	}
end
