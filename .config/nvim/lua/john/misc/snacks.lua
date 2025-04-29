local ft_ignore = require("john.utils").ft_ignore
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = { enabled = true },
    bigfile = { enabled = true },
    -- explorer = { enabled = true },
    gitbrowse = { enabled = true, notify = false, what = "repo" },
    indent = {
      enabled = true,
      animate = {
        enabled = false,
      },
      filter = function(buf)
        return vim.g.snacks_indent ~= false
          and vim.b[buf].snacks_indent ~= false
          and vim.bo[buf].buftype == ""
          and not vim.tbl_contains(ft_ignore, vim.b[buf].filetype)
      end,
    },
    input = { enabled = true },
    -- picker = { enabled = true },
    notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    scratch = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
  keys = {
    { "<leader>go", "<cmd>lua Snacks.gitbrowse()<cr>", desc = "Open Git repo in browser" },
    { "<leader>ss", "<cmd>lua Snacks.scratch()<cr>", desc = "Open Scratch buffer" },
    { "<leader>sl", "<cmd>lua Snacks.scratch.select()<cr>", desc = "Select file in Scratch buffer" },
  },
}
