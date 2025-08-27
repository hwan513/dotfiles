vim.lsp.config("rust-analyzer", {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = true,
      check = { command = "clippy", extraArgs = { "--no-deps" } },
      cargo = { targetDir = true, features = "all" },
    },
  },
})

return {
  { "rayliwell/tree-sitter-rstml", dependencies = { "nvim-treesitter" }, ft = "rust", opts = {} },
  -- Install rust-analyzer with the corresponding toolchain and `rustup component add rust-analyzer`.
  { "stevearc/conform.nvim", opts = { formatters_by_ft = { rust = { "leptosfmt", "rustfmt" } } } },
  { "mrcjkb/rustaceanvim", version = "^6", lazy = false },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      completion = { crates = { enabled = true } },
      lsp = { enabled = true, actions = true, completion = true, hover = true },
    },
  },
}
