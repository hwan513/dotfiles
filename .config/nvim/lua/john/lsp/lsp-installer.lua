-- require statement {{{
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	print("nvim-lsp-installer failed to load")
	return
end

local lspconfig = require("lspconfig")

-- }}}
-- Include default servers to install {{{
local servers = {
	"clangd",
	"cssls",
	"emmet_ls",
	"html",
	"jdtls",
	"jsonls",
	"ltex",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tsserver",
	"vimls",
}

lsp_installer.setup({
	ensure_installed = servers,
})

-- see Neovim from Scratch
for _, server in pairs(servers) do
	local opts = {
		on_attach = require("john.lsp.handlers").on_attach,
		capabilities = require("john.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "john.lsp.settings." .. server)
	-- use personal custom options if they exist
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
