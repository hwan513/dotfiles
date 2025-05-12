return {
  "TimUntersberger/neogit",
  cmd = "Neogit",
  opts = {
    integrations = { diffview = true, snacks = true },
    commit_editor = {
      staged_diff_split_kind = "auto",
    },
  },
  keys = { { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" } },
}
