local prequire = require("john.utils").prequire
local req = require("john.utils").req
local setup = require("john.utils").setup

local M = {}

local plugins = {
  { "nvim-lua/plenary.nvim", lazy = true }, -- Useful lua functions used ny lots of plugins
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} }, -- need to finish which-key config
  prequire("john.colors"),
  prequire("john.ui"),
  prequire("john.editing"),
  prequire("john.extras"),

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = req("john.treesitter.treesitter"),
    build = ":TSUpdate",
    event = { "VeryLazy" },
    dependencies = {
      -- { "nvim-treesitter/nvim-treesitter-textobjects", config = setup("john.treesitter.textobjects") },
      { "RRethy/nvim-treesitter-textsubjects", config = req("john.treesitter.textsubjects") },
      { "RRethy/vim-illuminate", config = req("john.qol.illuminate") }, -- highlights current thing under cursor
    },
  }, -- better syntax highlighting and other stuff
  {
    "rayliwell/tree-sitter-rstml",
    dependencies = { "nvim-treesitter" },
    build = ":TSUpdate",
    config = setup("tree-sitter-rstml"),
  },

  -- language server protocol {{{
  {
    "folke/noice.nvim",
    config = req("john.interface.noice"),
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    event = "VeryLazy",
  },
  { "folke/neodev.nvim" },
  { "folke/neoconf.nvim", config = setup("neoconf") },
  {
    "neovim/nvim-lspconfig",
    config = req("lspconfig"),
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim", config = req("john.lsp.mason") },
      { "stevearc/conform.nvim", config = req("john.lsp.conform") },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      { "jayp0521/mason-null-ls.nvim" },
      { "mfussenegger/nvim-jdtls" },
      {
        "nvimtools/none-ls.nvim",
        config = req("john.lsp.null-ls"),
        dependencies = {
          "nvimtools/none-ls-extras.nvim",
        },
      },
      { "folke/trouble.nvim", config = req("john.interface.trouble") }, -- display the qf window for stuff
    },
  }, -- enable LSP
  { "mrcjkb/rustaceanvim", version = "^4", ft = { "rust" } },

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

  -- telescope
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = setup("project_nvim", { manual_mode = true }),
  }, -- project managing
  {
    "AckslD/nvim-neoclip.lua",
    event = "VeryLazy",
    config = setup("neoclip", { enable_persistent_history = true }),
    dependencies = { "kkharji/sqlite.lua" },
  },
  {
    "nvim-telescope/telescope.nvim",
    config = setup("john.interface.telescope"),
    keys = require("john.interface.telescope").keys,
    cmd = "Telescope",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-frecency.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "debugloop/telescope-undo.nvim",
    },
  },

  -- git stuff
  { "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, config = req("john.interface.gitsigns") },
  { "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    opts = {
      integrations = { diffview = true, telescope = true },
      commit_editor = {
        staged_diff_split_kind = "auto",
      },
    },
    keys = { { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" } },
  },

  -- utility
  { "numToStr/Navigator.nvim", event = "VeryLazy", config = req("john.qol.navigator") },
  { "gbprod/cutlass.nvim", keys = { { "m", mode = { "v", "n" } } }, config = setup("cutlass", { cut_key = "m" }) },
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
