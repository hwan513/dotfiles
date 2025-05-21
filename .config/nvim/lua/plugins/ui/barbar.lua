local icons = require("config.icons")

return {
  "romgrk/barbar.nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "lewis6991/gitsigns.nvim",
  },
  event = "VeryLazy",
  init = function()
    vim.g.barbar_auto_setup = false
    vim.api.nvim_set_hl(0, "BufferTabpageFill", { link = "BufferDefaultInactive" })
  end,
  keys = {
    { "H", "<Cmd>BufferPrevious<CR>", desc = "Previous Buffer" },
    { "L", "<Cmd>BufferNext<CR>", desc = "Next Buffer" },
    { "<leader>h", "<Cmd>BufferMovePrevious<CR>", desc = "Move Previous Buffer" },
    { "<leader>l", "<Cmd>BufferMoveNext<CR>", desc = "Move Next Buffer" },
    { "<leader>bb", "<Cmd>BufferPick<CR>", desc = "Pick Buffer" },
    { "<leader>bd", "<Cmd>BufferPickDelete<CR>", desc = "Pick Buffer Delete" },
    { "<leader>bp", "<Cmd>BufferPin<CR>", desc = "Pin Buffer" },
    { "<leader>c", "<Cmd>BufferClose!<CR>", desc = "Close Buffer" },
    { "<leader>bc", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", desc = "Close All Buffer but Current or Pinned" },
    { "<leader>br", "<Cmd>BufferRestore<CR>", desc = "Restore Buffer" },
  },
  opts = {
    icons = {
      button = "",
      pinned = { button = "", filename = true },
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = icons.diagnostics.Error },
        [vim.diagnostic.severity.WARN] = { enabled = true, icon = icons.diagnostics.Warn },
        [vim.diagnostic.severity.INFO] = { enabled = false, icon = icons.diagnostics.Info },
        [vim.diagnostic.severity.HINT] = { enabled = false, icon = icons.diagnostics.Hint },
      },
    },
    maximum_padding = 2,
    sidebar_filetypes = {
      NvimTree = true,
    },
    no_name_title = "[No Name]",
  },
}
