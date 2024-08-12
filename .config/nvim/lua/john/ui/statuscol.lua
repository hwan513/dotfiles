local ft_ignore = require("john.utils").ft_ignore
return {
  "luukvbaal/statuscol.nvim",
  opts = function()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    local builtin = require("statuscol.builtin")
    return {
      -- configuration goes here, for example:
      relculright = true,
      ft_ignore = ft_ignore,
      segments = {
        { sign = { namespace = { "gitsigns" }, colwidth = 1, wrap = true }, click = "v:lua.ScSa" },
        { sign = { namespace = { "diagnostic" }, colwidth = 2, maxwidth = 1 }, click = "v:lua.ScSa" },
        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
        { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
      },
      clickhandlers = { -- builtin click handlers
        FoldOther = false,
      },
    }
  end,
}
