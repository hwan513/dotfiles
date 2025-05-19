vim.lsp.config("bashls", {
  filetypes = { "sh", "zsh", "bash" },
})

return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "bashls", "shfmt", "shellcheck" } }, -- I believe shellcheck gets run by bashls
  },
  { "stevearc/conform.nvim", opts = { formatters_by_ft = { zsh = { "shfmt" }, bash = { "shfmt" } } } },
}
