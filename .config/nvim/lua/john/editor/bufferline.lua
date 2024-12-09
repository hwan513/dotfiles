return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  enabled = false,
  opts = {
    options = {
      numbers = "none",
      close_command = "lua MiniBufremove.delete()",
      right_mouse_command = "lua MiniBufremove.delete()",
      left_mouse_command = "buffer %d",
      indicator = {
        icon = "▎", -- this should be omitted if indicator style is not 'icon'
        style = "icon", -- 'underline' | 'none',
      },
      buffer_close_icon = "",
      diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
      diagnostics_indicator = function(_, level) -- , diagnostics_dict, context)
        local icons = { error = "", warning = "", hint = "", info = "" }
        return "" .. icons[level] --  .. count
      end,
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
      always_show_bufferline = true,
      sort_by = "id",
    },
  },
}
