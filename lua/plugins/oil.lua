-- O oil.nvim é um editor/explorador de arquivos que permite editar os
-- conteúdos de diretórios como se eles fossem buffers de texto normais. Eu o
-- prefiro ao editor nativo netrw por ser mais rápido e intuitivo

return {
  "stevearc/oil.nvim",
  opts = {
    -- Mova arquivos para o lixo quando eles são removidos no oil (depende do
    -- programa trash-cli no Linux)
    delete_to_trash = true,
    -- Atalhos de teclado mais intuitivos
    use_default_keymaps = false,
    keymaps = {
      ["~"] = "actions.cd",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["g."] = "actions.toggle_hidden",
      ["gs"] = "actions.change_sort",
      ["g?"] = "actions.show_help",
      ["gt"] = "actions.open_terminal",
      ["g\\"] = "actions.toggle_trash",
      ["<c-e>"] = "actions.select",
      ["<c-s>"] = "actions.select_split",
      ["<a-s>"] = "actions.select_vsplit",
      ["<c-t>"] = "actions.select_tab",
      ["<c-q>"] = "actions.close",
    },
    view_options = {
      -- Mesmo ao exibir arquivos ocultos, não faz sentido exibir o
      -- pseudo-diretório '..', pois ele não agrega nada no oil
      is_always_hidden = function(nome, id) return nome == ".." end
    },
  },
  init = function ()
    vim.keymap.set("n", "-", vim.cmd.Oil)
    vim.keymap.set("n", "<c-s>", "<cmd>sp|Oil<cr>")
    vim.keymap.set("n", "<a-s>", "<cmd>vs|Oil<cr>")
  end
}
