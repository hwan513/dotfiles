local prequire = require("john.utils").prequire
return {
  prequire("john.coding.autopairs"),
  prequire("john.coding.cmp"),
  prequire("john.coding.markup"),
  prequire("john.coding.smart-splits"),
  { "windwp/nvim-ts-autotag", opts = { opts = { enable_close_on_slash = true } }, event = "VeryLazy" },
  { "echasnovski/mini.surround", opts = {}, event = "VeryLazy" },
  { "folke/ts-comments.nvim", opts = {}, event = "VeryLazy" },
  { "gbprod/cutlass.nvim", keys = { { "m", mode = { "v", "n" } } }, opts = { cut_key = "m" } },
  { "echasnovski/mini.jump2d", opts = {}, event = "VeryLazy" },
  { "echasnovski/mini.jump", opts = {}, event = "VeryLazy" },
  -- { "Exafunction/codeium.vim", commit = "289eb72" },
  { "supermaven-inc/supermaven-nvim", opts = {}, event = "InsertEnter" },
  -- { "johmsalas/text-case.nvim" },
  { "gregorias/coerce.nvim", tag = "v3.0.0", config = true },
}
