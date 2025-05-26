return {
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    opts = {
      max_count = 5,
      disable_mouse = false,
      disabled_keys = {
        ["<Up>"] = false,
        ["<Down>"] = false,
        ["<Left>"] = false,
        ["<Right>"] = false,
      },
    },
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
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      fast_wrap = {
        map = "<C-u>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        end_jey = "/",
        jeys = "aoeuidhtns',.pyfgcrl",
      },
    },
  },
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { "rafamadriz/friendly-snippets", "xzbdmw/colorful-menu.nvim" },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "super-tab" },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 100 },
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
      },
      signature = { enabled = true },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      cmdline = {
        keymap = { preset = "inherit" },
        completion = {
          menu = { auto_show = true },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
