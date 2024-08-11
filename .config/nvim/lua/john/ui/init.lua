return {
  -- yazi is on the radar
  require("john.ui.nvim-tree"),
  require("john.ui.mini-icons"),
  require("john.ui.mini-bufremove"),
  require("john.ui.mini-hipatterns"),
  require("john.ui.bufferline"),
  require("john.ui.lualine"),
  { "Bekaboo/dropbar.nvim", dependencies = { "nvim-telescope/telescope-fzf-native.nvim" }, event = "LspAttach" },
  { "stevearc/oil.nvim", opts = { view_options = { show_hidden = true } } },
}
