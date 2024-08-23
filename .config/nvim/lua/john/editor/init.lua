local prequire = require("john.utils").prequire
return {
  prequire("john.editor.bufferline"),
  prequire("john.editor.dropbar"),
  prequire("john.editor.lualine"),
  prequire("john.editor.nvim-tree"),
  prequire("john.editor.statuscol"),
  prequire("john.editor.toggleterm"),
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} }, -- need to finish which-key config
  -- { "nvimdev/dashboard-nvim", event = "VimEnter", opts = {} },
  { "rmagatti/auto-session", lazy = false, opts = { silent_restore = false } },
  prequire("john.editor.sniprun"),
}
