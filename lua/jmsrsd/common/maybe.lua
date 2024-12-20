--- @class Maybe
--- @field getOrElse fun(default: any): any
--- @field isSome fun(): boolean

--- @return Maybe
return function(value)
	local self = {}

	self.isSome = function()
		return value ~= nil
	end

	self.getOrElse = function(default)
		if value ~= nil then
			return value
		end

		return default
	end

	return self
end
