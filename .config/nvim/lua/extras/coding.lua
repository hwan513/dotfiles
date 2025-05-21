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
}
