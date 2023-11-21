return function(f)
	return function()
		local ok, result = xpcall(f, function(error)
			return vim.notify(error .. "", vim.log.levels.ERROR)
		end)

		return ok and result or nil
	end
end
