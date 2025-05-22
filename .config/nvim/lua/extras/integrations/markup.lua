local ltex_enabled = false
vim.lsp.config("ltex_plus", {
  settings = {
    ltex = {
      language = "en-NZ",
      additionalRules = { enablePickyRules = true },
      checkFrequency = "save",
      disabledRules = { ["en-NZ"] = { "PROFANITY" } },
    },
  },
})

return {
  {
    "barreiroleo/ltex_extra.nvim",
    enabled = ltex_enabled,
    branch = "dev",
    opts = { load_langs = { "en-NZ" } },
    ft = { "markdown", "tex", "text", "typst" },
  },
  { "OXY2DEV/markview.nvim", lazy = false },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { ltex_enabled and "ltex_plus" or nil, "harper_ls" } },
  },
}
