return {
  "rmagatti/auto-session",
  lazy = false,
  enabled = false,
  opts = {
    silent_restore = false,
    pre_save_cmds = {
      function()
        vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
      end,
    },
  },
}
