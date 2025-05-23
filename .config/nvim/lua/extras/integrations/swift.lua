vim.lsp.enable("sourcekit")
return {
  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = { "swiftlint" } } },
  { "mfussenegger/nvim-lint", opts = { linters_by_ft = { swift = { "swiftlint" } } } },
}
