return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "cssls",
        "css_variables",
        "emmet_language_server",
        "html",
        "prettierd",
      },
    },
  },
  { "stevearc/conform.nvim", opts = { formatters_by_ft = { css = { "biome" }, html = { "prettierd" } } } },
  { "OXY2DEV/markview.nvim", opts = { preview = { filetypes = { "html" } } } },
}
