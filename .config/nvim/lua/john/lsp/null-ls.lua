local formatters = {
  "stylua",
  -- "black",
  "shfmt",
  "shellharden",
  "prettierd",
}

local linters = {
}

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {}
local ensure_installed = {}
for _, formatter in ipairs(formatters) do
  table.insert(sources, formatting[formatter])
  table.insert(ensure_installed, formatter)
end
for _, linter in ipairs(linters) do
  table.insert(sources, diagnostics[linter])
  table.insert(ensure_installed, linter)
end

null_ls.setup({
  sources = sources,
})

-- require("mason-null-ls").setup({
--  ensure_installed = ensure_installed,
--  automatic_installation = true,
-- })
-- require("mason-null-ls").check_install()

require("mason-tool-installer").setup({
  ensure_installed = ensure_installed,
  automatic_installation = true,
})
