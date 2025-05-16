return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
      { "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
    },
    opts = {
      integrations = { diffview = true, snacks = true },
      commit_editor = {
        staged_diff_split_kind = "auto",
      },
    },
    cmd = "Neogit",
    keys = { { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" } },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      attach_to_untracked = true,
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- Navigation
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev hunk")

      -- stylua: ignore start
      map("n", "]H", function() gs.nav_hunk("last") end, "Last hunk")
      map("n", "[H", function() gs.nav_hunk("first") end, "First hunk")
      map({"n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
      map({"n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
      map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
      map("n", "<leader>gp", gs.preview_hunk_inline, "Preview hunk inline")
      map("n", "<leader>gP", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
      map("n", "<leader>gB", gs.blame, "Toggle line blame")
      map("n", "<leader>gd", gs.diffthis, "Diff current file")
      map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff this ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns select hunk")
        -- stylua: ignore end
      end,
    },
  },
}
