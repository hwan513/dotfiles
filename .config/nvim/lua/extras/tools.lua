return {
  { "dstein64/vim-startuptime", cmd = { "StartupTime" } }, -- startup timer,
  {
    "michaelb/sniprun",
    build = "sh install.sh",
    cmd = "SnipRun",
    enabled = false,
    opts = {},
    keys = {
      { "<leader>r", "<Plug>SnipRun", desc = "Run Snippet", mode = { "v", "n" } },
    },
  },
}
