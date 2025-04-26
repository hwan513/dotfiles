local prequire = require("john.utils").prequire
return {
  prequire("john.coding.autopairs"),
  prequire("john.coding.blink"),
  prequire("john.coding.markup"),
  prequire("john.coding.smart-splits"),
  prequire("john.coding.indent-blankline"),
  { "windwp/nvim-ts-autotag", opts = { opts = { enable_close_on_slash = true } }, event = "VeryLazy" },
  { "echasnovski/mini.surround", opts = {}, event = "VeryLazy" },
  { "folke/ts-comments.nvim", opts = {}, event = "VeryLazy" },
  { "gbprod/cutlass.nvim", keys = { { "m", mode = { "x", "n" } } }, opts = { cut_key = "m" } },
  { "echasnovski/mini.jump2d", opts = {}, event = "VeryLazy" },
  { "echasnovski/mini.jump", opts = {}, event = "VeryLazy" },
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      keymaps = {
        accept_suggestion = "<M-j>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
    },
    event = "InsertEnter",
  },
  prequire("john.coding.coerce"),
  prequire("john.coding.refactoring"),
}
