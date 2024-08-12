local prequire = require("john.utils").prequire
return {
  prequire("john.coding.autopairs"),
  prequire("john.coding.cmp"),
  prequire("john.coding.markup"),
  prequire("john.coding.smart-splits"),
  { "windwp/nvim-ts-autotag", opts = { opts = { enable_close_on_slash = true } }, event = "VeryLazy" },
  { "echasnovski/mini.surround", opts = {}, event = "VeryLazy" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "│" } }, event = "VeryLazy" },
  { "folke/ts-comments.nvim", opts = {}, event = "VeryLazy" },
  { "gbprod/cutlass.nvim", keys = { { "m", mode = { "v", "n" } } }, opts = { cut_key = "m" } },
}
