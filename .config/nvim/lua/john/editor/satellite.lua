local ft_ignore = require("john.utils").ft_ignore
return {
  "lewis6991/satellite.nvim",
  opts = {
    excluded_filetypes = ft_ignore,
    handlers = {
      cursor = {
        enable = false,
      },
    },
  },
}
