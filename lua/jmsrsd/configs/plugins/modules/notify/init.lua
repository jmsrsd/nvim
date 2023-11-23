local priority = require("jmsrsd.utils.priority")

local configure = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		return parent .. ".configs." .. module
	end, function() end).setup()
end

return {

	"rcarriga/nvim-notify",

	priority = priority.order(1),

	lazy = false,

	dependencies = {
		"mrded/nvim-lsp-notify",
	},

	config = function()
		vim.tbl_map(configure, {
			"notify",
			--- UNUSED: "lsp_notify",
		})
	end,
}
