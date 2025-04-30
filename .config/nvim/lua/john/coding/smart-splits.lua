return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  opts = {},
  keys = {
    -- stylua: ignore start
    { "<C-h>", function() require('smart-splits').move_cursor_left() end, desc = "Move cursor left" },
    { "<C-j>", function() require('smart-splits').move_cursor_down() end, desc = "Move cursor down" },
    { "<C-k>", function() require('smart-splits').move_cursor_up() end, desc = "Move cursor up" },
    { "<C-l>", function() require('smart-splits').move_cursor_right() end, desc = "Move cursor right" },
    { "<C-BS>", function() require('smart-splits').move_cursor_previous() end, desc = "Move cursor previous" },
    { "<A-h>", function() require('smart-splits').resize_left(5) end, desc = "Resize left" },
    { "<A-j>", function() require('smart-splits').resize_down(5) end, desc = "Resize down" },
    { "<A-k>", function() require('smart-splits').resize_up(5) end, desc = "Resize up" },
    { "<A-l>", function() require('smart-splits').resize_right(5) end, desc = "Resize right" },
    -- stylua: ignore end
  },
}
