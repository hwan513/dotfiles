local prequire = require("john.utils").prequire
local req = require("john.utils").req
local setup = require("john.utils").setup

local M = {}

local plugins = {
  { "nvim-lua/plenary.nvim", lazy = true }, -- Useful lua functions used ny lots of plugins
  prequire("john.colors"),
  prequire("john.ui"),
  prequire("john.editor"),
  prequire("john.coding"),
  prequire("john.extras"),
  prequire("john.git"),
  prequire("john.treesitter"),
  prequire("john.telescope"),
  prequire("john.lsp"),
  prequire("john.interface.noice"),

  -- utility
  { "folke/persistence.nvim", event = "BufReadPre", config = setup("persistence") }, -- session manager
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
