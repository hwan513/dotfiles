local keys = {
  { "n", "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "textDocument/definition" },
  { "n", "gD", vim.lsp.buf.declaration, desc = "Goto Declaration", has = "textDocument/declaration" },
  { "n", "gI", vim.lsp.buf.implementation, desc = "Goto Implementation", has = "textDocument/implementation" },
  { "n", "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition", has = "textDocument/typeDefinition" },
  { "n", "K", vim.lsp.buf.hover, desc = "Hover", has = "textDocument/hover" },
  { "n", "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "textDocument/signatureHelp" },
  { "i", "<C-s>", vim.lsp.buf.signature_help, desc = "Signature Help", has = "textDocument/signatureHelp" },
  { { "n", "v" }, "ga", vim.lsp.buf.code_action, desc = "Code Action", has = "textDocument/codeAction" },
  { "n", "gn", vim.lsp.buf.rename, desc = "Rename", has = "textDocument/rename" },
  { "n", "gr", vim.lsp.buf.references, desc = "References", has = "textDocument/references" },
  { "n", "<C-p>", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", desc = "Next Diagnostic" },
  { "n", "<C-n>", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", desc = "Previous Diagnostic" },
}

-- local client2 = vim.lsp.get_clients()[1]
-- -- local supports = client2.supports_method("textDocument/inlayHint")
-- local supports = client2.supports_method("textDocument/codeLens")
-- print(supports)
-- vim.lsp.codelens.refresh()
-- vim.lsp.codelens.get(0)

return function(buffer, client)
  local map = require("john.utils").map
  for _, key in ipairs(keys) do
    local mode, mapping, fn = unpack(key)
    if not key.has or client.supports_method(key.has) then
      map(mode, mapping, fn, { noremap = true, silent = true, buffer = buffer, desc = key.desc })
    end
  end
end
