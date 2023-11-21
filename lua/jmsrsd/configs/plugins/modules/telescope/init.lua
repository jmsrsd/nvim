local priority = require("jmsrsd.utils.priority")

local import = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		return parent .. "." .. module
	end, function() end)
end

local module = function(name)
	return import("modules." .. name)
end

return {

	"nvim-telescope/telescope.nvim",

	lazy = "VeryLazy",

	priority = priority.order(2),

	dependencies = module("dependencies"),

	config = module("config"),
}
