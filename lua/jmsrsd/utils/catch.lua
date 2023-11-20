return function(fn)
	return function()
		return xpcall(fn, function(error)
			return vim.notify(error .. "", vim.log.levels.ERROR)
		end)
	end
end
