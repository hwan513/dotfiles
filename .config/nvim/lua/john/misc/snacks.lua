print("hello")
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
    -- indent = { enabled = true },
    -- input = { enabled = true },
    -- picker = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
  keys = { { "<leader>go", "<cmd>lua Snacks.gitbrowse()<cr>", desc = "Open Git repo in browser" } },
}
