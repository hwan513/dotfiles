local servers = require("john.lsp.mason-installed").servers
local disabled_servers = { ["rust_analyzer"] = false, ["jdtls"] = false }
for _, server in pairs(servers) do
  vim.lsp.enable(server, disabled_servers[server])
  local has_custom_opts, custom_opts = pcall(require, "john.lsp.settings." .. server)
  if has_custom_opts then -- use personal custom options if they exist
    vim.lsp.config(server, custom_opts)
  end
end
