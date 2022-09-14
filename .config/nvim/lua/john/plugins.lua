-- initial commands {{{
local fn = vim.fn
-- }}}
-- Automatically install packer {{{
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end
-- }}}
-- Autocommand that reloads packer and creates snapshot when plugins.lua file  is written {{{

local packer_user_config = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  callback = function()
    vim.api.nvim_exec(
      [[
      source <afile>
      PackerSync
      PackerSnapshotDelete plugins.lock
      PackerSnapshot plugins.lock
      ]],
      { output = false }
    )
  end,
  group = packer_user_config,
})

-- }}}
-- Use a protected call so we don't error out on first use {{{
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end
-- }}}

-- Have packer use a popup window {{{
packer.init({
  -- snapshot = true, -- Name of the snapshot you would like to load at startup
  snapshot_path = fn.stdpath("config") .. "/lua/john", -- Default save directory for snapshots
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})
-- }}}

-- Install your plugins here {{{
return packer.startup(function(use)
  -- pin plugin to commit
  -- commit = "string"
  -- initial plugins {{{
  use("lewis6991/impatient.nvim") -- faster loading
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nathom/filetype.nvim") -- faster loading
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use({ "dstein64/vim-startuptime", opt = true, cmd = { "Startup" } }) -- startup timer
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })
  -- }}}
  -- coloring things {{{
  use({ "folke/tokyonight.nvim", tag = "3c05c5ad8e2611da1514d1c633b677e956fbb0ce" }) -- colourscheme
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- better syntax highlighting and other stuff
  use("p00f/nvim-ts-rainbow") -- bracket pair matching
  -- }}}
  -- user interface {{{
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
  use("famiu/bufdelete.nvim") -- delete buffers nice
  use("nvim-lualine/lualine.nvim") -- status line plugin
  use("lukas-reineke/indent-blankline.nvim") -- shows indent level with line
  use({
    "romgrk/nvim-treesitter-context",
    config = {
      require("treesitter-context").setup({
        enable = false,
      }),
    },
  }) -- shows context at higher indent levels
  use({ "norcalli/nvim-colorizer.lua", config = { require("colorizer").setup() } }) -- coloring viewer for html css stuff
  -- highlights current thing under cursor
  use({
    "RRethy/vim-illuminate",
    config = {
      require("illuminate").configure({
        delay = 500,
        filetypes_denylist = {
          "dirvish",
          "fugitive",
          "NvimTree",
        },
        modes_denylist = { "i", "v", "s" },
      }),
    },
  })
  -- }}}
  -- completion {{{
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp") -- lsp completions
  use("hrsh7th/cmp-nvim-lua") -- lua completions for nvim config
  use("andersevenrud/cmp-tmux") -- tmux completions
  -- }}}
  -- snippets {{{
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
  -- use("honza/vim-snippets") -- more snippets
  -- }}}
  -- language server protocol {{{

  use("neovim/nvim-lspconfig") -- enable LSP
  -- use mason for lsp installation
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
  -- use mason for null ls installation
  use("WhoIsSethDaniel/mason-tool-installer.nvim")
  use({
    "jayp0521/mason-null-ls.nvim",
    after = {
      "null-ls.nvim",
      "mason.nvim",
    },
  })
  use("simrat39/rust-tools.nvim")
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use("folke/trouble.nvim") -- display the qf window for stuff
  use("ray-x/lsp_signature.nvim") -- show function lsp signature
  -- }}}
  --markdown {{{
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown", "rmarkdown" }
    end,
    ft = { "markdown", "rmarkdown" },
    cmd = { "MarkdownPreview" },
  })
  -- use("davidgranstrom/nvim-markdown-preview") -- alternative preview plugin
  --}}}
  --
  -- debug adaptor protocol {{{}
  use("mfussenegger/nvim-dap")
  use("Pocco81/DAPInstall.nvim")
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")
  use("jbyuki/one-small-step-for-vimkind")
  -- }}}

  -- telescope {{{
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope-ui-select.nvim" })
  -- }}}

  -- git stuff
  use("lewis6991/gitsigns.nvim")

  -- interface navigation
  use({ "numToStr/Navigator.nvim" })

  -- commentary
  use("numToStr/Comment.nvim")
  use({ "JoosepAlviste/nvim-ts-context-commentstring", after = "Comment.nvim" })

  -- pairing plugins
  use("windwp/nvim-autopairs") -- autopair brackets and quotations
  use("windwp/nvim-ts-autotag") -- automatically add tags to end of documents
  use("machakann/vim-sandwich") -- surrounding stuff with stuff

  -- utility
  use({
    "gbprod/cutlass.nvim",
    config = function()
      require("cutlass").setup({
        cut_key = "m",
      })
    end,
  })
  use({
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  }) -- session manager
  use({
    "simnalamburt/vim-mundo",
    cmd = { "MundoToggle" },
  }) -- undo viewer
  use({ "akinsho/toggleterm.nvim", tag = "v2.*" }) -- toggle nvim terminal
  use("tpope/vim-abolish") -- case coersion, substition, abbreviation
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use({
    "RRethy/nvim-treesitter-textsubjects",
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
  })

  -- cohub gitpilot
  use("github/copilot.vim")

  -- I have the funny
  -- use({ "alec-gibson/nvim-tetris", opt = true, cmd = { "Tetris" } })
  -- use({ "vim-denops/denops.vim", opt = true })
  -- use({
  -- 	"ryoppippi/bad-apple.vim",
  -- 	-- opt = true,
  -- 	-- cmd = "BadApple",
  -- 	requires = "denops.vim",
  -- 	after = "denops.vim",
  -- })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
-- }}}
-- vim:foldmethod=marker:foldlevel=5
