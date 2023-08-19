local load_setup = function(name)
  return require('plugin.lib.' .. name)
end

local setups = {
  load_setup 'lsp-zero.keymap.base',
  load_setup 'null-ls.keymap',
}

return function(client, bufnr)
  for _, setup in ipairs(setups) do
    setup(client, bufnr)
  end
end
