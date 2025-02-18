local setup = require("john.utils").setup
return {
  "nvim-telescope/telescope.nvim",
  config = setup("john.interface.telescope"),
  keys = require("john.interface.telescope").keys,
  cmd = "Telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-frecency.nvim" },
    "nvim-telescope/telescope-ui-select.nvim",
    "debugloop/telescope-undo.nvim",
    { "AckslD/nvim-neoclip.lua", event = "VeryLazy" },
  },
}
