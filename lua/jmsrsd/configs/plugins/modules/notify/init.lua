local priority = require("jmsrsd.utils.priority")

local configure = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		return parent .. ".configs." .. module
	end, function() end).setup()
end

return {

	"rcarriga/nvim-notify",

	dependencies = {
		"mrded/nvim-lsp-notify",
	},

	priority = priority.order(1),

	config = function()
		vim.tbl_map(configure, {
			"notify",
			"lsp_notify",
		})
	end,
}
