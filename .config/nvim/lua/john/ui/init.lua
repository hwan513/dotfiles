local prequire = require("john.utils").prequire
return {
  -- yazi is on the radar
  prequire("john.ui.mini-hipatterns"),
  prequire("john.ui.mini-icons"),
  prequire("john.ui.nvim-ufo"),
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = { view_options = { show_hidden = true } },
    keys = { { "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil" } },
  },
}
