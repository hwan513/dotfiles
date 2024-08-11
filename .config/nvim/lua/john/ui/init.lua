return {
  -- yazi is on the radar
  require("john.ui.nvim-tree"),
  require("john.ui.mini-icons"),
  require("john.ui.mini-bufremove"),
  require("john.ui.mini-hipatterns"),
  require("john.ui.bufferline"),
  require("john.ui.lualine"),
  require("john.ui.dropbar"),
  { "stevearc/oil.nvim", opts = { view_options = { show_hidden = true } } },
}
