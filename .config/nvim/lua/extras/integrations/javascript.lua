return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "prettierd", "biome", "ts_ls", "angularls" } },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome" },
        -- typescript = { "biome" },
        typescript = { "prettierd" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
      },
    },
  },
  --
}
