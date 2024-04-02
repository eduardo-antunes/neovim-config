-- O harpoon.nvim introduz uma versão melhorada das tradicionais marcas do vim.
-- Ele permite marcar arquivos, adicionando-as a uma lista específica para o
-- diretório em que se encontram. Diferente das marcas do harpoon, as marcas
-- do harpoon tem a sua posição no arquivo constantemente atualizada e
-- persistem quando o neovim é fechado.

return {
  "theprimeagen/harpoon",
  dependencies = "nvim-lua/plenary.nvim",
  init = function ()
    -- NOTA a versão do 2 harpoon promete ser bem mais extensível ao custo de
    -- não ser compatível com a versão atual, então eu certamente vou ter que
    -- refazer essa parte no futuro.
    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")

    -- Operações básicas do harpoon: ver a lista de arquivos marcados (que
    -- permite edição), e marcar ou desmarcar o arquivo atual.
    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
    vim.keymap.set("n", "<leader>a", mark.add_file)
    vim.keymap.set("n", "<leader>r", mark.rm_file)

    -- Operações de navegação entre marcas: líder + n para ir até a marca do
    -- arquivo de índice n na lista de marcas, onde 0 < n < 5 (nunca precisei
    -- de mais).
    vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
    vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
  end,
}
