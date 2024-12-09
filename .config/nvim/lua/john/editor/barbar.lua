return {
  "romgrk/barbar.nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "lewis6991/gitsigns.nvim",
  },
  lazy = false,
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
  },
  opts = {
    icons = {
      button = "",
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
        [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
        [vim.diagnostic.severity.INFO] = { enabled = false, icon = " " },
        [vim.diagnostic.severity.HINT] = { enabled = false, icon = " " },
      },
    },
    maximum_padding = 2,
    sidebar_filetypes = {
      NvimTree = true,
    },
    no_name_title = "[No Name]",
  },
}
