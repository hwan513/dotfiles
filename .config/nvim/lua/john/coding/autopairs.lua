return {
  "windwp/nvim-autopairs",
  event = "VeryLazy",
  opts = {
    fast_wrap = {
      map = "<C-u>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      end_key = "/",
      keys = "aoeuidhtns',.pyfgcrl",
    },
  },
}
