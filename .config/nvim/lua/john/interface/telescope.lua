local multiopen = function(prompt_bufnr)
  local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()

  if vim.tbl_isempty(multi) then
    require("telescope.actions").select_default(prompt_bufnr)
    return
  end

  require("telescope.actions").close(prompt_bufnr)
  for _, entry in pairs(multi) do
    local filename = entry.filename or entry.value
    local lnum = entry.lnum or 1
    local lcol = entry.col or 1
    if filename then
      vim.cmd(string.format("edit +%d %s", lnum, filename))
      vim.cmd(string.format("normal! %dG%d|", lnum, lcol))
    end
  end
end

-- TODO: properly configure telescope overall
local setup = function()
  local status_ok, telescope = pcall(require, "telescope")
  if not status_ok then
    return
  end

  telescope.load_extension("fzf")
  telescope.load_extension("ui-select")
  telescope.load_extension("undo")
  telescope.load_extension("neoclip")
  telescope.load_extension("frecency")

  local actions = require("telescope.actions")
  -- TODO: properly configure trouble integration with telescope

  telescope.setup({
    defaults = {
      prompt_prefix = "  ",
      selection_caret = "  ",
      path_display = { "smart" },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case", -- optional
        "--hidden", -- searh hidden files
        "-g",
        "!.git/", -- don't search git folders
      },
      mappings = {
        i = {
          ["<CR>"] = multiopen,
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,

          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,

          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-l>"] = actions.complete_tag,
          ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        },

        n = {
          ["<CR>"] = multiopen,
          ["<esc>"] = actions.close,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["gg"] = actions.move_to_top,
          ["G"] = actions.move_to_bottom,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,

          ["?"] = actions.which_key,
        },
      },
    },
    pickers = {
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({
          -- even more opts
        }),
      },
      undo = {
        -- telescope-undo.nvim config, see below
      },
    },
  })
end

return {
  keys = {
    { "<Leader>ft", "<cmd>Telescope builtin<cr>", desc = "Open Telescope" },
    { "<Leader>ff", "<cmd>Telescope find_files find_command=fd,-H,--type,file<cr>", desc = "Find Files" },
    { "<Leader>fe", "<cmd>Telescope frecency<cr>", desc = "Find Most Frecent Files" },
    { "<Leader>fg", "<cmd>Telescope live_grep find_command=rg,--hidden<cr>", desc = "Grep Repo" },
    { "<Leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<Leader>fh", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<Leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "Lsp Reference" },
    { "<Leader>fs", "<cmd>Telescope search_history<cr>", desc = "Search History" },
    { "<Leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    -- { "<Leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
    { "<Leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo" },
    { "<Leader><Space>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Search Buffer" },
    { "<Leader>'", "<cmd>Telescope neoclip<cr>", desc = "Clipboard" },
  },
  setup = setup,
}
