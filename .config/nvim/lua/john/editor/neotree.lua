local exec = function(command)
  return function()
    vim.api.nvim_exec2(command, {})
  end
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    "mrbjarksen/neo-tree-diagnostics.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
  },
  opts = {
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
      "diagnostics",
    },
    default_source = "last",
    enable_modified_markers = false,
    filesystem = {
      group_empty_dirs = true, -- when true, empty folders will be grouped together
    },
    source_selector = {
      winbar = true,
      sources = {
        { source = "filesystem" },
        { source = "buffers" },
        { source = "git_status" },
        { source = "document_symbols" },
        { source = "diagnostics" },
      },
      content_layout = "center", -- only with `tabs_layout` = "equal", "focus"
      tabs_layout = "focus", -- start, end, center, equal, focus
    },
    window = {
      mappings = {
        ["1"] = exec("Neotree focus filesystem left"),
        ["2"] = exec("Neotree focus buffers left"),
        ["3"] = exec("Neotree focus git_status left"),
        ["4"] = exec("Neotree focus diagnostics left"),
        ["5"] = exec("Neotree focus document_symbols left"),
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added = "", -- NOTE: you can set any of these to an empty string to not show them
          deleted = "",
          modified = "",
          renamed = "",
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
        align = "right",
      },
    },
  },
}
