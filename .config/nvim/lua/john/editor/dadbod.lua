return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      {
        "saghen/blink.cmp",
        optional = true,
        opts = {
          sources = {
            default = { "dadbod" },
            providers = {
              dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            },
          },
        },
        dependencies = {
          "kristijanhusak/vim-dadbod-completion",
        },
      },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
