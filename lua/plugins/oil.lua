-- O oil.nvim é um editor/explorador de arquivos bastante similar ao dired do
-- emacs, ao menos em espírito. Ele permite editar o conteúdo de diretórios
-- como um buffer normal, o que é muito intuitivo e permite usar todos os
-- recursos de edição do neovim para manipular arquivos.

return {
  "stevearc/oil.nvim",
  opts = {
    -- As colunas exibidas na edição de diretórios fornecem mais
    -- informação sobre cada arquivo. Coloquei tamanho e permissões para que
    -- o visual fosse mais parecido com o de dired, e por ser útil.
    columns = {
      { "size", highlight = "Number" },
      { "permissions", highlight = "String" },
    },
    constrain_cursor = "name", -- se tiver de editar permissões, uso o terminal
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
