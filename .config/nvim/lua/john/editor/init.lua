local prequire = require("john.utils").prequire
return {
  prequire("john.editor.lualine"),
  prequire("john.editor.barbar"),
  prequire("john.editor.scope"),
  prequire("john.editor.dropbar"),
  prequire("john.editor.nvim-tree"),
  prequire("john.editor.statuscol"),
  prequire("john.editor.toggleterm"),
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} }, -- need to finish which-key config
  { "nvimdev/dashboard-nvim", enabled = false, event = "VimEnter", opts = {} },
  prequire("john.editor.sniprun"),
  prequire("john.editor.auto-session"),
  { "MagicDuck/grug-far.nvim", opts = {} },
  prequire("john.editor.satellite"),
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" } },
  },
  prequire("john.editor.multicursor"),
}
