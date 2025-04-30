local ft_ignore = require("john.utils").ft_ignore

-- LSP workspace rename on file rename
vim.api.nvim_create_autocmd("User", {
  pattern = "OilActionsPost",
  callback = function(event)
    if event.data.actions.type == "move" then
      Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
    end
  end,
})
local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
vim.api.nvim_create_autocmd("User", {
  pattern = "NvimTreeSetup",
  callback = function()
    local events = require("nvim-tree.api").events
    events.subscribe(events.Event.NodeRenamed, function(data)
      if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
        data = data
        Snacks.rename.on_rename_file(data.old_name, data.new_name)
      end
    end)
  end,
})

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    -- explorer = { enabled = true },
    gitbrowse = { enabled = true, notify = false, what = "repo" },
    image = { enabled = true },
    indent = {
      enabled = true,
      animate = {
        enabled = false,
      },
      filter = function(buf)
        return vim.g.snacks_indent ~= false
          and vim.b[buf].snacks_indent ~= false
          and vim.bo[buf].buftype == ""
          and not vim.tbl_contains(ft_ignore, vim.b[buf].filetype)
      end,
    },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scope = { enabled = true },
    scratch = { enabled = true },
    words = { enabled = true },
  },
  -- stylua: ignore start
  keys = {
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Open Git repo in browser" },
    { "<leader>ss", function() Snacks.scratch() end, desc = "Open Scratch buffer" },
    { "<leader>sl", function() Snacks.scratch.select() end, desc = "Select file in Scratch buffer" },
    { "<A-p>", function() Snacks.words.jump(-1, true) end, desc = "Previous lsp reference" },
    { "<A-n>", function() Snacks.words.jump(1, true) end, desc = "Next lsp reference" },

    -- Picker keymaps
    { "<leader>.", function() Snacks.picker() end, desc = "Show Picker" },
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>[", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>]", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>'", function() Snacks.picker.registers() end, desc = "Registers" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>?", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>;", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },

    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files({hidden=true}) end, desc = "Find Files" },
    { "<leader>fl", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>fD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
  },
  -- stylua: ignore end
}
