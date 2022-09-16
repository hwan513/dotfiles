return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "hs" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
          ["/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/"] = true,
          ["/Users/henrywang/.hammerspoon/Spoons/EmmyLua.spoon/annotations"] = true,
        },
      },
      format = {
        enable = true,
        -- Put format options here
        -- NOTE: the value should be STRING!!
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          quote_style = "double",
          max_line_length = "120",
          trailing_table_separator = "smart",
        },
      },
    },
  },
}
