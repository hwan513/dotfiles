local prequire = require("john.utils").prequire
local req = require("john.utils").req

return {
  -- yazi is on the radar
  prequire("john.ui.nvim-tree"),
  prequire("john.ui.mini-icons"),
  prequire("john.ui.mini-bufremove"),
  prequire("john.ui.mini-hipatterns"),
  prequire("john.ui.bufferline"),
  prequire("john.ui.lualine"),
  { "stevearc/oil.nvim", opts = { view_options = { show_hidden = true } } },
}
