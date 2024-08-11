local prequire = require("john.utils").prequire
return {
  -- yazi is on the radar
  prequire("john.ui.nvim-tree"),
  prequire("john.ui.mini-icons"),
  prequire("john.ui.mini-bufremove"),
  prequire("john.ui.mini-hipatterns"),
  prequire("john.ui.bufferline"),
  prequire("john.ui.lualine"),
  { "Bekaboo/dropbar.nvim", dependencies = { "nvim-telescope/telescope-fzf-native.nvim" }, event = "LspAttach" },
  { "stevearc/oil.nvim", opts = { view_options = { show_hidden = true } } },
}
