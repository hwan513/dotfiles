local bacon_enabled = false
if bacon_enabled then
  vim.lsp.enable("bacon_ls")
end
local bacon_spec = bacon_enabled
    and {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = { ensure_installed = { "bacon", "bacon-ls" } },
    }
  or {}

vim.lsp.config("rust-analyzer", {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = not bacon_enabled,
      diagnostics = { enable = not bacon_enabled },
      check = { command = "clippy", extraArgs = { "--no-deps" } },
      cargo = { targetDir = true, features = "all" },
    },
  },
})

return {
  { "rayliwell/tree-sitter-rstml", dependencies = { "nvim-treesitter" }, ft = "rust", opts = {} },
  -- Install rust-analyzer with the corresponding toolchain and `rustup component add rust-analyzer`.
  bacon_spec,
  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = { "bacon", "bacon-ls" } } },
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
