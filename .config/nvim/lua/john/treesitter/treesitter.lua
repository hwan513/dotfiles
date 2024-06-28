local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = {
    -- main development languages
    "lua",
    "python",
    "rust",
    "java",
    "c",

    -- web tech
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",

    -- other
    "typst",
    "c_sharp",
    "vim",
    "regex",
    "bash",
    "markdown",
    "markdown_inline"
  },                             -- one of "all", or a list of languages
  sync_install = false,          -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,               -- false will disable the whole extension
    disable = { "" },            -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "python" } }, -- autoindent behaviour
})

-- enable folding determined by treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
