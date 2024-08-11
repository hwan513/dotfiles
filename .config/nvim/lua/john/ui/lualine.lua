local icons = require("john.misc.icons")
local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = icons.diagnostics.Error, warn = icons.diagnostics.Warn },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local filename = {
  "filename",
  file_status = false, -- Displays file status (readonly status, modified status)
  path = 1, -- 0: Just the filename 1: Relative path 2: Absolute path
}

local diff = {
  "diff",
  colored = true, -- Displays a colored diff status if set to true
  symbols = {
    added = icons.git.added,
    modified = icons.git.modified,
    removed = icons.git.removed,
  },
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      disabled_filetypes = { "toggleterm", "NeogitStatus", "lazy" },
    },
    sections = {
      lualine_a = { "branch" },
      lualine_b = { diff, diagnostics },
      lualine_c = { filename },
      lualine_x = { "encoding", "filetype" },
      lualine_y = { "location" },
      lualine_z = { "progress" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {
      "nvim-dap-ui",
      "nvim-tree",
      "oil",
      "trouble",
    },
  },
}
