-- require statement {{{
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end
-- }}}
-- Include default servers to install {{{
local servers = {
	"pyright",
	"clangd",
	"sumneko_lua",
}
for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found and not server:is_installed() then
		print("Installing " .. name)
		server:install()
	end
end
-- }}}
-- initalising lsp {{{
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("john.lsp.handlers").on_attach,
		capabilities = require("john.lsp.handlers").capabilities,
	}
	-- addtional settings {{{
	-- if server.name == "jsonls" then
	-- 	local jsonls_opts = require("john.lsp.settings.jsonls")
	-- 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	-- end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("john.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end
	if server.name == "rust_analyzer" then
		local rust_opts = require("john.lsp.settings.rust-analyzer")
		opts = vim.tbl_deep_extend("force", rust_opts, opts)
	end
	if server.name == "ltex" then
		local rust_opts = require("john.lsp.settings.ltex")
		opts = vim.tbl_deep_extend("force", rust_opts, opts)
	end

	-- if server.name == "pyright" then
	-- 	local pyright_opts = require("john.lsp.settings.pyright")
	-- 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	-- end
	-- }}}

	server:setup(opts)
end)
-- }}}
-- vim:foldmethod=marker:foldlevel=2
