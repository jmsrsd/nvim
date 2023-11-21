--- @diagnostic disable: duplicate-set-field, inject-field
---

local import = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		return parent .. "." .. module
	end, function() end)
end

local module = function(name)
	return import("modules." .. name)
end

return {
	"neovim/nvim-lspconfig",

	event = "VeryLazy",

	dependencies = module("dependencies"),

	config = module("config"),
}
