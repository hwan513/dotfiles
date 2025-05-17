local prequire = require("config.utils").prequire
return {
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} }, -- need to finish which-key config
  { "nvimdev/dashboard-nvim", enabled = false, event = "VimEnter", opts = {} },
  prequire("john.editor.auto-session"),
  { "MagicDuck/grug-far.nvim", opts = {} },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" } },
  },
  prequire("john.editor.multicursor"),
}
