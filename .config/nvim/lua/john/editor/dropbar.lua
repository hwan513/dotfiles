return {
  "Bekaboo/dropbar.nvim",
  dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
  event = "LspAttach",
  keys = { { "gp", "<cmd>lua require('dropbar.api').pick()<cr>", desc = "Focus Dropbar" } },
}
