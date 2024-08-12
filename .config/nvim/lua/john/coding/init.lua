return {
  require("john.coding.markup"),
  require("john.coding.autopairs"),
  { "windwp/nvim-ts-autotag", opts = { opts = { enable_close_on_slash = true } }, event = "VeryLazy" },
  { "echasnovski/mini.surround", opts = {}, event = "VeryLazy" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "│" } }, event = "VeryLazy" },
  { "folke/ts-comments.nvim", opts = {}, event = "VeryLazy" },
  require("john.coding.cmp"),
}
