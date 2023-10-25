--- Language:
---
--- Typescript
---
--- Prerequisite:
---
--- npm install -g typescript typescript-language-server
---

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({})
