return {
  "saghen/blink.cmp",
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
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", gap = 1 },
            { "kind" },
          },
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
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
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
}
