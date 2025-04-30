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
    -- picker = { enabled = true },
    notifier = { enabled = true },
    -- quickfile = { enabled = true },
    rename = { enabled = true },
    scope = { enabled = true },
    scratch = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
  keys = {
    { "<leader>go", "<cmd>lua Snacks.gitbrowse()<cr>", desc = "Open Git repo in browser" },
    { "<leader>ss", "<cmd>lua Snacks.scratch()<cr>", desc = "Open Scratch buffer" },
    { "<leader>sl", "<cmd>lua Snacks.scratch.select()<cr>", desc = "Select file in Scratch buffer" },
  },
}
