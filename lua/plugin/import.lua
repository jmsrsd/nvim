return function(modname)
  modname = 'plugin.lib.' .. modname

  return require(modname)
end
