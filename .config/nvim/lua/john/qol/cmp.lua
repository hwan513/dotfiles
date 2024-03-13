local prequire = require("john.utils").prequire
local cmp = prequire("cmp")
local luasnip = prequire("luasnip")

luasnip.filetype_extend("markdown", { "tex" })
require("luasnip/loaders/from_vscode").lazy_load()
-- require("luasnip/loaders/from_snipmate").lazy_load()

--   פּ ﯟ   some other good icons
-- local kind_icons = {
-- Array = " ",
-- Boolean = " ",
-- Class = " ",
-- Color = " ",
-- Constant = " ",
-- Constructor = " ",
-- Copilot = " ",
-- Enum = " ",
-- EnumMember = " ",
-- Event = " ",
-- Field = " ",
-- File = " ",
-- Folder = " ",
-- Function = " ",
-- Interface = " ",
-- Key = " ",
-- Keyword = " ",
-- Method = "m ",
-- Module = " ",
-- Namespace = " ",
-- Null = "ﳠ ",
-- Number = " ",
-- Object = " ",
-- Operator = " ",
-- Package = " ",
-- Property = " ",
-- Reference = " ",
-- Snippet = " ",
-- String = " ",
-- Struct = " ",
-- Text = " ",
-- TypeParameter = " ",
-- Unit = " ",
-- Value = " ",
-- Variable = " ",
-- }

local kind_icons = {
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      -- c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<C-N>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-P>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        cmp.complete()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        -- luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-j>"] = cmp.mapping(function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { "i", "s" }),
    ["<C-k>"] = cmp.mapping(function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { "i", "s" }),
  },
  formatting = {
    fields = { "kind", "menu", "abbr" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.abbr = string.sub(vim_item.abbr, 1, 40)
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        luasnip = "snip",
        buffer = "file",
        path = "path",
        nvim_lsp = "lsp ",
        nvim_lua = "lua ",
        tmux = "tmux",
      })[entry.source.name]
      return vim_item
    end,
  },
  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  }),
  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  }),
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "tmux" },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
})
