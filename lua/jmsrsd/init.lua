local context = require("jmsrsd.commons.context").new({
	target = function() end,
})

local import = context.import

local modules = {
	"options",
	"keymaps",
	"plugins",
}

local prepend = function(module)
	return "./configs/" .. module
end

modules = vim.tbl_map(prepend, modules)

modules = vim.tbl_map(import, modules)
