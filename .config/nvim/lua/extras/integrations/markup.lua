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
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    cmd = { "PasteImage", "ImgClipDebug", "ImgClipConfig" },
    opts = { default = { drag_and_drop = { insert_mode = true } } },
    keys = { { "<leader>P", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" } },
  },
}
