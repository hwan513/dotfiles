return {
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  { "MagicDuck/grug-far.nvim", opts = {} },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" } },
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = {
      "romgrk/barbar.nvim",
      "nvim-lualine/lualine.nvim",
      "nvim-tree/nvim-tree.lua",
      { "Bekaboo/dropbar.nvim", optional = true },
    },
    opts = {
      silent_restore = false,
      pre_save_cmds = {
        function()
          vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
        end,
      },
    },
  },
}
