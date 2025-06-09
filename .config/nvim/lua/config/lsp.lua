local icons = require("config.icons")

-- Diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.Hint,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.Info,
    },
  },
  float = {
    show_header = true,
    source = "if_many",
    border = "rounded",
    focusable = false,
  },
  severity_sort = true,
})

-- code adapted from https://www.reddit.com/r/neovim/comments/1jm5atz/comment/mk9w6v0/
local is_virtual_line = true
--- Only show diagnostics after a jump has occurred
---@param jump_count number
local function better_diagnostic_jump(jump_count)
  -- Prevents CursorMoved autocmd from re-triggering when jumping consecutively when virtual lines is set
  if is_virtual_line then
    pcall(vim.api.nvim_del_augroup_by_name, "better_diagnostic_jump")
  end
  vim.diagnostic.jump({
    count = jump_count,
    on_jump = function()
      if is_virtual_line then
        vim.diagnostic.config({ virtual_lines = { current_line = true } })
        vim.api.nvim_create_autocmd("CursorMoved", {
          group = vim.api.nvim_create_augroup("better_diagnostic_jump", {}),
          once = true,
          callback = function()
            vim.diagnostic.config({ virtual_lines = false })
          end,
        })
      else
        vim.diagnostic.open_float()
      end
    end,
  })
end
vim.api.nvim_create_user_command("ToggleDiagnostic", function()
  is_virtual_line = not is_virtual_line
end, { desc = "Toggle between virtual line and floating window for diagnostics" })

-- Keymaps
-- stylua: ignore start
local keys = {
  -- { "n", "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" },
  -- { "n", "gD", vim.lsp.buf.declaration, desc = "Goto Declaration", has = "declaration" },
  -- { "n", "gI", vim.lsp.buf.implementation, desc = "Goto Implementation", has = "implementation" },
  -- { "n", "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition", has = "typeDefinition" },
  -- { "n", "gr", vim.lsp.buf.references, desc = "References", has = "references" },
  { "n", "K", vim.lsp.buf.hover, desc = "Hover", has = "hover" },
  { "n", "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
  { "i", "<C-s>", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
  { { "n", "x" }, "ga", vim.lsp.buf.code_action, desc = "Code Action", has = "codeAction" },
  { { "n", "x" }, "gl", vim.lsp.codelens.run, desc = "Run Codelens", has = "codeLens" },
  { "n", "gL", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", has = "codeLens" },
  { "n", "gh", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", desc = "Toggle Inlay Hints", has = "inlayHint" },
  { "n", "gn", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
  { "n", "<C-p>", function() better_diagnostic_jump(-1) end, desc = "Previous Diagnostic" },
  { "n", "<C-n>", function() better_diagnostic_jump(1) end, desc = "Next Diagnostic" },
}
-- stylua: ignore end

--- @param buffer number
--- @param client vim.lsp.Client
local function setup(buffer, client)
  local map = require("config.utils").map
  for _, key in ipairs(keys) do
    if not key.has or client:supports_method("textDocument/" .. key.has) then
      map(key[1], key[2], key[3], { noremap = true, silent = true, buffer = buffer, desc = key.desc })
    end
  end
end

-- Remove default lsp keymaps
vim.keymap.del("n", "grn") -- Rename
vim.keymap.del({ "n", "x" }, "gra") -- Code Action
vim.keymap.del("n", "grr") -- References

-- Register keymap autocommand
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buffer = args.buf ---@type number
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client ~= nil then
      setup(buffer, client)
    end
  end,
})
