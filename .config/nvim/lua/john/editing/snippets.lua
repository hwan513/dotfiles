return {
  "garymjr/nvim-snippets",
  opts = {
    friendly_snippets = true,
    create_cmp_source = true,
  },
  dependencies = { "rafamadriz/friendly-snippets" },
  keys = {
    { "<C-N>", "<cmd>lua vim.snippet.jump(1)<cr>", mode = { "i", "s" } },
    { "<C-P>", "<cmd>lua vim.snippet.jump(-1)<cr>", mode = { "i", "s" } },
  },
}
