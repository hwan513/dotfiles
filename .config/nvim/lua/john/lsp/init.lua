local prequire = require("utils").prequire

prequire("lspconfig")
prequire("john.lsp.mason")
prequire("john.lsp.handlers").setup()
prequire("john.lsp.null-ls")
