return {
  "Bekaboo/dropbar.nvim",
  dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
  event = "LspAttach",
  keys = { { "gp", "<cmd>lua require('dropbar.api').pick()<cr>", desc = "Focus Lsp Context" } },
  commit = "d26bf92161cd70e049dc138b44ffa0246dbf7178",
}
