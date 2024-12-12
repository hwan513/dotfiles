local M = {}
local icons = require("john.misc.icons")

M.setup = function()
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.Hint,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.Info,
      },
    },
    virtual_text = false,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = true,
      header = "",
    },
  })

  -- Remove default lsp keymaps
  vim.keymap.del("n", "grn") -- Rename
  vim.keymap.del({ "n", "x" }, "gra") -- Code Action
  vim.keymap.del("n", "grr") -- References
  -- Setup lsp keymaps
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
