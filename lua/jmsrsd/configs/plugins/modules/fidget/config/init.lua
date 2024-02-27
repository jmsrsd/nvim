local import = function(module)
	return require("jmsrsd.utils.import")(function(parent)
		return parent .. "/modules/" .. module
	end, function() end)
end

return function()
	--- Setup fidget.nvim
	---
	local fidget = import("fidget").setup()

	--- Override vim.notify
	---
	vim.notify = import("notification").of(fidget).notify
end
