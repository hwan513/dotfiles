local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end
require("john.lsp.lsp-installer")
require("john.lsp.handlers").setup()
require("john.lsp.null-ls")
