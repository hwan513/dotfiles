require("illuminate").configure({
  delay = 500,
  filetypes_denylist = { "dirvish", "fugitive", "NvimTree" },
  modes_denylist = { "i", "v", "s" },
})
