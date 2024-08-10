local prequire = require("john.utils").prequire
local setup = require("john.utils").setup
local req = require("john.utils").req

return {
  prequire("john.ui.nvim-tree"),
  { "stevearc/oil.nvim", opts = { view_options = { show_hidden = true } } },
  { "akinsho/bufferline.nvim", event = "VeryLazy", config = req("john.interface.bufferline") },
  { "famiu/bufdelete.nvim", cmd = "Bdelete" }, -- delete buffers nicely
  { "nvim-lualine/lualine.nvim", event = "VeryLazy", config = req("john.interface.lualine") }, -- status line plugin
  { "norcalli/nvim-colorizer.lua", event = { "BufNewFile", "BufReadPre" }, config = setup("colorizer") }, -- coloring viewer for html css stuff
}
