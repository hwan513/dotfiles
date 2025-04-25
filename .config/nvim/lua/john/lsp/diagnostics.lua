local icons = require("john.misc.icons")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.Hint,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.Info,
    },
  },
  virtual_lines = {
    current_line = true,
  },
  severity_sort = true,
})

vim.api.nvim_create_user_command("ToggleDiagnostic", function()
  vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
end, { desc = "Toggle virtual lines for diagnostics" })
