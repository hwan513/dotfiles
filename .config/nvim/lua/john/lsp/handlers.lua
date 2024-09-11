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

  vim.lsp.inlay_hints = {
    enabled = true,
  }
  vim.api.nvim_create_user_command("ToggleInlay", function()
    local inlay_hint = vim.lsp.inlay_hint
    inlay_hint.enable(not inlay_hint.is_enabled())
  end, { nargs = 0 })

  -- Remove default lsp keymaps
  vim.keymap.del("n", "grn") -- Rename
  vim.keymap.del({ "n", "x" }, "gra") -- Code Action
  vim.keymap.del("n", "grr") -- References

  -- Register keymaps
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf ---@type number
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      require("john.lsp.keymaps")(buffer, client)
    end,
  })
end

M.on_attach = function(client, buffer)
  -- require("john.lsp.keymaps")(buffer)
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
