--- Language:
---
--- PHP
---
--- Prerequisite:
---
--- aria2c "https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar"
---

local lspconfig = require("lspconfig")

lspconfig.phpactor.setup({})
