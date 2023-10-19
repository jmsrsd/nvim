local import = function(name)
  return require 'utils.import' (function(base)
    return base .. '.modules.' .. name
  end)
end

import 'diagnostic'
import 'lsp'
