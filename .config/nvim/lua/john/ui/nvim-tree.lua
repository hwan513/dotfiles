local map = require("john.utils").map
local map_opts = require("john.utils").map_opts

-- setup toggle keymap
map("n", "<C-e>", "<cmd>NvimTreeToggle<cr>", map_opts("Toggle NvimTree"))

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  api.config.mappings.default_on_attach(bufnr)

  -- Remove default mapping for <C-e>
  vim.keymap.del("n", "<C-e>", { buffer = bufnr })

  -- Mappings migrated from view.mappings.list
  vim.keymap.set("n", "d", api.fs.trash, opts("Trash"))
  vim.keymap.set("n", "_", api.tree.change_root_to_node, opts("CD"))
end

-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local opts = {
  on_attach = on_attach,
  disable_netrw = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  view = {
    width = 40,
  },
  renderer = {
    root_folder_label = false,
    full_name = true,
    hidden_display = "simple",
    highlight_opened_files = "all",
    indent_markers = {
      enable = true,
      inline_arrows = false,
    },
    indent_width = 2,
    icons = {
      git_placement = "right_align",
      hidden_placement = "right_align",
      bookmarks_placement = "signcolumn",
      glyphs = {
        git = {
          staged = "▴",
          unstaged = "✦",
          deleted = "𐄂",
        },
      },
      show = {
        folder_arrow = false,
        modified = false,
        diagnostics = false,
      },
    },
    group_empty = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    -- update_cwd = true,
    ignore_list = {},
  },
}

return {
  "nvim-tree/nvim-tree.lua",
  opts = opts,
  keys = { { "<C-e>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" } },
}
