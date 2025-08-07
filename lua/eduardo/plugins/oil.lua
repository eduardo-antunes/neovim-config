-- plugins/oil.lua: configura o gerenciador de arquivos oil.nvim

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
    -- Mesmo ao exibir arquivos ocultos, não faz sentido exibir o
    -- pseudo-diretório '..', pois ele não agrega nada, realmente
    is_always_hidden = function(nome, id) return nome == ".." end
  },
}
vim.keymap.set("n", "-", vim.cmd.Oil)
vim.keymap.set("n", "<c-s>", "<cmd>vs|Oil<cr>")
