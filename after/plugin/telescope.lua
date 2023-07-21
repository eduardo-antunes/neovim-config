-- Configurações para o plugin telescope.nvim

local tel = require("telescope.builtin")
local function tel_grep()
  tel.grep_string { search = vim.fn.input("Grep: ") }
end
vim.keymap.set("n", "<leader><leader>", tel.buffers)
vim.keymap.set("n", "<leader>.", tel.find_files)
vim.keymap.set("n", "<leader>:", tel.commands)
vim.keymap.set("n", "<leader>?", tel.help_tags)
vim.keymap.set("n", "<leader>/", tel_grep)
