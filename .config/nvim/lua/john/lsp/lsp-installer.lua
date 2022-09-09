-- require statement {{{
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	print("nvim-lsp-installer failed to load")
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
	local extra_settings = { ["jdtls"] = true, ["sumneko_lua"] = true, ["rust_analyzer"] = true, ["ltex"] = true }
	if extra_settings[server.name] then
		local extra_opts = require("john.lsp.settings." .. server.name)
		opts = vim.tbl_deep_extend("force", extra_opts, opts)
	end
	server:setup(opts)
end)
-- }}}
-- vim:foldmethod=marker:foldlevel=2
