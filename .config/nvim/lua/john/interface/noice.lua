local status_ok, noice = pcall(require, "noice")
if not status_ok then
  return
end
noice.setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  messages = {
    max_width = 10,
  },
  views = {
    notify = {
      border = {
        style = "none",
        -- style = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
        padding = { 1, 3 },
      },
      -- win_options = { winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder', },
      position = { row = 14, col = "50%" },
    },
  },

  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  routes = {
    {
      filter = {
        event = "notify",
        min_width = 60,
      },
      view = "split",
    },
    {
      filter = {
        event = "messages",
        min_width = 60,
      },
      view = "split",
    },
    {
      filter = {
        event = "Error",
        min_width = 60,
      },
      view = "split",
    },
  },
})

require("telescope").load_extension("noice")
