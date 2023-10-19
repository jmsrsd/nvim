local path = require 'utils.path'

--- @param callback function
--- @return unknown
---
return function(callback)
  local module = path.getparentmodule(callback)

  return require(module)
end
