local M = {}


-- }}}

-- Install your plugins here {{{
local plugins = {
  { "wbthomason/packer.nvim" }, -- Have packer manage itself
  { "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
  { "dstein64/vim-startuptime", lazy = true, cmd = { "Startup" }, }, -- startup timer,
  { "folke/which-key.nvim",
    config = function() require("which-key").setup({}) end, },
  -- }}}
  -- coloring things {{{
  { "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function() vim.cmd([[colorscheme tokyonight-night]]) end,
  }, -- colourscheme
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate" }, -- better syntax highlighting and other stuff
  { "p00f/nvim-ts-rainbow" }, -- bracket pair matching
  -- }}}
  -- user interface {{{
  { "kyazdani42/nvim-web-devicons" },
  { "kyazdani42/nvim-tree.lua" },
  { "akinsho/bufferline.nvim",
    version = "v2.*", dependencies = "kyazdani42/nvim-web-devicons" },
  { "famiu/bufdelete.nvim" }, -- delete buffers nice
  { "nvim-lualine/lualine.nvim" }, -- status line plugin
  { "lukas-reineke/indent-blankline.nvim" }, -- shows indent level with line
  -- { "romgrk/nvim-treesitter-context",
  --   config = { require("treesitter-context").setup({ enable = false, }), },
  -- }, -- shows context at higher indent levels
  -- { "norcalli/nvim-colorizer.lua",
  --   config = { require("colorizer").setup() }, }, -- coloring viewer for html css stuff
  -- highlights current thing under cursor

  { "RRethy/vim-illuminate",
    -- config = {
    --   function()
    --     require("illuminate").configure({
    --       delay = 500,
    --       filetypes_denylist = {
    --         "dirvish",
    --         "fugitive",
    --         "NvimTree",
    --       },
    --       modes_denylist = { "i", "v", "s" },
    --     })
    --   end
    -- },
  },

  -- }}}
  -- completion {{{
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "hrsh7th/cmp-cmdline" }, -- cmdline completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" }, -- lsp completions
  { "hrsh7th/cmp-nvim-lua" }, -- lua completions for nvim config
  { "andersevenrud/cmp-tmux" }, -- tmux completions
  -- }}}
  -- snippets {{{
  { "L3MON4D3/LuaSnip" }, --snippet engine
  { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
  -- {"honza/vim-snippets"} -- more snippets
  -- }}}

  -- language server protocol {{{
  { "neovim/nvim-lspconfig" }, -- enable LSP
  -- use mason for lsp installation
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  -- use mason for null ls installation
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  { "jayp0521/mason-null-ls.nvim", },
  { "simrat39/rust-tools.nvim" },
  { "mfussenegger/nvim-jdtls" },
  { "jose-elias-alvarez/null-ls.nvim",
    version = "bf027826eeb83606ef7153f312ef66750ef14961" }, -- for formatters and linters
  { "folke/trouble.nvim" }, -- display the qf window for stuff
  { "ray-x/lsp_signature.nvim" }, -- show function lsp signature
  -- }}}
  -- {"davidgranstrom/nvim-markdown-preview"} -- alternative preview plugin
  --}}}
  --
  -- debug adaptor protocol {{{}
  { "mfussenegger/nvim-dap" },
  { "Pocco81/DAPInstall.nvim" },
  { "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function() require("dapui").setup() end, },
  { "theHamsta/nvim-dap-virtual-text",
    config = function() require("nvim-dap-virtual-text").setup() end, },
  { "jbyuki/one-small-step-for-vimkind" },
  -- }}}

  -- telescope {{{
  { "nvim-telescope/telescope.nvim" },
  { { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, },
  { { "nvim-telescope/telescope-ui-select.nvim" }, },
  -- }}}

  -- git stuff
  { "lewis6991/gitsigns.nvim" },
  { "sindrets/diffview.nvim", },
  { "TimUntersberger/neogit",
    config = function() require("neogit").setup({ integrations = { diffview = true }, }) end,
  },

  -- interface navigation
  { "numToStr/Navigator.nvim" },

  -- commentary
  { "numToStr/Comment.nvim" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  -- pairing plugins
  { "windwp/nvim-autopairs" }, -- autopair brackets and quotations
  { "windwp/nvim-ts-autotag" }, -- automatically add tags to end of documents
  { "machakann/vim-sandwich" }, -- surrounding stuff with stuff

  -- utility
  { "gbprod/cutlass.nvim",
    config = function() require("cutlass").setup({ cut_key = "m", }) end, },
  { "folke/persistence.nvim", event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function() require("persistence").setup() end,
  }, -- session manager
  { "ahmedkhalf/project.nvim",
    config = function() require("project_nvim").setup({}) end, }, -- project managing
  { "simnalamburt/vim-mundo",
    cmd = { "MundoToggle" }, }, -- undo viewer
  { "akinsho/toggleterm.nvim",
    version = "v2.*" }, -- toggle nvim terminal
  { "tpope/vim-abolish" }, -- case coersion, substition, abbreviation
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "RRethy/nvim-treesitter-textsubjects",
    config = function()
      require("nvim-treesitter.configs").setup({
        textsubjects = {
          enable = true,
          prev_selection = ",", -- (Optional) keymap to select the previous selection
          keymaps = {
            ["."] = "textsubjects-smart",
            -- [";"] = "textsubjects-container-outer",
            -- ["i;"] = "textsubjects-container-inner",
          },
        },
      })
    end,
  },
  -- cohub gitpilot
  { "github/copilot.vim" },

  -- I have the funny
  -- {{ "alec-gibson/nvim-tetris", opt = true, cmd = { "Tetris" },}}
  -- {{ "vim-denops/denops.vim", opt = true }}
  -- use({
  --  "ryoppippi/bad-apple.vim",
  --  -- opt = true,
  --  -- cmd = "BadApple",
  --  dependencies = "denops.vim",
  -- })
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
