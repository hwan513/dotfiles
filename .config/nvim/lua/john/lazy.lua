local M = {}

local req = function(modname) return function() require(modname) end end
local setup = function(modname, args) return function() require(modname).setup(args) end end

local plugins = {
  { "nvim-lua/plenary.nvim",    lazy = true }, -- Useful lua functions used ny lots of plugins
  { "dstein64/vim-startuptime", cmd = { "StartupTime" }, }, -- startup timer,
  { "folke/which-key.nvim",     event = "VeryLazy",      config = setup("which-key"), }, -- need to finish which-key config
  { "folke/tokyonight.nvim", lazy = false, priority = 1000,
    config = function() vim.cmd([[colorscheme tokyonight-night]]) end, }, -- colourscheme
  { "catppuccin/nvim",        name = "catppuccin" },


  -- pairing plugins
  { "machakann/vim-sandwich", event = "VeryLazy" }, -- surrounding stuff with stuff

  -- treesitter
  { "nvim-treesitter/nvim-treesitter",
    config = req("john.treesitter.treesitter"), build = ":TSUpdate", event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "lukas-reineke/indent-blankline.nvim", config = req("john.interface.indentline") }, -- shows indent level with line
      { "windwp/nvim-autopairs",               config = req("john.qol.autopairs") }, -- autopair brackets and quotations
      "windwp/nvim-ts-autotag", -- automatically add tags to end of documents
      "JoosepAlviste/nvim-ts-context-commentstring",
      "p00f/nvim-ts-rainbow", -- bracket pair matching
      "nvim-treesitter/nvim-treesitter-textobjects",
      { "RRethy/nvim-treesitter-textsubjects", config = req("john.treesitter.textsubjects") },
      { "romgrk/nvim-treesitter-context",      config = setup("treesitter-context", { enable = false }) },
      { "RRethy/vim-illuminate",               config = req("john.qol.illuminate") }, -- highlights current thing under cursor
    }

  }, -- better syntax highlighting and other stuff

  -- user interface {{{
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-tree/nvim-tree.lua",     keys = "<C-e>",                         config = req("john.interface.nvim-tree") },
  { "akinsho/bufferline.nvim",     event = "VeryLazy",                     config = req("john.interface.bufferline") },
  { "famiu/bufdelete.nvim",        cmd = "Bdelete" }, -- delete buffers nicely
  { "nvim-lualine/lualine.nvim",   event = "VeryLazy",                     config = req("john.interface.lualine") }, -- status line plugin
  { "norcalli/nvim-colorizer.lua", event = { "BufNewFile", "BufReadPre" }, config = setup("colorizer") }, -- coloring viewer for html css stuff


  -- }}}
  -- completion and snippets
  { "hrsh7th/nvim-cmp",
    config = function()
      require("john.qol.cmp")
      require("john.lsp.handlers").setup()
    end,
    -- config = req("john.qol.cmp"),
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer", -- buffer completions
      "hrsh7th/cmp-path", -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "hrsh7th/cmp-nvim-lsp", -- lsp completions
      "hrsh7th/cmp-nvim-lua", -- lua completions for nvim config
      "andersevenrud/cmp-tmux", -- tmux completions
      "L3MON4D3/LuaSnip", --snippet engine
      "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    }
  }, -- The completion plugin

  -- language server protocol {{{
  { "neovim/nvim-lspconfig",
    config = req("lspconfig"),
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim",                  config = req("john.lsp.mason") },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      { "jayp0521/mason-null-ls.nvim", },
      { "simrat39/rust-tools.nvim", },
      { "mfussenegger/nvim-jdtls", },
      { "jose-elias-alvarez/null-ls.nvim",          config = req("john.lsp.null-ls") },
      { "folke/trouble.nvim",                       config = require("john.interface.trouble") }, -- display the qf window for stuff
      { "ray-x/lsp_signature.nvim",                 config = req("john.qol.signature") }, -- show function lsp signature
    }
  }, -- enable LSP

  -- {"davidgranstrom/nvim-markdown-preview"} -- alternative preview plugin

  -- debug adaptor protocol
  -- one day I'll work more on lazy loading eveything
  { "mfussenegger/nvim-dap", lazy = true,
    config = req("john.dap"),
    dependencies = {
      { "rcarriga/nvim-dap-ui",              config = setup("dapui"), },
      { "theHamsta/nvim-dap-virtual-text",   config = setup("nvim-dap-virtual-text"), },
      { "jbyuki/one-small-step-for-vimkind", ft = "lua" },
    },
  },

  -- telescope
  { "ahmedkhalf/project.nvim", event = "VeryLazy",                      config = setup("project_nvim"), }, -- project managing
  { "nvim-telescope/telescope.nvim",
    config = setup("john.interface.telescope"),
    keys = require("john.interface.telescope").keys,
    cmd = "Telescope",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
  },

  -- git stuff
  { "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" },  config = req("john.interface.gitsigns") },
  { "sindrets/diffview.nvim",  cmd = "DiffviewOpen" },
  { "TimUntersberger/neogit",  cmd = "Neogit",                          config = setup("neogit", { integrations = { diffview = true }, }) },

  -- utility
  { "numToStr/Navigator.nvim", event = "VeryLazy",                      config = req("john.qol.navigator") },
  { "numToStr/Comment.nvim",   keys = { "gcc", { "gc", mode = "v" } },  config = req("john.qol.comment") },
  { "gbprod/cutlass.nvim",     keys = { { "m", mode = { "v", "n" } } }, config = setup("cutlass", { cut_key = "m", }) },
  { "folke/persistence.nvim",  event = "BufReadPre",                    config = setup("persistence"), }, -- session manager
  { "akinsho/toggleterm.nvim", version = "*", keys = "<C-\\>",
    config = req("john.interface.terminal") }, -- toggle nvim terminal
  { "tpope/vim-abolish",       event = "VeryLazy" }, -- case coersion, substition, abbreviation
  { "github/copilot.vim",      cmd = "Copilot",   config = req("john.qol.copilot") },
  -- TODO Need to replace { "simnalamburt/vim-mundo", cmd =  "MundoToggle" , }, -- undo viewer


  -- I have the funny
  { "alec-gibson/nvim-tetris", cmd = "Tetris" },
  { "ryoppippi/bad-apple.vim", cmd = "BadApple",  dependencies = "vim-denops/denops.vim", }
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
