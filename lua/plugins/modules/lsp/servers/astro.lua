--- Language:
---
--- Astro
---
--- Prerequisite:
---
--- npm install -g @astrojs/language-server
---

local lspconfig = require("lspconfig")

lspconfig.astro.setup({})
