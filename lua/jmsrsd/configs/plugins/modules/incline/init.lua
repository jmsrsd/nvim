local import = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		return parent .. "." .. module
	end, function() end)
end

return {
	"b0o/incline.nvim",

	event = "VeryLazy",

	dependencis = {
		"nvim-tree/nvim-web-devicons",
	},

	config = import("config"),
}
