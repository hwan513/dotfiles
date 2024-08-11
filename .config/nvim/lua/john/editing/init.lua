return {
  require("john.editing.markup"),
  require("john.editing.autopairs"),
  { "windwp/nvim-ts-autotag", opts = { opts = { enable_close_on_slash = true } }, event = "VeryLazy" },
  { "echasnovski/mini.surround", opts = {}, event = "VeryLazy" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, event = "VeryLazy" },
  { "folke/ts-comments.nvim", opts = {}, event = "VeryLazy" },
  -- completion and snippets
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("john.qol.cmp")
      require("john.lsp.handlers").setup()
    end,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer", -- buffer completions
      "hrsh7th/cmp-path", -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "hrsh7th/cmp-nvim-lsp", -- lsp completions
      "hrsh7th/cmp-nvim-lua", -- lua completions for nvim config
      "andersevenrud/cmp-tmux", -- tmux completions
      "L3MON4D3/LuaSnip", --snippet engine
      "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    },
  }, -- The completion plugin
}
