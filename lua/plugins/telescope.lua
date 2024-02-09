-- Fuzzy finder para seleção rápida, com velocidade nativa

local function grep_prompt()
  require("telescope.builtin").grep_string {
    search = vim.fn.input("Pesquisar: ")
  }
end

local function find_all()
  require("telescope.builtin").find_files {
    hidden = true, no_ignore = true
  }
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  init = function ()
    local tb = require("telescope.builtin")
    vim.keymap.set("n", "<leader> ", tb.buffers)
    vim.keymap.set("n", "<leader>.", tb.find_files)
    vim.keymap.set("n", "<leader>:", tb.commands)
    vim.keymap.set("n", "<leader>K", tb.man_pages)
    vim.keymap.set("n", "<leader>G", tb.git_commits)
    vim.keymap.set("n", "<leader>H", tb.help_tags)
    vim.keymap.set("n", "<leader>/", grep_prompt)
    vim.keymap.set("n", "<C-f>", find_all)

    require("telescope").load_extension("fzf")
  end,
}
