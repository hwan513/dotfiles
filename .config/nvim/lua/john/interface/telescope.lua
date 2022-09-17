local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local keymap = vim.api.nvim_set_keymap -- keymaps function shortened
local opts = { noremap = true, silent = true }

keymap("n", "<Leader>ft", ":Telescope builtin<cr>", opts)
keymap("n", "<Leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<Leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<Leader>fb", ":Telescope buffers<cr>", opts)
keymap("n", "<Leader>fh", ":Telescope command_history<cr>", opts)
keymap("n", "<Leader>fr", ":Telescope lsp_references<cr>", opts)
keymap("n", "<Leader>fs", ":Telescope search_history<cr>", opts)
keymap("n", "<Leader>fc", ":Telescope commands<cr>", opts)
keymap("n", "<Leader>fp", ":Telescope projects<cr>", opts)
keymap("n", "<Leader><Space>", ":Telescope current_buffer_fuzzy_find<cr>", opts)

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("projects")

local actions = require("telescope.actions")
-- trouble integration with telescope
local trouble = require("trouble.providers.telescope")

telescope.setup({
  defaults = {
    prompt_prefix = "  ",
    selection_caret = "  ",
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,

        ["<Esc>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,

        ["<CR>"] = actions.select_default,
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
        ["<c-t>"] = trouble.open_with_trouble, -- trouble integration
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
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
        ["<c-t>"] = trouble.open_with_trouble, -- trouble integration
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
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
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    },
  },
})
