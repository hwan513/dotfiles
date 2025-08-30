local ft_ignore = require("config.utils").ft_ignore

return {
  -- IDE breadcrumbs
  {
    "Bekaboo/dropbar.nvim",
    event = "LspAttach",
    lazy = false,
  },
  -- Scrollbar
  {
    "lewis6991/satellite.nvim",
    enabled = false,
    opts = {
      excluded_filetypes = ft_ignore,
      handlers = {
        cursor = {
          enable = false,
        },
        -- Can't seem to actually disable satellite keymaps
        marks = { enabled = false, key = "¬" },
      },
    },
  },
  -- Toggle terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = "<C-\\>",
    opts = {
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
  },
  -- Buffer and tab management
  {
    "tiagovla/scope.nvim",
    enabled = false, -- TODO: figure out things; having issues with session management
    opts = {
      hooks = {
        pre_tab_leave = function()
          vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabLeavePre" })
        end,
        post_tab_enter = function()
          vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
        end,
      },
    },
  },
}
