local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local icons = require("john.misc.icons")

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  api.config.mappings.default_on_attach(bufnr)

  -- You might tidy things by removing these along with their default mapping.
  vim.keymap.set("n", "<C-e>", "", { buffer = bufnr })
  vim.keymap.del("n", "<C-e>", { buffer = bufnr })

  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set("n", "d", api.fs.trash, opts("Trash"))
  vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
  vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
  vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
  vim.keymap.set("n", "_", api.tree.change_root_to_node, opts("CD"))
end

-- each of these are documented in `:help nvim-tree.OPTION_NAME`
nvim_tree.setup({
  on_attach = my_on_attach,
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  -- ignore_buffer_on_setup = false,
  -- open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  view = {
    width = 30,
    -- height = 30, -- for horizontal tree viewer
    side = "left",
    preserve_window_proportions = true,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    -- mappings = {
    --   custom_only = false,
    --   list = {
    --     { key = "<C-e>",                            action = "" },
    --     { key = { "d", "D" },                       action = "trash" },
    --     { key = { "<2-RightMouse>", "<C-]>", "_" }, action = "cd" },
    --   },
    -- },
  },
  renderer = {
    root_folder_label = false,
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      glyphs = {
        default = " ",
        symlink = " ",
        git = {
          unstaged = " ",
          staged = "S ",
          unmerged = " ",
          renamed = "➜ ",
          deleted = " ",
          untracked = "U ",
          ignored = "◌ ",
        },
        folder = {
          default = " ",
          open = " ",
          empty = " ",
          empty_open = " ",
          symlink = " ",
        },
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
  -- ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = true,
    icons = {
      error = icons.diagnostics.Error,
      warning = icons.diagnostics.Warn,
      hint = icons.diagnostics.Hint,
      info = icons.diagnostics.Info,
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
})

-- setp toggle keymap
vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
