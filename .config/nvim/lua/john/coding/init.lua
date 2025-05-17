local prequire = require("config.utils").prequire
return {
  {
    "supermaven-inc/supermaven-nvim",
    opts = { keymaps = { accept_suggestion = "<M-j>", clear_suggestion = "<C-]>", accept_word = "<C-j>" } },
    event = "InsertEnter",
  },
  { "echasnovski/mini.jump2d", opts = {}, event = "VeryLazy" },
  { "echasnovski/mini.jump", opts = {}, event = "VeryLazy" },
}
