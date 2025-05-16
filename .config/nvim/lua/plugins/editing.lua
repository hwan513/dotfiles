return {
  {
    "gregorias/coerce.nvim",
    keys = {
      { "cr", desc = "Coerce Word" },
      { "gcr", desc = "Motion Coerce", mode = "n" },
    },
    opts = { default_mode_mask = { visual_mode = false } },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "Refactor",
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = "InsertEnter",
    opts = { opts = { enable_close_on_slash = true } },
  },
  {
    "echasnovski/mini.surround",
    opts = {},
    -- Useful commands on this include `q` (quotes), `b` (brackets), `n` (next), `l` (last).
    keys = {
      { "sa", desc = "Add Surrounding", mode = { "n", "v" } },
      { "sd", desc = "Delete Surrounding" },
      { "sf", desc = "Find Right Surrounding" },
      { "sF", desc = "Find Left Surrounding" },
      { "sh", desc = "Highlight Surrounding" },
      { "sr", desc = "Replace Surrounding" },
      { "sn", desc = "Update `MiniSurround.config.n_lines`" },
    },
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },
}
