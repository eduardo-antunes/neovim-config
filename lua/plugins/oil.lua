-- O oil.nvim é um editor de diretórios que permite a manipulação dos seus
-- conteúdos como se eles fossem buffers de texto; melhor que o netrw

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
      -- pseudo-diretório '..', pois ele não agrega nada no oil
      is_always_hidden = function(nome, id) return nome == ".." end
    },
  },
  config = function ()
    vim.keymap.set("n", "-", vim.cmd.Oil)
    vim.keymap.set("n", "<c-s>", "<cmd>sp|Oil<cr>")
    vim.keymap.set("n", "<a-s>", "<cmd>vs|Oil<cr>")
  end
}
