local lspkind = require("lspkind")

local custom_lspkinds = {
	["codeium"] = "",
}

return {
	fields = {
		"menu",
		"abbr",
		"kind",
	},
	format = lspkind.cmp_format({
		mode = "text",

		before = function(entry, vim_item)
			local name = entry.source.name

			name = name:lower()
			name = name:gsub("_", "")
			name = name:gsub("[aiueo]", "")
			name = name:gsub("nvm", "")

			local name_letters = {}

			for n in name:gmatch(".") do
				table.insert(name_letters, n)
			end

			for key, _ in ipairs(name_letters) do
				if key == #name_letters then
					break
				end

				local next_key = key + 1
				local value = name_letters[key]

				if value == name_letters[next_key] then
					name_letters[next_key] = ""
				end
			end

			name = table.concat(name_letters, "")
			name = name:upper()

			vim_item.menu = custom_lspkinds[entry.source.name:lower()]
				or lspkind.presets.default[vim_item.kind]
				or ""

			vim_item.kind = name

			return vim_item
		end,
	}),
}
