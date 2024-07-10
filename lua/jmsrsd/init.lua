local context = require("jmsrsd.commons.context").new({
	target = function() end,
})

vim.tbl_map(function(module)
	return context.import("./configs/" .. module)
end, {
	"options",
	"keymaps",
	"plugins",
})
