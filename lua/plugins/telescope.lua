-- Fuzzy finder para seleção rápida, com velocidade nativa

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  init = function ()

    local t = require("telescope.builtin")
    local tel_grep = function ()
      t.grep_string { search = vim.fn.input("Grep: ") }
    end

    vim.keymap.set("n", "<leader><leader>", t.buffers)
    vim.keymap.set("n", "<leader>.", t.find_files)
    vim.keymap.set("n", "<leader>:", t.commands)
    vim.keymap.set("n", "<leader>?", t.help_tags)
    vim.keymap.set("n", "<leader>/", tel_grep)

    require("telescope").load_extension("fzf")

  end
}
