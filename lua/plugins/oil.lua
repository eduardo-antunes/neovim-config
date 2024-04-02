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
    -- Mova arquivos para o lixo quando eles são removidos no oil (depende do
    -- programa trash-cli no Linux)
    delete_to_trash = true,
    -- Atalhos de teclado mais intuitivos
    keymaps = {
      ["e"] = "actions.select",
      ["H"] = "actions.select_vsplit",
      ["K"] = "actions.select_split",
      ["gr"] = "actions.refresh",
      ["gt"] = "actions.open_terminal",
      ["<BS>"] = "actions.parent",
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      ["<C-t>"] = false,
    },
    view_options = {
      -- Mesmo ao exibir arquivos ocultos, não faz sentido exibir o
      -- pseudo-diretório '..', pois ele não agrega nada no oil
      is_always_hidden = function(nome, id) return nome == ".." end
    },
  },
  init = function ()
    vim.keymap.set("n", "-", vim.cmd.Oil) -- acesso rápido ao oil
  end
}
