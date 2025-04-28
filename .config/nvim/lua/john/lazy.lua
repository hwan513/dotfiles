local prequire = require("john.utils").prequire
local M = {}
local plugins = {
  { "nvim-lua/plenary.nvim", lazy = true }, -- Useful lua functions used by lots of plugins
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
  prequire("john.misc.snacks"),
}

M.setup = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  ---@diagnostic disable-next-line: undefined-field
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(lazypath)

  -- Use a protected call so we don't error out on first use {{{
  -- disable luacheck
  ---@diagnostic disable-next-line: redundant-parameter
  require("lazy").setup({
    spec = plugins,
    install = { colorscheme = { "cyberdream" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
  })
end
-- }}}

return M
-- vim:foldmethod=marker:foldlevel=5
