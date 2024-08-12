local ft_ignore = require("john.utils").ft_ignore
return {
  "RRethy/vim-illuminate",
  opts = {
    delay = 500,
    filetypes_denylist = ft_ignore,
    modes_denylist = { "i", "v", "s" },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end,
}
