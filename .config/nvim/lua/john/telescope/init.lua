local setup = require("john.utils").setup
return {
  "nvim-telescope/telescope.nvim",
  config = setup("john.interface.telescope"),
  keys = require("john.interface.telescope").keys,
  cmd = "Telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-frecency.nvim", commit = "39f70a87a271bbb76c86c73816597478dd6ad0a4" },
    "nvim-telescope/telescope-ui-select.nvim",
    "debugloop/telescope-undo.nvim",
    { "AckslD/nvim-neoclip.lua", event = "VeryLazy" },
  },
}
