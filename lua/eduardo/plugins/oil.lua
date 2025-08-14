-- plugins/oil.lua: configura o melhor gerenciador de arquivos para o neovim

require("oil").setup {
  columns = {},
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  keymaps = {
    ["<CR>"] = false,
    ["<C-s>"] = false,
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    ["<C-e>"] = "actions.select",
    ["<C-s>"] = "actions.select_vsplit",
    ["<C-q>"] = "actions.close",
    ["gr"]    = { "actions.refresh", mode = "n" }
  },
  view_options = {
    is_always_hidden = function(nome, id) return nome == ".." end
  },
}
vim.keymap.set("n", "-", vim.cmd.Oil)
vim.keymap.set("n", "<leader>-", "<cmd>vs|Oil<cr>")
