-- Fuzzy finder para seleção rápida, com velocidade nativa

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    pickers = {
      find_files = { follow = true }
    },
    defaults = {
      mappings = {
        i = {
          ["<c-j>"] = "move_selection_next",
          ["<c-k>"] = "move_selection_previous",
        },
      },
    },
  },
  init = function ()
    local t = require("telescope.builtin")
    local grep_prompt = function ()
      t.grep_string { search = vim.fn.input("Grep: ") }
    end
    local find_all = function ()
      t.find_files { hidden = true, no_ignore = true }
    end

    vim.keymap.set("n", "<leader> ", t.buffers     )
    vim.keymap.set("n", "<leader>.", t.find_files  )
    vim.keymap.set("n", "<leader>:", t.commands    )
    vim.keymap.set("n", "<leader>K", t.man_pages   )
    vim.keymap.set("n", "<leader>G", t.git_commits )
    vim.keymap.set("n", "<leader>H", t.help_tags   )
    vim.keymap.set("n", "<leader>/", grep_prompt   )
    vim.keymap.set("n", "<c-f>", find_all )

    require("telescope").load_extension("fzf")
  end,
}
