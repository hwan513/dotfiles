local setup = require("john.utils").setup
return {
  "nvim-telescope/telescope.nvim",
  config = setup("john.interface.telescope"),
  keys = require("john.interface.telescope").keys,
  cmd = "Telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "debugloop/telescope-undo.nvim",
    {
      "ahmedkhalf/project.nvim",
      event = "VeryLazy",
      config = setup("project_nvim", { manual_mode = true }),
    }, -- project managing
    {
      "AckslD/nvim-neoclip.lua",
      event = "VeryLazy",
      config = setup("neoclip", { enable_persistent_history = true }),
      dependencies = { "kkharji/sqlite.lua" },
    },
  },
}
