local prequire = require("john.utils").prequire
local req = require("john.utils").req
local setup = require("john.utils").setup

local M = {}

local plugins = {
  { "nvim-lua/plenary.nvim", lazy = true }, -- Useful lua functions used ny lots of plugins
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} }, -- need to finish which-key config
  prequire("john.colors"),
  prequire("john.ui"),
  prequire("john.editor"),
  prequire("john.coding"),
  prequire("john.extras"),
  prequire("john.git"),
  prequire("john.treesitter"),
  prequire("john.telescope"),
  prequire("john.lsp"),

  -- language server protocol {{{
  {
    "folke/noice.nvim",
    config = req("john.interface.noice"),
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    event = "VeryLazy",
  },

  -- -- debug adaptor protocol
  -- -- one day I'll work more on lazy loading eveything
  -- { "mfussenegger/nvim-dap", lazy = true,
  --   config = req("john.dap"),
  --   dependencies = {
  --     -- issue with lazy loading this plugin causes bufferline.nvim and gitsigns.nvim to create insert mode bugs while using telescope to launch a file from an emtpy buffer
  --     { "rcarriga/nvim-dap-ui",              config = setup("dapui"), },
  --     { "theHamsta/nvim-dap-virtual-text",   config = setup("nvim-dap-virtual-text"), },
  --     { "jbyuki/one-small-step-for-vimkind", ft = "lua" },
  --   },
  -- },

  -- utility
  { "folke/persistence.nvim", event = "BufReadPre", config = setup("persistence") }, -- session manager
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = "<C-\\>",
    config = req("john.interface.terminal"),
  }, -- toggle nvim terminal
  { "tpope/vim-abolish", event = "VeryLazy" }, -- case coersion, substition, abbreviation
  -- { "Exafunction/codeium.vim", commit = "289eb72" },
  { "supermaven-inc/supermaven-nvim", opts = {} },
  { "ggandor/leap.nvim", dependencies = { { "ggandor/flit.nvim", config = setup("flit") } } },
}

M.setup = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- Use a protected call so we don't error out on first use {{{
  local status_ok, lazy = pcall(require, "lazy")
  if not status_ok then
    return
  end
  -- }}}
  lazy.setup(plugins)
end
-- }}}

return M
-- vim:foldmethod=marker:foldlevel=5
