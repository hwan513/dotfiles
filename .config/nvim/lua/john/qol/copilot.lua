vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-s>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_filetypes = {
  ["*"] = false,
  ["markdown"] = true,
  ["typst"] = true,
  ["html"] = true,
  ["css"] = true,
  ["javascript"] = true,
  ["typescript"] = true,
  ["rust"] = true,
  ["lua"] = true,
  ["java"] = true,
}
