local prequire = require("john.utils").prequire
local setup = require("john.utils").setup
local req = require("john.utils").req

return {
  -- yazi is on the radar
  prequire("john.ui.nvim-tree"),
  prequire("john.ui.mini-icons"),
  prequire("john.ui.mini-bufremove"),
  prequire("john.ui.mini-hipatterns"),
  { "stevearc/oil.nvim", opts = { view_options = { show_hidden = true } } },
  { "akinsho/bufferline.nvim", event = "VeryLazy", config = req("john.interface.bufferline") },
  { "nvim-lualine/lualine.nvim", event = "VeryLazy", config = req("john.interface.lualine") }, -- status line plugin
}
