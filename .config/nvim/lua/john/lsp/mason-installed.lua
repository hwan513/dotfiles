---@type string[]
local servers = {
  "basedpyright",
  "bashls",
  "biome",
  "clangd",
  "cssls",
  -- "css_variables",
  "emmet_ls",
  "eslint",
  "gopls",
  "html",
  "jdtls",
  "lemminx",
  "ltex",
  "lua_ls",
  "marksman",
  "omnisharp",
  "rust_analyzer",
  "ruff",
  "taplo",
  "texlab",
  "tinymist",
  "ts_ls",
  "vimls",
}
local linters = {
  "shellcheck",
}
local formatters = {
  "prettierd",
  "goimports",
  "shfmt",
  "stylua",
}
return {
  servers = servers,
  linters = linters,
  formatters = formatters,
}
