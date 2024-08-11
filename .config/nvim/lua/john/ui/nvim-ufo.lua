return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  opts = {},
  event = "VeryLazy",
  keys = {
    { "zR", "<cmd>lua require('ufo').openAllFolds()<cr>", desc = "Open all folds" },
    { "zM", "<cmd>lua require('ufo').closeAllFolds()<cr>", desc = "Close all folds" },
    { "zr", "<cmd>lua require('ufo').openFoldsExceptKinds()<cr>", desc = "Fold less " },
    { "zm", "<cmd>lua require('ufo').closeFoldsWith()<cr>", desc = "Fold more " },
    { "zk", "<cmd>lua require('ufo').peekFoldedLinesUnderCursor()<cr>", desc = "Peek fold" },
  },
}
