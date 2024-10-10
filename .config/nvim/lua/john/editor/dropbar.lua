return {
  "Bekaboo/dropbar.nvim",
  dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
  event = "LspAttach",
  lazy = false,
  keys = { { "gp", "<cmd>lua require('dropbar.api').pick()<cr>", desc = "Focus Dropbar" } },
}
