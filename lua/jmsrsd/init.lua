local configs = function(module)
	module = "jmsrsd.configs." .. module

	return require(module)
end

configs "options"
configs "keymaps"
configs "plugins"
