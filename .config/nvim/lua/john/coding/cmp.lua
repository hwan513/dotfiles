return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "hrsh7th/cmp-nvim-lsp", -- lsp completions
    "hrsh7th/cmp-nvim-lua", -- lua completions for nvim config
    "andersevenrud/cmp-tmux", -- tmux completions
    require("john.coding.snippets"),
  },
  opts = function()
    local cmp = require("cmp")
    local kind_icons = require("john.misc.icons").kinds
    return {
      mapping = {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i" }),
        ["<C-y>"] = cmp.mapping(cmp.mapping.abort(), { "i" }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      },
      formatting = {
        fields = { "kind", "menu", "abbr" },
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.abbr = string.sub(vim_item.abbr, 1, 40)
          vim_item.menu = ({
            nvim_lsp = "lsp ",
            snippets = "snip",
            buffer = "file",
            path = "path",
            nvim_lua = "lua ",
            tmux = "tmux",
          })[entry.source.name]
          return vim_item
        end,
      },
      sources = {
        { name = "lazydev", group_index = 0 }, -- set group index to 0 to skip loading LuaLS completions
        { name = "snippets", group_index = 1 },
        { name = "nvim_lsp", group_index = 1 },
        { name = "nvim_lua", group_index = 1 },
        { name = "path", group_index = 1 },
        { name = "buffer", group_index = 2 },
        { name = "tmux", group_index = 2 },
      },
      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline("/", {
        sources = {
          { name = "buffer" },
        },
      }),
      cmp.setup.cmdline(":", {
        sources = {
          { name = "cmdline" },
          { name = "path" },
        },
      }),
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      experimental = {
        ghost_text = true,
      },
    }
  end,
}
