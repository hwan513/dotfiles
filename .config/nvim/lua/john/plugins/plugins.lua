return {
  { "nvim-lua/plenary.nvim",    lazy = true }, -- Useful lua functions used ny lots of plugins
  { "dstein64/vim-startuptime", cmd = { "StartupTime" }, }, -- startup timer,
  { "folke/which-key.nvim", event = "VeryLazy",
    config = function() require("which-key").setup() end, },
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
    version = "*", dependencies = "kyazdani42/nvim-web-devicons" },
  { "famiu/bufdelete.nvim",
    cmd = "Bdelete" }, -- delete buffers nice
  { "nvim-lualine/lualine.nvim" }, -- status line plugin
  { "lukas-reineke/indent-blankline.nvim" }, -- shows indent level with line
  { "romgrk/nvim-treesitter-context",
    config = function() require("treesitter-context").setup({ enable = false, }) end },
  -- }, -- shows context at higher indent levels
  { "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end }, -- coloring viewer for html css stuff

  -- highlights current thing under cursor
  { "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        delay = 500,
        filetypes_denylist = { "dirvish", "fugitive", "NvimTree", },
        modes_denylist = { "i", "v", "s" },
      })
    end,
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
  { "simrat39/rust-tools.nvim", },
  { "mfussenegger/nvim-jdtls", },
  { "jose-elias-alvarez/null-ls.nvim", },
  { "folke/trouble.nvim" }, -- display the qf window for stuff
  { "ray-x/lsp_signature.nvim" }, -- show function lsp signature

  -- {"davidgranstrom/nvim-markdown-preview"} -- alternative preview plugin

  -- debug adaptor protocol
  -- one day I'll work more on lazy loading eveything
  { "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-dap-virtual-text", "jbyuki/one-small-step-for-vimkind" },
  },
  { "rcarriga/nvim-dap-ui",
    config = function() require("dapui").setup() end, },
  { "theHamsta/nvim-dap-virtual-text",
    config = function() require("nvim-dap-virtual-text").setup() end, },
  { "jbyuki/one-small-step-for-vimkind",        ft = "lua" },

  -- telescope
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope-ui-select.nvim" },

  -- git stuff
  { "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" }, },
  { "sindrets/diffview.nvim",
    cmd = "DiffviewOpen" },
  { "TimUntersberger/neogit", cmd = "Neogit",
    config = function() require("neogit").setup({ integrations = { diffview = true }, }) end, },

  -- interface navigation
  { "numToStr/Navigator.nvim" },

  -- commentary
  { "numToStr/Comment.nvim",
    keys = "gcc" },
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
    config = function() require("project_nvim").setup() end,
    keys = "<leader>fp"
  }, -- project managing
  -- TODO Need to replace { "simnalamburt/vim-mundo", cmd =  "MundoToggle" , }, -- undo viewer
  { "akinsho/toggleterm.nvim",
    version = "*", keys = "<C-\\>",
    config = function() require("john.interface.terminal") end }, -- toggle nvim terminal
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
  { "github/copilot.vim",    cmd = "Copilot" },

  -- I have the funny
  { "alec-gibson/nvim-tetris",
    cmd = "Tetris" },
  { "vim-denops/denops.vim", lazy = true },
  { "ryoppippi/bad-apple.vim",
    cmd = "BadApple",
    dependencies = "denops.vim",
  }
}
