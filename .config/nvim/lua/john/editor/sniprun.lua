return {
  "michaelb/sniprun",
  build = "sh install.sh",
  cmd = "SnipRun",
  opts = {
    display = { "Terminal" },
    display_options = {
      terminal_scrollback = vim.o.scrollback, -- change terminal display scrollback lines
      terminal_line_number = false, -- whether show line number in terminal window
      terminal_signcolumn = false, -- whether show signcolumn in terminal window
      terminal_position = "vertical", --# or "horizontal", to open as horizontal split instead of vertical split
      terminal_width = 45, --# change the terminal display option width (if vertical)
      terminal_height = 20, --# change the terminal display option height (if horizontal)
    },
  },
  keys = {
    { "<leader>r", "<Plug>SnipRun", desc = "Run Snippet", mode = { "v", "n" } },
  },
}
