local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.del("n", "<C-e>", { buffer = bufnr })
  vim.keymap.set("n", "d", api.fs.trash, opts("Trash"))
  vim.keymap.set("n", "_", api.tree.change_root_to_node, opts("CD"))
end

return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { "echasnovski/mini.icons" },
    opts = { view_options = { show_hidden = true } },
    keys = { { "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil" } },
  },
  {
    "nvim-tree/nvim-tree.lua",
    -- Lazy loading nvim-tree breaks commands for some reason
    lazy = false,
    dependencies = { "echasnovski/mini.icons" },
    keys = { { "<C-e>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" } },
    opts = {
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
        ignore_list = {},
      },
    },
  },
}
