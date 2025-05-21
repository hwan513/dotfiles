return {
  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = { "biome", "ts_ls" } } },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
      },
    },
  },
  --
}
