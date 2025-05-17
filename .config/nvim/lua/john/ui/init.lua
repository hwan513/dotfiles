local prequire = require("config.utils").prequire
return {
  -- yazi is on the radar
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = { view_options = { show_hidden = true } },
    keys = { { "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil" } },
  },
}
