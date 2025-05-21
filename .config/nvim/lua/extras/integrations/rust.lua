vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = { command = "clippy" },
      cargo = { targetDir = true },
    },
  },
})

return {
  { "rayliwell/tree-sitter-rstml", dependencies = { "nvim-treesitter" }, ft = "rust", opts = {} },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = { "rust-analyzer" } } },
  { "mason-org/mason-lspconfig.nvim", opts = { automatic_enable = { exclude = { "rust-analyzer" } } } },
  { "stevearc/conform.nvim", opts = { formatters_by_ft = { rust = { "leptosfmt", "rustfmt" } } } },
  { "mrcjkb/rustaceanvim", version = "^6", lazy = false },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      completion = { crates = { enabled = true } },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
}
