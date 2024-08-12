return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  opts = {},
  keys = {
    { "<C-h>", "<cmd> lua require('smart-splits').move_cursor_left()<cr>", desc = "Move cursor left" },
    { "<C-j>", "<cmd> lua require('smart-splits').move_cursor_down()<cr>", desc = "Move cursor down" },
    { "<C-k>", "<cmd> lua require('smart-splits').move_cursor_up()<cr>", desc = "Move cursor up" },
    { "<C-l>", "<cmd> lua require('smart-splits').move_cursor_right()<cr>", desc = "Move cursor right" },
    { "<C-BS>", "<cmd> lua require('smart-splits').move_cursor_previous()<cr>", desc = "Move cursor previous" },
    { "<A-h>", "<cmd> lua require('smart-splits').resize_left(5)<cr>", desc = "Resize left" },
    { "<A-j>", "<cmd> lua require('smart-splits').resize_down(5)<cr>", desc = "Resize down" },
    { "<A-k>", "<cmd> lua require('smart-splits').resize_up(5)<cr>", desc = "Resize up" },
    { "<A-l>", "<cmd> lua require('smart-splits').resize_right(5)<cr>", desc = "Resize right" },
  },
}
