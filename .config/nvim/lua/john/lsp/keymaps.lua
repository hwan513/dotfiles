-- stylua: ignore start
local keys = {
  { "n", "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" },
  { "n", "gD", vim.lsp.buf.declaration, desc = "Goto Declaration", has = "declaration" },
  { "n", "gI", vim.lsp.buf.implementation, desc = "Goto Implementation", has = "implementation" },
  { "n", "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition", has = "typeDefinition" },
  { "n", "K", vim.lsp.buf.hover, desc = "Hover", has = "hover" },
  { "n", "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
  { "i", "<C-s>", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
  { { "n", "x" }, "ga", vim.lsp.buf.code_action, desc = "Code Action", has = "codeAction" },
  { { "n", "x" }, "gl", vim.lsp.codelens.run, desc = "Run Codelens", has = "codeLens" },
  { "n", "gL", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", has = "codeLens" },
  { "n", "gh", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", desc = "Toggle Inlay Hints", has = "inlayHint" },
  { "n", "gn", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
  { "n", "gr", vim.lsp.buf.references, desc = "References", has = "references" },
  { "n", "<C-p>", "<cmd>lua vim.diagnostic.jump({count= -1})<CR>", desc = "Next Diagnostic" },
  { "n", "<C-n>", "<cmd>lua vim.diagnostic.jump({count= 1})<CR>", desc = "Previous Diagnostic" },
}
-- stylua: ignore end

--- @param buffer number
--- @param client vim.lsp.Client
local function setup(buffer, client)
  local map = require("john.utils").map
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
