--- @diagnostic disable: duplicate-set-field
---

local import = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		return parent .. "/" .. module
	end, function() end)
end

return {

	"j-hui/fidget.nvim",

	lazy = false,

	config = import("config"),
}
