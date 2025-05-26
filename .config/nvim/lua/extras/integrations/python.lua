return {
  { "linux-cultist/venv-selector.nvim", branch = "regexp", cmd = { "VenvSelect" }, opts = {}, ft = "python" },

  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = { "ruff", "ty" } } },
  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { python = { "ruff_fix", "ruff_format", "ruff_organize_imports" } } },
  },
}
