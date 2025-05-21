return {
  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = { "biome" } } },
  { "stevearc/conform.nvim", opts = { formatters_by_ft = { json = { "biome" } } } },
}
