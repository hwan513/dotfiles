return {
  { "folke/tokyonight.nvim" }, -- colourscheme
  { "catppuccin/nvim", name = "catppuccin", event = "VeryLazy" },
  { "rose-pine/neovim", name = "rose-pine", event = "VeryLazy" },
  { "maxmx03/fluoromachine.nvim" },
  { "dundargoc/fakedonalds.nvim" },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme cyberdream")
    end,
  },
}
