return function(f)
	return function()
		local ok, result = xpcall(f, function(error)
			return vim.notify(error .. "", vim.log.levels.ERROR)
		end)

		if ok then
			return result
		end

		return nil
	end
end
