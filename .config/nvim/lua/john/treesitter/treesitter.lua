local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = { "lua", "python", "rust", "java", "javascript", "c_sharp" }, -- one of "all", or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "" } }, -- autoindent behaviour
  context_commentstring = { -- commenting behaviour
    enable = true,
    enable_autocmd = false,
  },
  -- TODO extract rainbow into separate file
  rainbow = require("john.treesitter.rainbow"),
  autotag = {
    enable = true,
  },
  textobjects = require("john.treesitter.textobjects"),
})

-- enable folding determined by treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
