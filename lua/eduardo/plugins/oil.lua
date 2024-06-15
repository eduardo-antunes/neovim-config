-- oil.lua: instala e configura o oil, um editor de diretórios que permite
-- visualizá-los como buffers de texto, manipulando arquivos com comandos
-- normais de edição de texto. Muito chique

return {
  "stevearc/oil.nvim",
  opts = {
    columns = {},
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["<CR>"] = false,
      ["<C-s>"] = false,
      ["<C-h>"] = false,
      ["<C-e>"] = "actions.select",
      ["<C-s>"] = "actions.select_split",
      ["<A-s>"] = "actions.select_vsplit",
      ["<C-q>"] = "actions.close",
    },
    view_options = {
      -- Mesmo ao exibir arquivos ocultos, não faz sentido exibir o
      -- pseudo-diretório '..', pois ele não agrega nada, realmente
      is_always_hidden = function(nome, id) return nome == ".." end
    },
  },
  config = function ()
    vim.keymap.set("n", "-", vim.cmd.Oil)
    vim.keymap.set("n", "<c-s>", "<cmd>sp|Oil<cr>")
    vim.keymap.set("n", "<a-s>", "<cmd>vs|Oil<cr>")
  end
}
