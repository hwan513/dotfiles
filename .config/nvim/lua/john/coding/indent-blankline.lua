local ft_ignore = require("john.utils").ft_ignore
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "│" },
    exclude = {
      filetypes = ft_ignore,
    },
  },
  event = "VeryLazy",
}
