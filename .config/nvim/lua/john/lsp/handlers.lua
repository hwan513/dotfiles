local M = {}

M.setup = function()
  require("john.lsp.options")
  require("john.lsp.keymaps")
end

M.capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  end
  return capabilities
end

return M
